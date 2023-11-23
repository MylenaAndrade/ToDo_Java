<!DOCTYPE html>
<html lang="pt-br">
  <head>
    <meta charset="UTF-8" />
    <title>ToDo List com Bootstrap</title>
    <link
      href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
      rel="stylesheet"
    />
    <script
      defer
      src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
    ></script>
  </head>
  <body>
    <div class="container mt-4">
      <h1>Minha Lista de Tarefas</h1>

      <form id="todoForm">
        <div class="form-group">
          <label for="taskName">Tarefa:</label>
          <input
            type="text"
            class="form-control"
            id="taskName"
            name="taskName"
            required
          />
        </div>

        <div class="form-group">
          <label for="taskPriority">Prioridade:</label>
          <select class="form-control" id="taskPriority" name="taskPriority">
            <option value="baixa">Baixa</option>
            <option value="média">Média</option>
            <option value="alta">Alta</option>
          </select>
        </div>

        <div class="form-group">
          <label>Diário</label><br />
          <div class="form-check form-check-inline">
            <input
              type="checkbox"
              class="form-check-input"
              id="label1"
              name="label1"
              value="design"
            />
            <label class="form-check-label" for="label1">Sim</label>
          </div>
        </div>

        <button type="submit" class="btn btn-primary">Adicionar Tarefa</button>
      </form>

      <h2 class="mt-4">Lista de Tarefas</h2>
      <ul id="taskList" class="list-group">
        <li class="list-group-item">Tarefa 1</li>
      </ul>
    </div>
  </body>
</html>
