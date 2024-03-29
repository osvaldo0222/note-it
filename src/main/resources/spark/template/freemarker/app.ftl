<!DOCTYPE html>
<html lang="en">
    <head>
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
      <meta http-equiv="x-ua-compatible" content="ie=edge">
      <title>Note-IT</title>
      <!-- Font Awesome -->
      <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.11.2/css/all.css">
      <!-- Bootstrap core CSS -->
      <link href="/css/bootstrap.min.css" rel="stylesheet">
      <!-- Material Design Bootstrap -->
      <link href="/css/mdb.min.css" rel="stylesheet">
      <!-- Your custom styles (optional) -->

      <link href="/css/style.css" rel="stylesheet">
    </head>

<body>
  <!-- Start your project here-->
  <#if !(user??)>
      <nav class="navbar navbar-dark  info-color fixed-top ">
          <a class="navbar-brand" href="/"><img src="https://img.icons8.com/ultraviolet/60/000000/my-topic.png" width="40" height="40">  <span class="ml-1 blog">Note-IT</span></a>
          <form action="/loadArticles/0" class="form-inline my-1" method="get">
              <div class="md-form form-sm my-0 ml-auto">
                  <input class="form-control form-control-sm mr-sm-2 mb-0" name="search" id="search" type="text" placeholder="Search Tag" aria-label="Search Tag" value="<#if filterTag??>${filterTag}</#if>">
              </div>
              <button class="btn btn-outline-white btn-sm my-0" type="submit">Buscar </button>
          </form>
          <a href="/login"><button class="btn btn-outline-white btn-sm my-0" type="submit">Login </button></a>
      </nav>
      <style>
          #firstRow {
              margin-top: 100px;
          }
      </style>
  </#if>


  <div class="container-fluid gedf-wrapper" id="firstRow">

      <div class="row">


          <div class="col-sm-3 " id="">
              <div class=" sticky-top" id="right-column">
                  <#if user??>
                <div class="row">
                  <div class="col-sm-12">
                      <div>
                          <a href="/"><img src="https://img.icons8.com/ultraviolet/60/000000/my-topic.png">  <span class="ml-1 blog">Note-IT</span></a>
                           </div>
                  </div>
                </div>
                  <div class="row">
                      <div class="col-sm">


                      </div>
                  </div>
                <div class="row">
                  <div class="col-sm-11">
                   
                      <div class="list-group list-group-flush ">
                          <#if user.administrator == true>
                          <a href="#" class="list-group-item   waves-effect" id="regiter-user-bar" data-toggle="modal" data-target="#RegisterUserModal">
                            <i class="fas fa-user-plus mr-3"></i>Registrar Usuario</a>
                          <a href="#" class="list-group-item   waves-effect" data-toggle="modal" data-target="#modalListUser" id="list-user">
                            <i class="fas fa-list mr-3"></i>Listar Usuario</a>
                          </#if>
                          <#if user.administrator == true || user.author == true>
                          <a href="#" class="list-group-item   waves-effect">
                            <i class="fas fa-newspaper mr-3"></i>Listar Articulos</a>
                          </#if>
                          <a href="/closeSession" class="list-group-item   waves-effect">
                              <i class="fa fa-sign-out-alt mr-3"></i>Log-out</a>
                        </div>
                  </div>
                </div>
                  </#if>
              </div>
          </div>




          <div class="col-sm-6 gedf-main">

              <!--- \\\\\\\Post-->
              <#if user??  >
                <#if  user.administrator == true || user.author == true>
              <div class="card gedf-card">
                  <div class="card-header">
                      <ul class="nav nav-tabs card-header-tabs" id="myTab" role="tablist">
                          <li class="nav-item">
                              <a class="nav-link active" id="posts-tab" data-toggle="tab" href="#posts" role="tab" aria-controls="posts" aria-selected="true">Crear Publicación</a>
                          </li>

                      </ul>
                  </div>
                  <div class="card-body">
                      <div class="tab-content" id="myTabContent">

                          <div class="tab-pane fade show active" id="posts" role="tabpanel" aria-labelledby="posts-tab">
                              <div class="form-group green-border-focus">
                                <!--Input field for post-->
                                <div class="row">
                                  <div class="col">
                                      <div class="md-form form-sm">
                                          <input type="text" id="inputSMEx" class="pubTitle form-control form-control-sm name-article" name="name-article">
                                          <label for="inputSMEx">Título</label>
                                        </div>
                                  </div>
                                  <div class="col">
                                      <div class="md-form form-sm">
                                          <input type="text" id="inputSMEx" class="pubPublication form-control form-control-sm tags-input">
                                          <label for="inputSMEx">Etiquetas</label>
                                        </div>
                                  </div>
                                </div>
                                  <div class="row mb-2">
                                      <div class="col-sm-2">
                                          Tags:

                                      </div>
                                      <div class="col-sm-10">
                                          <div class="tags">


                                          </div>

                                      </div>
                                  </div>

                                  <textarea class="form-control exampleFormControlTextarea5" id="exampleFormControlTextarea5" rows="3" name="textArticle"></textarea>
                                </div>
                                     <!--Form for article to submit-->
                          </div>
                      </div>
                      <div class="btn-toolbar justify-content-between float-right">
                          <div class="btn-group">
                              <a class="btn btn-primary" id="postArticle">Publicar</a>
                          </div>

                      </div>
                  </div>
                  <!--Input field for post-->
              </div>
                  <br>
                    </#if>
              </#if>
              <!-- Post /////-->

              <div class="row">
                  <div class="col-sm-12 articles">
                      <!--- \\\\\\\Post model-->
                      <#if articles??>

                          <#list articles as article>
                              <div class="card gedf-card">
                                  <div class="card-header">
                                      <div class="d-flex justify-content-between align-items-center">
                                          <div class="d-flex justify-content-between align-items-center">
                                              <div class="mr-2">
                                                  <img class="rounded-circle" width="45" src="https://picsum.photos/50/50" alt="">
                                              </div>
                                              <div class="ml-2">
                                                  <div class="h5 m-0">${article.author.name}</div>
                                                  <div class="h7 text-muted">${article.author.username}</div>
                                              </div>
                                          </div>
                                          <div>
                                              <div class="dropdown">
                                                  <button class="btn btn-link dropdown-toggle" type="button" id="gedf-drop1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                      <i class="fa fa-ellipsis-h"></i>
                                                  </button>
                                                  <div class="dropdown-menu dropdown-menu-right" aria-labelledby="gedf-drop1">
                                                      <div class="h6 dropdown-header">Modificaciones</div>
                                                      <a class="dropdown-item" href="#">Editar artículo</a>
                                                      <a class="dropdown-item" href="#">Eliminar artículo</a>

                                                  </div>
                                              </div>
                                          </div>
                                      </div>

                                  </div>
                                  <div class="card-body">
                                      <div class="text-muted h7 mb-2"> <i class="fa fa-clock-o"></i>${article.date}</div>
                                      <a class="card-link" href="/seeArticle/${article.id}">
                                          <h5 class="card-title">${article.title}</h5>
                                      </a>

                                      <p class="card-text">
                                          ${article.body}
                                      </p>
                                      <div>
                                          <#list article.tagList as artTag >
                                              <span class="badge badge-pill badge-info ml-1">${artTag.tag}</span>
                                          </#list>
                                      </div>
                                  </div>
                                  <div class="card-footer">
                                      <a class="card-link" id="like" value="${article.id}" style="<#assign aux = false><#if user??><#if article.getUserLike(user.username)??><#if article.getUserLike(user.username).liked == true>color: #0b51c5;<#assign aux = true><#else>color: #90a4ae;</#if><#else>color: #90a4ae;</#if><#else>color: #90a4ae;</#if>"  ><i class="fa fa-thumbs-up"></i><span class="<#if aux == true>active</#if>"><#assign number = article.getNumbersOfLikes()><#if (number > 0)> ${number}</#if></span></a>
                                      <a class="card-link" id="dislike" value="${article.id}" style="<#assign aux = false><#if user??><#if article.getUserLike(user.username)??><#if article.getUserLike(user.username).liked == false>color: #0b51c5;<#assign aux = true><#else>color: #90a4ae;</#if><#else>color: #90a4ae;</#if><#else>color: #90a4ae;</#if>"> <i class="fa fa-thumbs-down"></i><span class="<#if aux == true>active</#if>"><#assign number = article.getNumbersOfDislikes()><#if (number > 0)> ${number}</#if></span></a>

                                      <a class="card-link" id="like" style="color: #90a4ae;"><i class="fa fa-comment"></i><span><#assign number = article.getNumbersOfComments()><#if (number > 0)> ${number}</#if></span></a>
                                  </div>
                              </div>
                              <br>
                          </#list>

                      </#if>
                      <#if pages??>
                      <nav aria-label="Page navigation example">
                          <ul class="pagination justify-content-center">
                              <#list pages as page>
                                  ${page}
                              </#list>
                          </ul>
                      </nav>
                      </#if>
                  </div>
              </div>
              <!-- Post model /////-->

 


              
              <!-- Post /////-->
                <!--- \\\\\\\Post model-->

                <!-- Post model /////-->



          </div>
          <div class="col-sm-3 ">

              <div class=" position-fixed" id="right-column">
                              <form action="/loadArticles/0" class="form-inline my-1" method="get">
                                  <div class="md-form form-sm my-0 ml-auto">
                                      <input class="form-control form-control-sm mr-sm-2 mb-0 ml-1" name="search" id="search" type="text" placeholder="Buscar Tag" aria-label="Buscar Tag" value="<#if filterTag??>${filterTag}</#if>">
                                  </div>
                                  <button class="btn btn-sm my-0 info-color " type="submit"><span style="color: white;"><i class="fas fa-search"></i></span> </button>
                              </form>
              </div>
              <div class="row">

                  <div class="col-sm-11">
                    <#if user?? >
                        <div class="card border-info mb-3 position-fixed " style="max-width: 20rem; margin-top: 60px;" >
                            <div class="card-header">Soy ${user.name}</div>
                            <div class="card-body text-info">
                                <h5 class="card-title"><#if user.administrator == true >Administrador <#elseif user.author == true > Autor <#else >Usuario nivel 1</#if></h5>
                                <p class="card-text">Some quick example text to build on the panel title and make up the bulk of the panel's content.</p>
                            </div>
                        </div>
                    </#if>

                  </div>
                  <div class="col-sm-1">

                  </div>
              </div>
          </div>
      </div>
  </div>



    <!-- Modal: modalCart -->
