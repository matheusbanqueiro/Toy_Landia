<img height="200px"  align="right" align="top" src="https://github.com/matheusbanqueiro/Toy_Landia/assets/101984947/6a9b8811-185f-4070-8c54-4c596a283cd6"></a>



# Toy landia 🎁👶

This project uses lot of stuff as:

📌 [Tailwind](https://tailwindcss.com/) </br>
📌 [Apache Tomcat 9.0](https://tomcat.apache.org/) </br>
📌 [MySQL](https://www.mysql.com/) </br>
📌 [MySQL Workbench](https://www.mysql.com/products/workbench/) </br>
📌 [Eclipse](https://eclipseide.org/) </br>
📌 [Java](https://docs.oracle.com/en/java/) </br>
📌 [JavaScript](https://developer.mozilla.org/pt-BR/docs/Web/JavaScript) </br>

Enter the ConnectionFactory and put your mysql login and password:
```
String login = "root";
String senha = "Sua senha do banco de dados aqui";
String url = "jdbc:mysql://localhost:3306/lojaBrinquedos";

return DriverManager.getConnection(url, login, senha);
```
