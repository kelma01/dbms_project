document.addEventListener('DOMContentLoaded', () => {
    const userInfo = document.getElementById('user-info');
    const logo = document.querySelector('.logo');

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

    // Profil güncelleme formu
    document.getElementById('profile-form').addEventListener('submit', async function(event) {
        event.preventDefault();
        
        const userId = localStorage.getItem('userId');
        if (!userId) {
            alert('User ID not found. Please log in again.');
            return;
        }

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