<div class="modal fade" id="modalListUser" tabindex="1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
<div class="modal-dialog modal-lg" role="document">
  <div class="modal-content">
    <!--Header-->
    <div class="modal-header">
      <h4 class="modal-title w-100" id="myModalLabel">Listar usuario</h4>
      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
        <span aria-hidden="true">×</span>
      </button>
    </div>
    <!--Body-->
    <div class="modal-body">
      <table class="table table-hover" id="listUsers">
        <tbody class="rows-in-table"></tbody>
      </table>
    </div>
    <!--Footer-->
    <div class="modal-footer">
      <button type="button" class="btn btn-outline-primary" data-dismiss="modal">Cancelar</button>
      <button class="btn btn-primary" type="submit">Salvar</button>
    </div>
  </div>
</div>
</div>
<!-- Modal: modalCart -->






<!--Register user modal-->
<!-- Central Modal Small -->
<form action="" method="POST" class="register-update" id="register-update">
<div class="modal fade" id="RegisterUserModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
  aria-hidden="true">

  <!-- Change class .modal-sm to change the size of the modal -->
  <div class="modal-dialog modal-md" role="document">


    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title w-100" id="titleModalRegister-update">Registrar Usuario</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          <div class="md-form">
              <input type="text" id="inputMDEx" class="form-control input-full-name-modal-register-update" name="username" required>
              <label for="inputMDEx" class="input-full-name-modal-register-update">Nombre de usuario</label>
            </div>
          <div class="md-form">
              <input type="text" id="inputMDEx" class="form-control name-input" name="name" required>
              <label for="inputMDEx" class="name-input">Nombre completo</label>
            </div>
            <div class="md-form">
                <input type="password" id="inputMDEx" class="form-control password-input" name="password" required>
                <label for="inputMDEx" class="password-input">Password</label>
              </div>
               
                <!-- Material unchecked -->
                <div class="d-flex p-2 col-example">
                 
                <div class="form-check ml-auto mr-2">
                    <input type="checkbox" class="form-check-input" id="materialUncheckedAuthor" name="materialUncheckedAuthor">
                    <label class="form-check-label" for="materialUnchecked">Autor</label>
                </div>
                <div class="form-check mr-auto">
                    <input type="checkbox" class="form-check-input" id="materialUncheckedAdmin" name="materialUncheckedAdmin">
                    <label class="form-check-label" for="materialUnchecked">Administrador</label>
                </div>
              
              </div>

            
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn- btn-sm" data-dismiss="modal">Cancelar</button>
        <button type="submit" class="btn btn-primary btn-sm">Salvar</button>
      </div>
    </div>
  </div>
