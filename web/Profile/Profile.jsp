<%-- 
    Document   : Profile
    Created on : Jun 2, 2021, 5:11:57 PM
    Author     : bader
--%>
<%
    /* Login Guard: to be placed above any protected page which requires login such as Profile.jsp*/

    // If Donor is not logged in, send him/her to Acceuil Page
    if (session.getAttribute("id") == null
            || session.getAttribute("prenom") == null
            || session.getAttribute("nom") == null) 
    {
        response.sendRedirect(request.getContextPath() + "/index.jsp");
    }

%>


<%@page import="Backend.Connexion"%>
<%@page import="java.sql.ResultSet"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <link rel="icon" href="${pageContext.request.contextPath}/Resources/Images/BloodDrop.png">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Profile</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Profile/Profile.css"/>


    </head>


    <body>
        <%@include file="../Header/Header.jsp" %>

        <%            
            // get doneur id stored in session
            String id = session.getAttribute("id").toString();
            if (id == null)// extra check, just to make sure
            {
                response.sendRedirect(request.getContextPath() + "/index.jsp");
                return;
            }

            String req = "SELECT * FROM Donneur WHERE id = " + id;
            System.out.println(req);
            ResultSet R = Connexion.Seconnecter().createStatement().executeQuery(req);
            R.next();

            String prenom = R.getObject(2).toString();
            String nom = R.getObject(3).toString();
            String ville = R.getObject(4).toString();
            String adresse = R.getObject(5).toString();
            String groupe_sanguin = R.getObject(6).toString();
            String date_naissance = R.getObject(7).toString();
            String telephone = R.getObject(8).toString();
            String email = R.getObject(9).toString();
            //String password =  R.getObject(10).toString(); no need
            String disponible = R.getObject(11).toString();

        %>


        <div class="container">
            <!-- Left part contains all doneur info, will be shown to visitor and profile owner -->
            <div class="left">
                <img src="http://ssl.gstatic.com/accounts/ui/avatar_2x.png" class="profile-image"/>
                          
              
                <div class="profile-full-name-container">
                    <div class="profile-prenom"><%= prenom %></div>&nbsp;
                    <div class="profile-nom"><%= nom %></div>
                </div>
                
                
                <div class="profile-email"><%= email %></div>

      
                <div class=<%= disponible.equals("oui") ? "profile-disponible" : "profile-indisponible" %>   >
                   <%= disponible.equals("oui") ? "Disponible" : "Indisponible" %>
                </div> 

                <div class="divider"></div>
                
                <div style="display: flex; flex-direction: column; align-items: center; justify-content: center;">   
                    <div class="profile-section-title">Groupe Sanguin</div>
                    <div class="profile-groupe-sanguin"><%= groupe_sanguin %></div>
                </div>

                <div class="divider"></div>

                <div style="display: flex; flex-direction: column; align-items: center; justify-content: center;">   
                    <div class="profile-section-title">Adresse</div>
                    <div class="profile-adresse"><%= ville %>, <%= adresse %></div>
                </div>

                <div class="divider"></div>
                                
                <div style="display: flex; flex-direction: column; align-items: center; justify-content: center;">   
                    <div class="profile-section-title">Date de Naissance</div>
                    <div class="profile-date-naissance"><%= date_naissance %></div>
                </div>

                <div class="divider"></div>
                
                <div style="display: flex; flex-direction: column; align-items: center; justify-content: center;">   
                    <div class="profile-section-title">Telephone</div>
                    <div  class="profile-telephone"><%= telephone %></div>
                </div>
            </div> 


            <!-- Left part contains all doneur info to be modified, will be shown only to the profile owner  -->
            <div class="right">
                
                TODO Edit Texts & Labels & Save button to modify all left as 
                 https://www.bootdey.com/snippets/view/account-setting-or-edit-profile<br>
                 https://bootsnipp.com/tags/profile/4<br>
            </div> 

        </div>

                
                
        <%@include file="../Footer/Footer.jsp" %>
    </body>
</html>
