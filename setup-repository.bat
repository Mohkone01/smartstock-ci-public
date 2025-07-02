@echo off
echo ========================================
echo   SmartStock CI - Setup Repository Public
echo ========================================
echo.

echo 1. Creation de la structure de dossiers...
if not exist "images" mkdir images
if not exist "docs" mkdir docs

echo 2. Creation du fichier .gitignore...
echo # Fichiers a ignorer > .gitignore
echo .DS_Store >> .gitignore
echo Thumbs.db >> .gitignore
echo *.log >> .gitignore
echo node_modules/ >> .gitignore
echo .env >> .gitignore
echo .env.local >> .gitignore

echo 3. Copie des fichiers de documentation...
copy "..\src-ACTUEL\DOCUMENTATION.md" . >nul 2>&1
copy "..\src-ACTUEL\GUIDE-UTILISATEUR.md" . >nul 2>&1
copy "..\src-ACTUEL\GUIDE-SAUVEGARDE-UTILISATEUR.md" . >nul 2>&1
copy "..\src-ACTUEL\DOCUMENTATION-SAUVEGARDE-DONNEES.md" . >nul 2>&1
copy "..\src-ACTUEL\GUIDE-DEPLOIEMENT.md" . >nul 2>&1
copy "..\src-ACTUEL\README-DOCUMENTATION.md" . >nul 2>&1

echo 4. Copie des images...
copy "..\src-ACTUEL\*.png" "images\" >nul 2>&1

echo 5. Creation du README pour les images...
echo # Images d'Illustration SmartStock CI > images\README.md
echo. >> images\README.md
echo Ce dossier contient toutes les captures d'ecran de l'application. >> images\README.md

echo 6. Initialisation Git...
git init >nul 2>&1

echo 7. Ajout des fichiers...
git add . >nul 2>&1

echo 8. Premier commit...
git commit -m "Initial commit: SmartStock CI public documentation and guides" >nul 2>&1

echo.
echo ========================================
echo   Setup termine avec succes !
echo ========================================
echo.
echo Prochaines etapes :
echo 1. Creer le repository sur GitHub
echo 2. Ajouter l'origine remote :
echo    git remote add origin https://github.com/Mohkone01/smartstock-ci-public.git
echo 3. Pousser vers GitHub :
echo    git push -u origin main
echo.
pause