</div>
</form>
<!-- Central Modal Small -->

<!--Modal confirm delete-->
<!--Modal: modalConfirmDelete-->
<div class="modal fade" id="modalConfirmDelete" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
  aria-hidden="true">
  <div class="modal-dialog modal-sm modal-notify modal-danger" role="document">
    <!--Content-->
    <div class="modal-content text-center">
      <!--Header-->
      <div class="modal-header d-flex justify-content-center">
        <p class="heading" id="confirmTitle">Eliminar usuario</p>
      </div>

      <!--Body-->
      <div class="modal-body">

        <i class="fas fa-times fa-4x animated rotateIn"></i>
        <div class="row">
          <div class="col"> 
            <span id="messageDelete"> </span>
          </div>
        </div>
       

      </div>

      <!--Footer-->
      <div class="modal-footer flex-center">
        <a href="" class="btn  btn-outline-danger" type="submit" id="delete-user-article">Si!</a>
        <a type="button" class="btn  btn-danger waves-effect" data-dismiss="modal">Cancelar</a>
      </div>
    </div>
    <!--/.Content-->
  </div>
</div>
  <!-- Start your project here-->
  <!-- SCRIPTS -->
  <!-- JQuery -->
  <script type="text/javascript" src="/js/jquery-3.4.1.min.js"></script>
  <!-- Bootstrap tooltips -->
  <script type="text/javascript" src="/js/popper.min.js"></script>
  <!-- Bootstrap core JavaScript -->
  <script type="text/javascript" src="/js/bootstrap.min.js"></script>
  <!-- MDB core JavaScript -->
  <script type="text/javascript" src="/js/mdb.min.js"></script>
  <script type="text/javascript" src="/js/javaScript.js"></script>
  <script type="text/javascript" src="/js/listUsers.js"></script>
  <script>
      var a = document.getElementsByClassName("card-text");
      var i;
      for (i = 0; i < a.length; i++) {
          if (a[i].innerText.length > 70) {
              a[i].innerText = a[i].innerText.slice(0, 67) + "...";
          };
      };
  </script>
</body>
</html>
