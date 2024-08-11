Online Sinema Bileti Satın Alım Sitesi

Projenin çalıştırılması için gerekli kütüphaneler package.json içinde yer almaktadır. Herhangi ekstra bir kuruluma gerek yoktur. Aşağıdaki adımlar ile çalıştırılabilir.

1. Repo'yu klonlayın. -> `git clone https://github.com/kelma01/dbms_project`
2. Repo'yu klonladığınız path'te `npm run start:dev` ile de localhost'ta sunucu çalıştırılabilir. localhost:3001 'de backend çalışmaktadır. Frontend ise localhost:5500 'da çalışmaktadır. Her yapılan backend değişiklikten sonra dosyalar kaydedilip terminale 'rs' yazılmalı, değişiklik sonrası server'in tekrardan çalışması için.
3. Database için ise `dbms_project.sql` dosyasındaki kodlar kopyalanıp MySQL Workbench içinde bir schema'ya atanmalıdır, bu şekilde database ile backend bağlanmış olur. sonrasında  `db_config.js`dosyasındaki database özellikleri kullanıcının kendi şifre, database ismi, kullanıcı adı gibi özellikler ile değiştirilmelidir.
