document.addEventListener('DOMContentLoaded', () => {
    const userInfo = document.getElementById('user-info');
    const logo = document.querySelector('.logo');
    const profileForm = document.getElementById('profile-form');

    // Kullanıcı bilgilerini göstermek
    userInfo.textContent = ''; // Bu kısımdaki 'User Name' kısmını doğru kullanıcı adıyla güncelleyin

    // Profil ayarları sayfasına yönlendirme
    userInfo.addEventListener('click', () => {
        alert('Profile settings page');
    });

    // Logo tıklama yönlendirmesi
    logo.addEventListener('click', () => {
        window.location.href = 'http://localhost:5500';
    });

    fetch(`http://localhost:3001/users/${localStorage.getItem('userId')}`)
    .then(response => {
        if (!response.ok) {
            throw new Error('Network response was not ok');
        }
        return response.json(); // JSON olarak dönen veriyi al
    })
    .then(data => {
        alert(data); // Alınan veriyi işleme
    })
    .catch(error => {
        console.error('There was a problem with the fetch operation:', error);
    });


    // Profil güncelleme formu
    document.getElementById('profile-form').addEventListener('submit', async function(event) {
        event.preventDefault();

        const name = document.getElementById('name').value;
        const surname = document.getElementById('surname').value;
        const email = document.getElementById('email').value;
        const birthDate = document.getElementById('birth-date').value;

        try {
            const response = await fetch('http://localhost:3001/profile', {
                method: 'PUT',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({ id: userId, name, surname, email, birth_date: birthDate })
            });
            alert(response.text[0]);
            if (response.ok) {
                const data = await response.json();
                console.log('Profile updated:', data);
                alert('Profile updated successfully!');
                window.location.href = 'http://localhost:5500'; // Redirect
            } else {
                const errorText = await response.text();
                console.error('Failed response status:', response.status);
                console.error('Failed response text:', errorText);
                alert('Failed to update profile: ' + errorText);
            }
        } catch (error) {
            console.error('Fetch error:', error);
            alert('An error occurred while updating the profile. Please try again later.');
        }
    });
});

//document.addEventListener('DOMContentLoaded', async () => {
//    const userInfo = document.getElementById('user-info');
//    const logo = document.querySelector('.logo');
//    const profileForm = document.getElementById('profile-form');
//
//    // Kullanıcı bilgilerini almak ve formu doldurmak
//    const userId = localStorage.getItem('userId');
//    if (!userId) {
//        alert('User ID not found. Please log in again.');
//        return;
//    }
//
//    try {
//        const response = await fetch(`http://localhost:3001/profile`, {
//            method: 'GET'
//        });
//        if (response.ok) {
//            const userData = await response.json();
//            document.getElementById('name').value = userData.name || '';
//            document.getElementById('surname').value = userData.surname || '';
//            document.getElementById('email').value = userData.email || '';
//            document.getElementById('birth-date').value = userData.birth_date || '';
//        } else {
//            alert('Failed to load user data.');
//        }
//    } catch (error) {
//        console.error('Fetch error:', error);
//        alert('An error occurred while loading user data. Please try again later.');
//    }
//
//    // Profil ayarları sayfasına yönlendirme
//    userInfo.addEventListener('click', () => {
//        alert('Profile settings page');
//    });
//
//    // Logo tıklama yönlendirmesi
//    logo.addEventListener('click', () => {
//        window.location.href = 'http://localhost:5500';
//    });
//
//    // Profil güncelleme formu
//    profileForm.addEventListener('submit', async function(event) {
//        event.preventDefault();
//
//        const name = document.getElementById('name').value;
//        const surname = document.getElementById('surname').value;
//        const email = document.getElementById('email').value;
//        const birthDate = document.getElementById('birth-date').value;
//
//        try {
//            const response = await fetch('http://localhost:3001/profile', {
//                method: 'PUT',
//                headers: {
//                    'Content-Type': 'application/json'
//                },
//                body: JSON.stringify({ id: userId, name, surname, email, birth_date: birthDate })
//            });
//
//            if (response.ok) {
//                const data = await response.json();
//                console.log('Profile updated:', data);
//                alert('Profile updated successfully!');
//                window.location.href = 'http://localhost:5500'; // Redirect
//            } else {
//                const errorText = await response.text();
//                console.error('Failed response status:', response.status);
//                console.error('Failed response text:', errorText);
//                alert('Failed to update profile: ' + errorText);
//            }
//        } catch (error) {
//            console.error('Fetch error:', error);
//            alert('An error occurred while updating the profile. Please try again later.');
//        }
//    });
//});
//