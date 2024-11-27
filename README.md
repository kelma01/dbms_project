**TR**

  Online Sinema Bileti Satın Alım Sitesi
  
  Projenin çalıştırılması için gerekli kütüphaneler package.json içinde yer almaktadır. Herhangi ekstra bir kuruluma gerek yoktur. Aşağıdaki adımlar ile çalıştırılabilir.
  
  1. Repo'yu klonlayın. -> `git clone https://github.com/kelma01/dbms_project`
  2. Repo'yu klonladığınız path'te `npm run start:dev` ile de localhost'ta sunucu çalıştırılabilir. localhost:3001 'de backend çalışmaktadır. Frontend ise localhost:5500 'da çalışmaktadır. Her yapılan backend değişiklikten sonra dosyalar kaydedilip terminale 'rs' yazılmalı, değişiklik sonrası server'in tekrardan çalışması için.
  3. Database için ise `dbms_project.sql` dosyasındaki kodlar kopyalanıp MySQL Workbench içinde bir schema'ya atanmalıdır, bu şekilde database ile backend bağlanmış olur. sonrasında  `db_config.js`dosyasındaki database özellikleri kullanıcının kendi şifre, database ismi, kullanıcı adı gibi özellikler ile değiştirilmelidir.


**EN**

  Online Cinema Ticket Purchasing Website
  
  package.json includes libraries to run the project. No need for extra installation. Here are the steps for running the project:
    
  1. Clone repository. -> `git clone https://github.com/kelma01/dbms_project`
  2. With `npm run start:dev` you can run the server on localhost in the path you have cloned. Backend runs on localhost:3000 and frontend is on localhost:5500. After every change in codebase you need to save and type `rs` to terminal to restart the server with new version of it.
  3. For the database, you need to copy the codes in `dbms_project.sql` and paste to the schema in MySQL Workbench. After that the backend and database should be connected. In the final you need to change `db_config.js` file according to your own password, database name, username.
