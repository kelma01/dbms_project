document.addEventListener('DOMContentLoaded', () => {
    const userInfo = document.getElementById('user-info');
    
    // Burada kullanıcı adı yerine "User Name" gösteriliyor, bunu dinamik olarak ayarlamalısınız
    userInfo.textContent = 'User Name'; 

    userInfo.addEventListener('click', () => {
        alert('Profile settings page');
        // Profil ayarları için yönlendirme veya açma işlemi burada yapılabilir
    });

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
                body: JSON.stringify({ name, surname, email, birth_date: birthDate })
            });
            const data = await response.json();
            if (data.success) {
                alert('Profile updated successfully!');
            } else {
                alert('Failed to update profile.');
            }
        } catch (error) {
            console.error('Error:', error);
            alert('An error occurred while updating the profile.');
        }
    });
});
