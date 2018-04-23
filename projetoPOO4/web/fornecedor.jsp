<%-- 
    Document   : cliente
    Created on : 19/04/2018, 15:57:19
    Author     : Ton
--%>

<%@page import="br.com.fatecpggrupo3.bd.BdFornecedores"%>
<%@page import="br.com.fatecpggrupo3.bd.Fornecedores"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%  if (request.getParameter("add")!= null){
        Fornecedores f = new Fornecedores();
        f.setNome(request.getParameter("nome"));
        f.setRazaoSocial(request.getParameter("razao"));
        f.setCnpj(request.getParameter("cnpj"));
        f.setEmail(request.getParameter("email"));
        f.setTelefone(request.getParameter("telefone"));
        f.setEndereco(request.getParameter("endereco"));
        BdFornecedores.getFornecedoresList().add(f);
        response.sendRedirect(request.getRequestURI());
} else if (request.getParameter("del") != null){
        int i = Integer.parseInt(request.getParameter("i"));
        BdFornecedores.getFornecedoresList().remove(i);
        response.sendRedirect(request.getRequestURI());
}
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <title>Fornecedor</title>
    </head>
    <body>
        
      <nav class="navbar navbar-expand-lg cabecalho">
        <div class="collapse navbar-collapse .cabecalho" id="navbarNav">
        <div class="container">
        <ul class="navbar-nav">
        <li class="nav-item active">
            <a class="nav-link" href="index.jsp">Inicio <span class="sr-only">(atual)</span></a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="cliente.jsp">Cliente</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="fornecedor.jsp">Fornecedor</a>
        </li>
        </ul>
            </div>
         </div>
      </nav>
         
    <div class="container">
        <div class="titulo">
            <h1>Cadastro de Fornecedor</h1>
        </div>
    </div>
    
    <div class="container">
        <div class="caixa">
            <form>
            <div class="row">
                <div class="col-md-6">
                <div class="form-group">
                <label for="usr">Nome Completo:</label>
                <input type="text" class="form-control" id="usr" name="nome" required="">
                </div>
                </div>
        <div class="col-md-4">
            <div class="form-group">
            <label for="usr">Razão Social:</label>
            <input type="text" class="form-control" id="usr" name="razao" required="" maxlength="11" minlength="11">
        </div>
        </div>
        </div>
        
    <div class="row">
     <div class="col-md-4">
         <div class="form-group">
         <label for="usr">CNPJ:</label>
         <input type="text" class="form-control" id="usr" name="cnpj" required="" maxlength="14">
    </div>
    </div>
    <div class="col-md-6">
        <div class="form-group">
        <label for="usr">Email:</label>
        <input type="email" class="form-control" id="usr" name="email" required="" >
    </div>
    </div>
    </div>
        
     <div class="row">
        <div class="col-md-4">
            <div class="form-group">
            <label for="usr">Telefone:</label>
            <input type="text" class="form-control" id="usr" name="telefone"
                   required="" maxlength="12" minlength="11">
      </div>
      </div>
        <div class="col-md-6">
            <div class="form-group">
            <label for="usr">Endereço:</label>
            <input type="text" class="form-control" id="usr" name="endereco" required="">
        </div>
        </div>
        </div>
        
        <div class="row">
            <input type="submit" value="Adicionar" class="btn-add" name="add">
            <input type="reset" value="Limpar" class="btn-limpar">
        </div>
        </form>
    </div>
    </div>
        
        <div class="cliente-cadastrado">
            <p>Fornecedores Cadastrados</p>
        </div>
        
        <div class="col-md-12 caixa-tabela">    
     <table class="table table-hover">
    <thead>
      <tr>
        <th>Nome Completo</th>
        <th>Razão Social</th>
        <th>CNPJ</th>
        <th>Email</th>
        <th>Telefone</th>
        <th>Endereço</th>
      </tr>
    </thead>
    <tbody>
        <%for (int i =0; i<BdFornecedores.getFornecedoresList().size();i++) {%>
      <tr>
        <td><%= BdFornecedores.getFornecedoresList().get(i).getNome() %></td>
        <td><%= BdFornecedores.getFornecedoresList().get(i).getRazaoSocial() %></td>
        <td><%= BdFornecedores.getFornecedoresList().get(i).getCnpj() %></td>
        <td><%= BdFornecedores.getFornecedoresList().get(i).getEmail() %></td>
        <td><%= BdFornecedores.getFornecedoresList().get(i).getTelefone() %></td>
        <td><%= BdFornecedores.getFornecedoresList().get(i).getEndereco() %></td>
        <td>
            <form>
                <input type="hidden" name="i" value="<%=i%>"/>
                <input type="submit" name="alt" value="Alterar" class="alterar">
                    </form>
        </td>
        <td>
            <form>
              <input type="hidden" name="i" value="<%=i%>"/>
                    <input type="submit" name="del" value="Excluir">
                    </form>
        </td>
      </tr> 
      <%}%>
    </tbody>
  </table>
        </div>
        
    <footer>
        <div class="rodape">
            <p>Todos os direitos reservados</p>
        </div>
    </footer>
    </body>
</html>
