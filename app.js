document.addEventListener('DOMContentLoaded', async () => {
    try {
        const response = await fetch('http://localhost:3001/movies');
        if (!response.ok) {
            throw new Error(`HTTP error! status: ${response.status}`);
        }
        const movies = await response.json();
        const moviesContainer = document.getElementById('movies');

        movies.forEach(movie => {
            const movieElement = document.createElement('div');
            movieElement.className = 'movie';
            movieElement.innerHTML = `
                <img src="assets/${movie.name}.jpeg" alt="${movie.name}">
                <h2>${movie.name}</h2>
                <p>${movie.description}</p>
            `;
            movieElement.addEventListener('click', () => showMovieDetails(movie));
            moviesContainer.appendChild(movieElement);
        });
    } catch (error) {
        console.error('Failed to fetch movies:', error);
        const moviesContainer = document.getElementById('movies');
        moviesContainer.textContent = 'Failed to fetch movies';
    }
});

// Modal elementleri
const loginModal = document.getElementById('login-modal');
const registerModal = document.getElementById('register-modal');
const movieModal = document.getElementById('movie-modal');
const movieTitle = document.getElementById('movie-title');
const movieDescription = document.getElementById('movie-description');
const movieDuration = document.getElementById('movie-duration');
const movieRate = document.getElementById('movie-rate');
const movieGenre = document.getElementById('movie-genre');
const loginButton = document.getElementById('login-button');
const registerButton = document.getElementById('register-button');
const closeModalElements = document.getElementsByClassName('close');
const userInfo = document.getElementById('user-info');
const profileMenu = document.getElementById('profile-menu');
const profileSettingsButton = document.getElementById('profile-settings-button');
const logoutButton = document.getElementById('logout-button');
const userEmail = document.getElementById('user-email');

// Login butonuna tıklama olayı
loginButton.onclick = function() {
    loginModal.style.display = 'block';
}

// Register butonuna tıklama olayı
registerButton.onclick = function() {
    registerModal.style.display = 'block';
}

// Modal kapatma
Array.from(closeModalElements).forEach(close => {
    close.onclick = function() {
        close.parentElement.parentElement.style.display = 'none';
    }
});

// Modal dışına tıklama ile kapatma
window.onclick = function(event) {
    if (event.target == loginModal) {
        loginModal.style.display = 'none';
    }
    if (event.target == registerModal) {
        registerModal.style.display = 'none';
    }
    if (event.target == movieModal) {
        movieModal.style.display = 'none';
    }
    if (event.target != userEmail && !userEmail.contains(event.target) && !profileMenu.contains(event.target)) {
        profileMenu.style.display = 'none';
    }
}

// Kullanıcı giriş işlemleri
const handleUserLogin = (username) => {
    loginButton.style.display = 'none';
    registerButton.style.display = 'none';
    userInfo.style.display = 'inline';
    userEmail.textContent = username;
    userEmail.style.display = 'inline';
};

// Kullanıcı çıkış işlemi
const handleLogout = () => {
    fetch('http://localhost:3001/logout', { method: 'POST' })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                loginButton.style.display = 'inline';
                registerButton.style.display = 'inline';
                userInfo.style.display = 'none';
                userEmail.style.display = 'none';
                profileMenu.style.display = 'none';
            } else {
                alert(data.message);
            }
        })
        .catch(error => console.error('Error:', error));
};

// Profil menüsünü tıklama ile açma/kapama
userEmail.addEventListener('click', (event) => {
    event.preventDefault();
    profileMenu.style.display = profileMenu.style.display === 'block' ? 'none' : 'block';
});

// Profil ayarları butonuna tıklama olayı
profileSettingsButton.onclick = function() {
    window.location.href = 'http://localhost:5500/profile/';
};

// Film detaylarını gösteren fonksiyon
function showMovieDetails(movie) {
    movieTitle.textContent = movie.name;
    movieDescription.textContent = movie.description;
    movieDuration.textContent = movie.duration;
    movieRate.textContent = movie.rate;
    movieGenre.textContent = movie.genre;
    movieModal.style.display = 'block';
}

// Login formu gönderme olayı
document.getElementById('login-form').addEventListener('submit', function(event) {
    event.preventDefault();
    const email = document.getElementById('login-email').value;
    const password = document.getElementById('login-password').value;

    fetch('http://localhost:3001/login', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({ email, password })
    })
    .then(response => response.json())
    .then(data => {
        if (data.name) {
            handleUserLogin(data.name);
            loginModal.style.display = 'none';
        } else {
            alert(data.message);
        }
    })
    .catch(error => console.error('Error:', error));
});

// Register formu gönderme olayı
document.getElementById('register-form').addEventListener('submit', function(event) {
    event.preventDefault();
    const email = document.getElementById('register-email').value;
    const name = document.getElementById('register-name').value;
    const surname = document.getElementById('register-surname').value;
    const password = document.getElementById('register-password').value;
    const confirmPassword = document.getElementById('register-confirm-password').value;
    const birthDate = document.getElementById('register-birth-date').value;

    if (password !== confirmPassword) {
        alert("Passwords do not match!");
        return;
    }

    fetch('http://localhost:3001/register', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({ email, name, surname, password, birth_date: birthDate })
    })
    .then(response => response.json())
    .then(data => {
        if (data.user) {
            handleUserLogin(name);
            registerModal.style.display = 'none';
        } else {
            alert(data.message);
        }
    })
    .catch(error => console.error('Error:', error));
});

// Logout butonuna tıklama olayı
logoutButton.addEventListener('click', handleLogout);
