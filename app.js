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

    // Bilet satın al butonuna tıklama olayı
    document.getElementById("purchase-button").addEventListener("click", function () {
        if (!localStorage.getItem('userId')) {
            alert('Lütfen giriş yapınız.');
            return;
        }
        const ticketPurchaseForm = document.getElementById("ticket-purchase-form");
        ticketPurchaseForm.style.display = ticketPurchaseForm.style.display === "none" ? "block" : "none";
    });
    document.getElementById("seat-select").addEventListener("click", function () {
        if (!localStorage.getItem('userId')) {
            alert('Lütfen giriş yapınız.');
            return;
        }
        const koltukArkaplan = document.getElementById("koltuk-arkaplan");
        koltukArkaplan.style.display = koltukArkaplan.style.display === "none" ? "block" : "none";
    });
    const movieButtons = document.querySelectorAll('.movie-btn');
    const purchaseButton = document.getElementById('purchase-button');
    const citySelect = document.getElementById('city-select');
    const cinemaSelect = document.getElementById('cinema-select');
    const theaterSelect = document.getElementById('theater-select');
    const showtimeSelect = document.getElementById('showtime-select');
    const seatSelect = document.getElementById('seat-select');
    const movieModal = document.getElementById('movie-modal');
    const ticketPurchaseForm = document.getElementById('ticket-purchase-form');
    const moviePoster = document.getElementById('movie-poster');
    const movieTitle = document.getElementById('movie-title');
    const movieDescription = document.getElementById('movie-description');
    const movieDuration = document.getElementById('movie-duration');
    const movieRate = document.getElementById('movie-rate');
    const movieGenre = document.getElementById('movie-genre');
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
const confirmPurchaseButton = document.getElementById('confirm-purchase-button');
const theaterId = document.getElementById('theater-select');
// Existing code

