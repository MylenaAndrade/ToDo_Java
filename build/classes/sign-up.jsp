<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Bootstrap demo</title>
    <!-- Bootstrap -->
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
      crossorigin="anonymous"
    />
    <script
      defer
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
      crossorigin="anonymous"
    ></script>
    <link rel="stylesheet" href="../css/style.css">
  </head>
  <body>
    <form class="gap-2 column center">
      <h1>Cadastro</h1>
      <fieldset>
        <label for="email" class="form-label">Email</label>
        <input type="text" id="email"  class="form-control"/>
      </fieldset>
      <fieldset>
        <label for="password" class="form-label">Senha</label>
        <input type="password" id="password"  class="form-control"/>
      </fieldset>
      <button class="btn btn-primary">Criar conta</button>
      <span>Já possui uma conta? <a href="index.html">Entrar</a></span>
    </form>
  </body>
</html>
