document.addEventListener('DOMContentLoaded', () => {
    const userInfo = document.getElementById('user-info');
    const logo = document.querySelector('.logo');
    const profileForm = document.getElementById('profile-form');

    // Kullanıcı bilgilerini göstermek
    userInfo.textContent = ''; // Bu kısımdaki 'User Name' kısmını doğru kullanıcı adıyla güncelleyin

    // Logo tıklama yönlendirmesi
    logo.addEventListener('click', () => {
        window.location.href = 'http://localhost:5500';
    });

    // Kullanıcı bilgilerini almak için fetch
    fetch(`http://localhost:3001/users/${localStorage.getItem('userId')}`)
    .then(response => {
        if (!response.ok) {
            throw new Error('Network response was not ok');
        }
        return response.json(); // JSON olarak dönen veriyi al
    })
    .then(data => {
        // Form alanlarını güncelle
        // Form alanlarını güncelle
        const birthDate = new Date(data.birth_date);
        const year = birthDate.getFullYear();
        const month = String(birthDate.getMonth() + 1).padStart(2, '0'); // Ayı 2 basamaklı yap
        const day = String(birthDate.getDate()).padStart(2, '0'); // Günü 2 basamaklı yap
        const formattedDate = `${year}-${month}-${day}`;
        
        document.getElementById('name').value = data.name;
        document.getElementById('surname').value = data.surname;
        document.getElementById('email').value = data.email;
        document.getElementById('birth-date').value = formattedDate;
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
                body: JSON.stringify({ 
                    id: localStorage.getItem('userId'), // Kullanıcı ID'sini buradan al
                    name,
                    surname,
                    email,
                    birth_date: birthDate 
                })
            });
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
