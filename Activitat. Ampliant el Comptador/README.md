# Ampliant el Comptador

## 1. Anàlisi de l’estructura del projecte
Projecte creat en Android Studio, el qual utilitza Gradle com a ferramenta de la construcció d'aquest i Kotlin com a llenguatge de programació.

A continuació vegem l'estructura generada del projecte, en dues vistes diferents, vista Android i vista dels fitxers del projecte (Project Files).
### * Imatge de esquerra vista Project Files.  * Imatge dreta Vista Android 
<img src="images/VistaProject.png" width="300" height="300">    <img src="images/VistaAndroid.png" width="300" height="300">

En la imatge de l'esquerra podem observar l'estructura del projecte creat amb Gradle i tots els fitxers generats de la aplicació, amb els directori arrel, la carpeta de app, i els fitxers més importants que ara nomenarem. Amb la imatge de la dreta, la vista de tots els directoris i fitxers és més compacta.

### Elements importants:
* Els scripts de Gradle tant el general, situat en el arrel (build.gradle.kts), com el propi de la APP (app/build.gradle.kts). Des de la vista android aquests 2 scripts estan dins de Gradle Scripts, on indica si és el pròpi del projecte o del mòdul.

<img src="images/script.png" width="200" height="200">

* En la vista Project Files, dins de la carpeta app/src/main, trobem el codí font de la aplicació. A la vista Android el codi font es troba en la carpeta java.
* 
<img src="images/script.png" width="200" height="200"> <img src="images/script.png" width="200" height="200">

## 2. Análisi del clicle de vida i el problema de la pèrdua d’estat
## 3. Solució a la pèrdua d’estat
## 4. Ampliant la funcionalitat amb decrements i Reset
## 5. Canvis per implementar el View Binding
