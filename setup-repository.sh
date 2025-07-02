#!/bin/bash

echo "========================================"
echo "  SmartStock CI - Setup Repository Public"
echo "========================================"
echo

echo "1. Création de la structure de dossiers..."
mkdir -p images
mkdir -p docs

echo "2. Création du fichier .gitignore..."
cat > .gitignore << 'EOF'
# Fichiers à ignorer
.DS_Store
Thumbs.db
*.log
node_modules/
.env
.env.local
EOF

echo "3. Copie des fichiers de documentation..."
cp ../src-ACTUEL/DOCUMENTATION.md . 2>/dev/null || echo "   DOCUMENTATION.md non trouvé"
cp ../src-ACTUEL/GUIDE-UTILISATEUR.md . 2>/dev/null || echo "   GUIDE-UTILISATEUR.md non trouvé"
cp ../src-ACTUEL/GUIDE-SAUVEGARDE-UTILISATEUR.md . 2>/dev/null || echo "   GUIDE-SAUVEGARDE-UTILISATEUR.md non trouvé"
cp ../src-ACTUEL/DOCUMENTATION-SAUVEGARDE-DONNEES.md . 2>/dev/null || echo "   DOCUMENTATION-SAUVEGARDE-DONNEES.md non trouvé"
cp ../src-ACTUEL/GUIDE-DEPLOIEMENT.md . 2>/dev/null || echo "   GUIDE-DEPLOIEMENT.md non trouvé"
cp ../src-ACTUEL/README-DOCUMENTATION.md . 2>/dev/null || echo "   README-DOCUMENTATION.md non trouvé"

echo "4. Copie des images..."
cp ../src-ACTUEL/*.png images/ 2>/dev/null || echo "   Images PNG non trouvées"

echo "5. Création du README pour les images..."
cat > images/README.md << 'EOF'
# 🖼️ Images d'Illustration SmartStock CI

Ce dossier contient toutes les captures d'écran de l'application SmartStock CI.

## Images disponibles :
- `Inscription.png` - Interface d'authentification
- `Tableau.png` - Tableau de bord principal
- `Stock.png` - Gestion de stock
- `Finances.png` - Gestion financière
- `Clients.png` - Gestion clients

Ces images sont utilisées dans la documentation et le README principal.
EOF

echo "6. Initialisation Git..."
git init

echo "7. Ajout des fichiers..."
git add .

echo "8. Premier commit..."
git commit -m "Initial commit: SmartStock CI public documentation and guides"

echo
echo "========================================"
echo "  Setup terminé avec succès !"
echo "========================================"
echo
echo "Prochaines étapes :"
echo "1. Créer le repository sur GitHub"
echo "2. Ajouter l'origine remote :"
echo "   git remote add origin https://github.com/Mohkone01/smartstock-ci-public.git"
echo "3. Pousser vers GitHub :"
echo "   git push -u origin main"
echo

# Rendre le script exécutable
chmod +x setup-repository.sh
