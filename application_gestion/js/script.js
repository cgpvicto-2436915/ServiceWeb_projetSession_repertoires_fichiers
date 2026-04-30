const HOST_API = "https://serviceweb-projetsession-sw.onrender.com";

const boutonAjouter = document.getElementById('btn-ajouter');
const boutonRecup = document.getElementById('btn-recup');
boutonAjouter.addEventListener("click",ajouterBiblio);
boutonRecup.addEventListener("click",recupCle);

async function ajouterBiblio(){
    const biblio = document.getElementById("input-nom-biblio");
    const courriel = document.getElementById("input-courriel-creation");
    const motDePasse = document.getElementById("input-mot-de-passe-creation");
    if(biblio.value == ""){
        alert("Le nom de la bibliothèque est requis.");
        return;
    }
    if(courriel.value == ""){
        alert("Le courriel est requis.");
        return;
    }
    if(motDePasse.value == ""){
        alert("Le mot de passe est requis.");
        return;
    }
    let BiblioEnvoye = {
        "nom":biblio.value,
        "courriel":courriel.value,
        "mot_de_passe":motDePasse.value
    }
    let reponse = await fetch(`${HOST_API}/api/utilisateur`, {
    method: 'POST',
    headers: {
        'Content-Type': 'application/json;charset=utf-8'
    },
    body: JSON.stringify(BiblioEnvoye)
    });
    let resultat = await reponse.json();
    if(resultat.message){
        alert(resultat.message+ "\n Cle api : "+ resultat.cle_api);
    }else{
        alert(resultat.erreur);
    }
    
    console.log(resultat);
};

//fait appele a l'api pour recuperer ou generer la cle api
async function recupCle(){
    const courriel = document.getElementById("input-courriel-recup");
    const motDePasse = document.getElementById("input-mot-de-passe-recup");
    const nouvelle = document.getElementById("newKey");
    if(courriel.value == ""){
        alert("Le courriel est requis.");
        return;
    }

    if(motDePasse.value == ""){
        alert("Le mot de passe est requis.");
        return;
    }

    let BiblioEnvoye = {
        "courriel":courriel.value,
        "mot_de_passe":motDePasse.value
    }

    let url = `${HOST_API}/api/utilisateur/cle`
    if(nouvelle.checked){
        url +="?nouvelle=1";
    }

    let reponse = await fetch(url, {
    method: 'POST',
    headers: {
        'Content-Type': 'application/json;charset=utf-8'
    },
    body: JSON.stringify(BiblioEnvoye)
    });

    let resultat = await reponse.json();

    if(resultat.erreur){
        
        alert(resultat.erreur);
    }else{
       alert("Cle api : "+ resultat.cle_api);
    }
    
    console.log(resultat);
}