import fetch from 'node-fetch';
import fs from 'fs';
import path from 'path';

// OMDB API key
const apiKey = '15991e40';

// Base URL for OMDB API
const baseUrl = 'https://www.omdbapi.com/';

// Total number of pages to fetch
const totalPages = 15; // For example, 10 pages

// File paths
const dataFilePath = path.resolve('c:\\Users\\halil melih\\dbms_project\\src\\data.mjs');
const sqlFilePath = path.resolve('c:\\Users\\halil melih\\dbms_project\\src\\dbms_project.sql');

// Function to get a random time
function getRandomTime() {
    const hours = Math.floor(Math.random() * 24).toString().padStart(2, '0');
    const minutes = Math.floor(Math.random() * 60).toString().padStart(2, '0');
    return `${hours}:${minutes}`;
}

// Function to get a random day
function getRandomDay() {
    const days = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];
    return days[Math.floor(Math.random() * days.length)];
}

// Function to escape single quotes in SQL
function escapeSingleQuotes(text) {
    return text.replace(/'/g, "''");
}

// Function to generate a float rate close to imdb_rate
function generateFloatRate(imdbRate) {
    const variation = (Math.random() - 0.5) / 2; // Variation between -0.25 and 0.25
    return (parseFloat(imdbRate) + variation).toFixed(1); // Keep one decimal place
}

async function fetchMovies(page) {
    const url = `${baseUrl}?s=movie&page=${page}&apikey=${apiKey}`;
    try {
        const response = await fetch(url);
        const data = await response.json();
        if (data.Response === 'True') {
            return data.Search;
        } else {
            console.error(`API Error on page ${page}:`, data.Error);
            return [];
        }
    } catch (error) {
        console.error(`Fetch Error on page ${page}:`, error);
        return [];
    }
}

async function fetchMovieDetails(imdbID) {
    const url = `${baseUrl}?i=${imdbID}&apikey=${apiKey}`;
    try {
        const response = await fetch(url);
        const data = await response.json();
        if (data.Response === 'True') {
            return {
                movie_id: data.imdbID,
                rate: data.Rated,
                duration: data.Runtime,
                genre: data.Genre,
                name: data.Title,
                imdb_rate: data.imdbRating,
                description: data.Plot,
                image_id: data.Poster
            };
        } else {
            console.error(`API Error for IMDb ID ${imdbID}:`, data.Error);
            return null;
        }
    } catch (error) {
        console.error(`Fetch Error for IMDb ID ${imdbID}:`, error);
        return null;
    }
}

async function fetchAllMovies() {
    let allMovies = [];
    for (let page = 1; page <= totalPages; page++) {
        const movies = await fetchMovies(page);
        allMovies = allMovies.concat(movies);
    }

    const movieDetailsPromises = allMovies
        .filter(movie => movie.Type === 'movie')
        .map(movie => fetchMovieDetails(movie.imdbID));

    const movieDetails = await Promise.all(movieDetailsPromises);

    let sqlStatements = '';
    let movieIdCounter = 20;

    movieDetails.forEach(details => {
        if (details) {
            const floatRate = generateFloatRate(details.imdb_rate);
            const insertStatement = `INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                ${movieIdCounter++},
                ${floatRate},
                '${escapeSingleQuotes(details.duration)}',
                '${escapeSingleQuotes(details.genre)}',
                '${escapeSingleQuotes(details.name)}',
                '${details.imdb_rate}',
                '${escapeSingleQuotes(details.description)}',
                '${getRandomTime()}',
                '${getRandomDay()}',
                1,
                '${escapeSingleQuotes(details.image_id)}'
            );\n`;

            sqlStatements += insertStatement;
        }
    });

    // Write SQL statements to dbms_project.sql file
    fs.writeFileSync(sqlFilePath, sqlStatements, { flag: 'a' });

    console.log(`SQL insert statements have been written to ${sqlFilePath}`);
}

// Call the function
fetchAllMovies();