// Select elements
const purchaseButton = document.getElementById('confirm-purchase-button');
const creditCardModal = document.getElementById('credit-card-modal');
const closeCreditCardModal = creditCardModal.querySelector('.close');
const creditCardForm = document.getElementById('credit-card-form');



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
                <p>Seat Location: ${seat[0].seat_loc}</p>
                <p>Time: ${ticket.day}</p>
                <p>Day: ${ticket.showtime}</p>
                <button class="cancel-button" data-ticket-id="${ticket.ticket_id}">Cancel the Ticket</button>
            `;
            ticketsContainer.appendChild(ticketElement);
        });
    } catch (error) {
        console.error('Failed to fetch tickets:', error);
        ticketsContainer.textContent = 'Failed to fetch tickets';
    }
};

ticketsContainer.addEventListener('click', (event) => {
    if (event.target.classList.contains('cancel-button')) {
        const ticketId = event.target.getAttribute('data-ticket-id');
        cancelTicket(ticketId);
    }
});

const cancelTicket = async (ticketId) => {
    seatId = -1;
    try{
        const ticketRes = await fetch(`http://localhost:3001/tickets/${ticketId}`);
        const ticket = await ticketRes.json();
        seatId = ticket[0].seat_id;
    }catch(error){
        alert(error);
    }   

    try {
        const seatUpdateRes = await fetch(`http://localhost:3001/seats/${seatId}`, {
            method: 'PUT', 
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({
                is_empty: 1,
            }),
        });

        if (!seatUpdateRes.ok) {
            throw new Error(`HTTP error! status: ${seatUpdateRes.status}`);
        }
    } catch (error) {
        console.error('Failed to update seat status:', error);
    }

    try {
        const response = await fetch(`http://localhost:3001/tickets/${ticketId}`, {
            method: 'DELETE'
        });
        if (!response.ok) {
            throw new Error(`HTTP error! status: ${response.status}`);
        }
        loadUserTickets();
    } catch (error) {
        console.error('Failed to cancel ticket:', error);
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
    userEmail.textContent = `Hello ${username.charAt(0).toUpperCase()}${username.substring(1)}!`; // Kullanıcı adını “Merhaba [isim]” şeklinde göster
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

// Şehir seçimi sonrası sinemaları getirme
document.getElementById('city-select').addEventListener('change', async function () {
    const selectedCity = this.value;
    if (!selectedCity) return;
    await getCinemasForCity(selectedCity); // Sinemaları getir
    document.getElementById('showtime-select').innerHTML = '<option value=""></option>'; // Seans seçimini temizle
    document.querySelectorAll('.seat.selected').forEach(seat => seat.classList.remove("selected"));
    document.querySelectorAll('.seat.occupied').forEach(seat => seat.classList.remove("occupied"));
});

// Sinema seçimi sonrası theaterları getirme
document.getElementById('cinema-select').addEventListener('change', async function () {
    const selectedCinemaId = this.value;
    if (!selectedCinemaId) return;
    await gettheatersForCinema(selectedCinemaId); // Theater'ları getirin
    showtimeSelect.innerHTML = '<option value=""></option>'; // Seans seçimini temizleyin
    document.querySelectorAll('.seat.selected').forEach(seat => seat.classList.remove("selected"));
    document.querySelectorAll('.seat.occupied').forEach(seat => seat.classList.remove("occupied"));
});

// Theater seçimi sonrası seansları getirme, theater seçilmeyecek???
document.getElementById('theater-select').addEventListener('change', async function () {
    const selectedtheaterId = this.value;
    const selectedMovieId = document.getElementById('movie-modal').dataset.movieId; // Modal'dan seçilen film ID'sini alın
    if (!selectedtheaterId || !selectedMovieId) return;
    await getShowtimesFortheater(selectedtheaterId, selectedMovieId); // Seansları getirin
    theaterSelect
});

document.getElementById('showtime-select').addEventListener('change', function () {
    const selectedShowtime = this.value.split(' ');
    const showDay = selectedShowtime[0];
    const showHour = selectedShowtime[1];
    const theaterId = document.getElementById('theater-select').value;
    document.querySelectorAll('.seat.selected').forEach(seat => seat.classList.remove("selected"));
    document.querySelectorAll('.seat.occupied').forEach(seat => seat.classList.remove("occupied"));

    if (theaterId) {
        getSeatsForShowtime(theaterId);
    }
});

//async function getSeatsForShowtime(theaterId) {
//    try {
//        const response = await fetch(`http://localhost:3001/seats/theater/${theaterId}`);
//        const seats = await response.json();
//        
//        if (!Array.isArray(seats)) {
//            throw new Error('Invalid data format');
//        }
//
//        const seatSelect = document.getElementById('seat-select');
//        seatSelect.innerHTML = '<option value=""></option>';
//
//        seats.forEach(seat => {
//            if (seat.is_empty) {
//                const option = document.createElement('option');
//                option.value = seat.seat_id;
//                option.textContent = seat.seat_loc;
//                seatSelect.appendChild(option);
//            }
//        });
//    } catch (error) {
//        console.error('Error fetching seats:', error);
//    }
//}

let selectedSeat = null;
async function getSeatsForShowtime(theaterId) {
    try {
        const response = await fetch(`http://localhost:3001/seats/theater/${theaterId}`);
        const seats = await response.json();

        if (!Array.isArray(seats)) {
            throw new Error('Invalid data format');
        }

        seats.forEach(seat => {
            const seatElement = document.querySelector(`.seat-container .seat[data-seat-loc="${seat.seat_loc}"]`);

            if (seatElement) {
                if (!seat.is_empty) {
                    seatElement.classList.add("occupied");
                } 
                else {
                    seatElement.classList.remove("occupied");
                }

                seatElement.addEventListener('click', function() {
                    if (!seatElement.classList.contains("occupied")) {
                        document.querySelectorAll('.seat.selected').forEach(s => s.classList.remove("selected"));
                        seatElement.classList.add("selected");
                        selectedSeat = seat.seat_id ;
                    }
                    else{
                        selectedSeat = null;
                    }
                });
            }
        });

    } catch (error) {
        console.error('Error fetching seats:', error);
    }
}


async function getCinemasForCity(city) {
    try {
        const response = await fetch(`http://localhost:3001/cities/${city}/cinemas`);
        const cinemas = await response.json();
        const cinemaSelect = document.getElementById('cinema-select');
        document.querySelectorAll('.seat.selected').forEach(seat => seat.classList.remove("selected"));
        document.querySelectorAll('.seat.occupied').forEach(seat => seat.classList.remove("occupied"));
        cinemaSelect.innerHTML = '<option value=""></option>';
        cinemas.forEach(cinema => {
            const cinemaOption = document.createElement('option');
            cinemaOption.value = cinema.cinema_id;
            cinemaOption.textContent = cinema.name;
            cinemaSelect.appendChild(cinemaOption);
        });
    } catch (error) {
        console.error('Error fetching cinemas:', error);
    }
}
async function gettheatersForCinema(cinemaId) {
    try {
        const response = await fetch(`http://localhost:3001/cinemas/${cinemaId}/theaters`);
        const theaters = await response.json();
        const theaterSelect = document.getElementById('theater-select');
        document.querySelectorAll('.seat.selected').forEach(seat => seat.classList.remove("selected"));
        document.querySelectorAll('.seat.occupied').forEach(seat => seat.classList.remove("occupied"));
        theaterSelect.innerHTML = '<option value=""></option>';
        theaters.forEach(theater => {
            const theaterOption = document.createElement('option');
            theaterOption.value = theater.theater_id;
            //hardcoded çözüm geçici
            if(theater.theater_id % 2 == 0)
                theaterOption.textContent = `Theater 2`;
            else
            theaterOption.textContent = `Theater 1`;
            theaterSelect.appendChild(theaterOption);
        });
    } catch (error) {
        console.error('Error fetching theaters:', error);
    }
}
async function getShowtimesFortheater(theaterId, movieId) {
    try {
        const response = await fetch(`http://localhost:3001/shows/theater/${theaterId}/movie/${movieId}`);
        const showtimes = await response.json();
        const showtimeSelect = document.getElementById('showtime-select');
        showtimeSelect.innerHTML = '<option value=""></option>';
        showtimes.forEach(showtime => {
            const option = document.createElement('option');
            option.value = `${showtime.show_day} ${showtime.show_hour}`;
            option.textContent = `${showtime.show_day} ${showtime.show_hour}`;
            showtimeSelect.appendChild(option);
        });
    } catch (error) {
        console.error('Error fetching showtimes:', error);
    }
}


// Seçilen sinema ve gösterim için koltukları getirmek
async function handleShowtimeChange() {
    const selectedShowtime = document.getElementById('showtime-select').value;
    const selectedShowtimeArray = selectedShowtime.split(' ');
    const showDay = selectedShowtimeArray[0];
    const showHour = selectedShowtimeArray[1];
    const theaterId = document.getElementById('theater-select').value;

    if (theaterId && showDay && showHour) {
        await getSeatsForShowtime(theaterId, showDay, showHour);
    }
}


document.getElementById('showtime-select').addEventListener('change', handleShowtimeChange);

const youtubeApiKey = 'AIzaSyCTfaHC4lGTh2aSDqrc0kYJS-8LXxaw-LM';

// YouTube API'den fragmanı al
const getMovieTrailerFromYouTube = async (movieTitle) => {
    try {
        const response = await fetch(`https://www.googleapis.com/youtube/v3/search?part=snippet&q=${movieTitle} official trailer&type=video&key=${youtubeApiKey}`);
        const data = await response.json();
        if (data.items && data.items.length > 0) {
            // İlk uygun sonucun fragman olduğunu doğrula
            for (let item of data.items) {
                if (item.snippet.title.toLowerCase().includes("trailer") && item.snippet.title.toLowerCase().includes(movieTitle.toLowerCase())) {
                    return `https://www.youtube.com/embed/${item.id.videoId}`;
                }
            }
            // Eğer uygun sonuç bulunamazsa, ilk sonucu döndür
            return `https://www.youtube.com/embed/${data.items[0].id.videoId}`;
        }
        return null;
    } catch (error) {
        console.error('Error fetching trailer from YouTube:', error);
        return null;
    }
};

async function showMovieDetails(movie) {
    const movieTitle = document.getElementById('movie-title');
    const movieDescription = document.getElementById('movie-description');
    const movieDuration = document.getElementById('movie-duration');
    const movieRate = document.getElementById('movie-rate');
    const movieGenre = document.getElementById('movie-genre');
    const moviePoster = document.getElementById('movie-poster');
    const movieModal = document.getElementById('movie-modal');
    const ticketPurchaseForm = document.getElementById('ticket-purchase-form');
    const purchaseButton = document.getElementById('purchase-button');
    const citySelect = document.getElementById('city-select');
    const cinemaSelect = document.getElementById('cinema-select');
    const theaterSelect = document.getElementById('theater-select');
    const showtimeSelect = document.getElementById('showtime-select');
    const seatSelect = document.getElementById('seat-select');
    const trailerContainer = document.getElementById('trailer-container');

    const trailerUrl = await getMovieTrailerFromYouTube(movie.name);

    // Fragmanı göster
    if (trailerUrl) {
        trailerContainer.innerHTML = `<iframe width="320" height="180" src="${trailerUrl}" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>`;
    } else {
        trailerContainer.innerHTML = 'Trailer not found.';
    }

    // Set movie details
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

    movieModal.dataset.movieId = movie.movie_id;

    citySelect.innerHTML = '<option value="">Seçiniz</option>';
    cinemaSelect.innerHTML = '<option value="">Seçiniz</option>';
    theaterSelect.innerHTML = '<option value="">Seçiniz</option>';
    showtimeSelect.innerHTML = '<option value="">Seçiniz</option>';
    seatSelect.innerHTML = '<option value="">Select Seat</option>';
    const koltukArkaplan = document.getElementById("koltuk-arkaplan");
    koltukArkaplan.style.display = 'none';
    // Yeni film için mevcut koltuk seçimini ve dolu olanları temizle
    document.querySelectorAll('.seat.selected').forEach(seat => seat.classList.remove("selected"));
    document.querySelectorAll('.seat.occupied').forEach(seat => seat.classList.remove("occupied"));

    try {
        const cinemasResponse = await fetch('http://localhost:3001/cinemas');
        const cinemas = await cinemasResponse.json();
        const cityOptions = [...new Set(cinemas.map(cinema => cinema.city))];
        citySelect.innerHTML = '<option value="">Seçiniz</option>';
        cityOptions.forEach(city => {
            const option = document.createElement('option');
            option.value = city;
            option.textContent = city;
            citySelect.appendChild(option);
        });

        citySelect.addEventListener('change', async function () {
            const selectedCity = this.value;
            if (!selectedCity) return;

            const filteredCinemas = cinemas.filter(cinema => cinema.city === selectedCity);
            cinemaSelect.innerHTML = '<option value="">Seçiniz</option>';
            filteredCinemas.forEach(cinema => {
                const option = document.createElement('option');
                option.value = cinema.cinema_id;
                option.textContent = cinema.name;
                cinemaSelect.appendChild(option);
            });

            const selectedMovieId = movie.movie_id;
            if (filteredCinemas.length > 0 && selectedMovieId) {
                const selectedCinemaId = filteredCinemas[0].cinema_id;
                await getShowtimesFortheater(selectedCinemaId, selectedMovieId); // Seansları getirin
            }
        });
    } catch (error) {
        console.error('Failed to fetch cinemas:', error);
    }
}

//confirmPurchaseButton.addEventListener('click', async () => {
//    confirmPurchaseButton.style.display = 'block';
//   
//});
// Function to check if conditions are met
function checkConditions() {
    if (selectedSeat !== null) {
        return true;
    }
    return false;
}

// Show credit card modal when conditions are met
purchaseButton.addEventListener('click', () => {
    if (checkConditions()) {
        creditCardModal.style.display = 'block';
    } else {
        alert('Please select a seat first!');
    }
});

// Close the credit card modal when the 'close' button is clicked
closeCreditCardModal.addEventListener('click', () => {
    creditCardModal.style.display = 'none';
});

// Handle form submission
creditCardForm.addEventListener('submit', async (event) => {
    event.preventDefault();
    const cardNumber = document.getElementById('card-number').value;
    const expiryDate = document.getElementById('expiry-date').value;
    const cvv = document.getElementById('cvv').value;
    // Kart bilgilerinin doğruluğunu kontrol et
    if (!cardNumber || !expiryDate || !cvv) {
        alert('Lütfen tüm kredi kartı bilgilerini girin.');
        return;
    }
    const citySelect = document.getElementById('city-select');
    const cinemaSelect = document.getElementById('cinema-select');
    const theaterSelect = document.getElementById('theater-select');
    const showtimeSelect = document.getElementById('showtime-select');
    //const seatSelect = document.getElementById('seat-select');
    const selectedCity = citySelect.value;
    const selectedCinema = cinemaSelect.value;
    const selectedTheater = theaterSelect.value;
    const selectedShowtime = showtimeSelect.value.split(' ')[0];
    const selectedShowday = showtimeSelect.value.split(' ')[1];
    //const selectedSeat = seatSelect.value;
    const userId = localStorage.getItem('userId');
    
    if (!selectedShowday || !selectedTheater || !selectedCity || !selectedCinema || !selectedShowtime || !selectedSeat) {
        alert('Lütfen tüm seçimleri yapınız.');
        return;
    }

    const movie_id = document.getElementById('movie-modal').dataset.movieId;
    const cityName = ((document.getElementById('city-select').options[1].value));

    const payload = {
        city: cityName,
        cinema_id: selectedCinema,
        showtime: selectedShowtime,
        day: selectedShowday,
        seat_id: selectedSeat,
        user_id: userId,
        movie_id: movie_id,
        theater_id: selectedTheater,
    };
    // Bilet satın alma isteği gönder
    try {
        const response = await fetch('http://localhost:3001/tickets', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(payload)
        });
        //burada ödeme kartına yönlendirmeli
    } catch (error) {
        alert('Error:', error);
    }

    const seatPayload = {
        "is_empty": 0
    }
    try {
        const response = await fetch(`http://localhost:3001/seats/${selectedSeat}`, {
            method: 'PUT',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(seatPayload)
        });
    } catch (error) {
        alert('Error:', error);
    }
    // Close the modal after submission
    creditCardModal.style.display = 'none';
    
    movieModal.style.display = 'none'; // Modalı kapat
    ticketPurchaseForm.style.display = 'none'; // Formu kapat
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
const citySelect = document.getElementById('city-select');
const cinemaSelect = document.getElementById('cinema-select');
const theaterSelect = document.getElementById('theater-select');
const showtimeSelect = document.getElementById('showtime-select');
const koltukArkaplan = document.getElementById('koltuk-arkaplan');
function hideKoltukArkaplan() {
    koltukArkaplan.style.display = 'none';
    selectedSeat = null;
}
citySelect.addEventListener('change', hideKoltukArkaplan);
cinemaSelect.addEventListener('change', hideKoltukArkaplan);
theaterSelect.addEventListener('change', hideKoltukArkaplan);
showtimeSelect.addEventListener('change', hideKoltukArkaplan);
