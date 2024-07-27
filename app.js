document.addEventListener('DOMContentLoaded', async () => {
    // Kullanıcı bilgilerini localStorage'dan al
    const username = localStorage.getItem('username');
    if (username) {
        handleUserLogin(username);
    }

    // Film verilerini almak için sunucuya istek gönder
    try {
        const response = await fetch('http://localhost:3001/movies');
        if (!response.ok) {
            throw new Error(`HTTP error! status: ${response.status}`);
        }
        const movies = await response.json();
        const moviesContainer = document.getElementById('movies');

        // Film verilerini ekrana yerleştir
        movies.forEach(movie => {
            const movieElement = document.createElement('div');
            movieElement.className = 'movie';
            movieElement.innerHTML = `
                <img src="${movie.image_id}" alt="${movie.name}">
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
    // Purchase button element
    var purchaseButton = document.getElementById("purchase-button");
    // Ticket purchase form element
    var ticketPurchaseForm = document.getElementById("ticket-purchase-form");

    // Add click event listener to the purchase button
    purchaseButton.addEventListener("click", function () {
        // Show the ticket purchase form if it is not already visible
        if (ticketPurchaseForm.style.display === "none") {
            ticketPurchaseForm.style.display = "block";
        }
    });
});



// Modal elementleri
const loginModal = document.getElementById('login-modal');
const registerModal = document.getElementById('register-modal');
const showRegisterLink = document.getElementById('show-register');
const showLoginLink = document.getElementById('show-login');
const movieModal = document.getElementById('movie-modal');
const movieTitle = document.getElementById('movie-title');
const movieDescription = document.getElementById('movie-description');
const movieDuration = document.getElementById('movie-duration');
const movieRate = document.getElementById('movie-rate');
const movieGenre = document.getElementById('movie-genre');
const moviePoster = document.getElementById('movie-poster');
const loginButton = document.getElementById('login-button');
const registerButton = document.getElementById('register-button');
const closeModalElements = document.getElementsByClassName('close');
const userInfo = document.getElementById('user-info');
const profileMenu = document.getElementById('profile-menu');
const profileSettingsButton = document.getElementById('profile-settings-button');
const logoutButton = document.getElementById('logout-button');
const userEmail = document.getElementById('user-email');
const ticketsModal = document.getElementById('tickets-modal');
const ticketsContainer = document.getElementById('tickets-container');
const myTicketsButton = document.getElementById('my-tickets-button');

myTicketsButton.onclick = function() {
    ticketsModal.style.display = 'block';
    loadUserTickets(); // Kullanıcının biletlerini yükle
};

// Biletleri yükleyen fonksiyon
const loadUserTickets = async () => {
    const userId = localStorage.getItem('userId');
    if (!userId) return;

    try {
        const response = await fetch(`http://localhost:3001/tickets/user/${userId}`);
        if (!response.ok) {
            throw new Error(`HTTP error! status: ${response.status}`);
        }
        const tickets = await response.json();

        // Biletleri ekrana yerleştir
        ticketsContainer.innerHTML = '';
        tickets.forEach(async ticket => {
            const ticketElement = document.createElement('div');
            ticketElement.className = 'ticket';
            const movieRes = await fetch(`http://localhost:3001/movies/${ticket.movie_id}`);
            const movie = await movieRes.json();

            const cinemaRes = await fetch(`http://localhost:3001/cinemas/${ticket.cinema_id}`);
            const cinema = await cinemaRes.json();

            const theaterRes = await fetch(`http://localhost:3001/theaters/${ticket.theater_id}`);
            const theater = await theaterRes.json();
            
            const seatRes = await fetch(`http://localhost:3001/seats/${ticket.seat_id}`);
            const seat = await seatRes.json();
            

            ticketElement.innerHTML = `
                <img src="${movie.image_id}" alt="${movie.name}">
                <h2>${movie.name}</h2>
                <p>Cinema: ${cinema.name}</p>
                <p>Theater Number: ${theater.theater_no}</p>
                <p>Seat Location: SEATLERİ GETİREMİYORUM NEDENİNİ ANLAMADIM</p>
                <p>Day: ${ticket.day}</p>
                <p>Time: ${ticket.showtime}</p>
            `;
            ticketsContainer.appendChild(ticketElement);
        });
    } catch (error) {
        console.error('Failed to fetch tickets:', error);
        ticketsContainer.textContent = 'Failed to fetch tickets';
    }
};

// Modal kapatma
Array.from(closeModalElements).forEach(close => {
    close.onclick = function() {
        close.parentElement.parentElement.style.display = 'none';
    }
});

// Modal dışına tıklama ile kapatma
window.onclick = function(event) {
    if (event.target == ticketsModal) {
        ticketsModal.style.display = 'none';
    }
};

showRegisterLink.onclick = function() {
    loginModal.style.display = 'none';
    registerModal.style.display = 'block';
};

// Giriş yap linkine tıklama olayı
showLoginLink.onclick = function() {
    registerModal.style.display = 'none';
    loginModal.style.display = 'block';
};


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
    if (event.target == ticketsModal) {
        ticketsModal.style.display = 'none';
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
    userEmail.textContent = `Merhaba, ${username.charAt(0).toUpperCase()}${username.substring(1)}`; // Kullanıcı adını “Merhaba [isim]” şeklinde göster
    userEmail.style.display = 'inline';
};

// Kullanıcı çıkış işlemi
const handleLogout = () => {
    fetch('http://localhost:3001/logout', { method: 'POST' })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                // localStorage'dan kullanıcı bilgilerini temizleyin
                localStorage.removeItem('userId');
                localStorage.removeItem('username');
                
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

async function showMovieDetails(movie) {
    console.log('Selected movie:', movie); // Debug: movie nesnesini kontrol et
    var movieTitle = document.getElementById('movie-title');
    var movieDescription = document.getElementById('movie-description');
    var movieDuration = document.getElementById('movie-duration');
    var movieRate = document.getElementById('movie-rate');
    var movieGenre = document.getElementById('movie-genre');
    var moviePoster = document.getElementById('movie-poster');
    var movieModal = document.getElementById('movie-modal');
    var ticketPurchaseForm = document.getElementById('ticket-purchase-form');
    var purchaseButton = document.getElementById('purchase-button');

    // Her yeni film seçildiğinde formu ve butonu sıfırla
    ticketPurchaseForm.style.display = 'none';
    purchaseButton.disabled = false;

    movieTitle.textContent = movie.name;
    movieDescription.textContent = movie.description;
    movieDuration.textContent = movie.duration;
    movieRate.textContent = movie.rate;
    movieGenre.textContent = movie.genre;
    moviePoster.src = movie.image_id;
    moviePoster.alt = movie.name;
    movieModal.style.display = 'block';

    try {
        const response = await fetch(`http://localhost:3001/movie/${movie.id}/showtimes`);
        const data = await response.json();

        const citySelect = document.getElementById('city-select');
        const showtimeSelect = document.getElementById('showtime-select');
        const cinemaSelect = document.getElementById('cinema-select');
        const seatSelect = document.getElementById('seat-select');

        // Önceki seçenekleri temizle
        citySelect.innerHTML = ''; 
        showtimeSelect.innerHTML = ''; 
        cinemaSelect.innerHTML = ''; 
        seatSelect.innerHTML = ''; 

        // Şehir seçeneklerini doldur
        const cities = [...new Set(data.map(show => show.city))];
        cities.forEach(city => {
            const cityOption = document.createElement('option');
            cityOption.value = city;
            cityOption.textContent = city;
            citySelect.appendChild(cityOption);
        });

        // Şehir seçildiğinde yapılacak işlemi ayarla
        citySelect.addEventListener('change', (e) => {
            const selectedCity = e.target.value;
            const filteredShows = data.filter(show => show.city === selectedCity);

            // Sinema seçeneklerini doldur
            const cinemas = [...new Set(filteredShows.map(show => show.cinema))];
            cinemaSelect.innerHTML = '';
            cinemas.forEach(cinema => {
                const cinemaOption = document.createElement('option');
                cinemaOption.value = cinema;
                cinemaOption.textContent = cinema;
                cinemaSelect.appendChild(cinemaOption);
            });

            // Sinema seçildiğinde yapılacak işlemi ayarla
            cinemaSelect.addEventListener('change', (e) => {
                const selectedCinema = e.target.value;
                const filteredShowtimes = filteredShows.filter(show => show.cinema === selectedCinema);

                // Seans seçeneklerini doldur
                const showtimes = [...new Set(filteredShowtimes.map(show => show.showtime))];
                showtimeSelect.innerHTML = '';
                showtimes.forEach(showtime => {
                    const showtimeOption = document.createElement('option');
                    showtimeOption.value = showtime;
                    showtimeOption.textContent = showtime;
                    showtimeSelect.appendChild(showtimeOption);
                });

                // Seans seçildiğinde yapılacak işlemi ayarla
                showtimeSelect.addEventListener('change', (e) => {
                    const selectedShowtime = e.target.value;
                    const filteredSeats = filteredShows.filter(show => show.showtime === selectedShowtime);

                    // Koltuk seçeneklerini doldur
                    const seats = [...new Set(filteredSeats.map(show => show.seat))];
                    seatSelect.innerHTML = '';
                    seats.forEach(seat => {
                        const seatOption = document.createElement('option');
                        seatOption.value = seat;
                        seatOption.textContent = seat;
                        seatSelect.appendChild(seatOption);
                    });
                });
            });
        });
    } catch (error) {
        console.error('Error:', error);
    }
}


// Bilet satın al butonuna tıklama olayı
purchaseButton.addEventListener('click', () => {
    ticketPurchaseForm.style.display = 'block';
});

// Bilet satın al formunu kapatma işlevi
confirmPurchaseButton.addEventListener('click', () => {
    const city = citySelect.value;
    const cinema = cinemaSelect.value;
    const showtime = showtimeSelect.value;
    const seat = seatSelect.value;

    if (!city || !cinema || !showtime || !seat) {
        alert('Please select all options.');
        return;
    }

    // Bilet satın alma isteği gönder
    fetch('http://localhost:3001/purchase-ticket', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({ city, cinema, showtime, seat })
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            alert('Ticket purchased successfully!');
            movieModal.style.display = 'none'; // Modalı kapat
            ticketPurchaseForm.style.display = 'none'; // Formu kapat
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

document.getElementById('login-form').addEventListener('submit', async function(event) {
    event.preventDefault();
    const email = document.getElementById('email').value;
    const password = document.getElementById('password').value;

    try {
        const response = await fetch('http://localhost:3001/login', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({ email, password })
        });

        const data = await response.json();

        if (response.ok) {
            // Kullanıcı ID'sini ve adını localStorage'a kaydedin
            if (data) {
                localStorage.setItem('userId', data.user_id);
                localStorage.setItem('username', data.name);
                window.location.href = 'http://localhost:5500'; // Anasayfaya yönlendir
            } else {
                alert('Invalid response from server.');
            }
        } else {
            alert('Login failed: ' + data.message);
        }
    } catch (error) {
        console.error('Login error:', error);
        alert('An error occurred during login. Please try again later.');
    }
});

// Logout butonuna tıklama olayı
logoutButton.addEventListener('click', handleLogout);