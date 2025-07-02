# 📚 SmartStock CI - Documentation Complète

## 🇨🇮 Application de Gestion Intelligente pour Commerçants Ivoiriens

### Version 1.0.0 | Déployé sur Vercel

---

## 📋 Table des Matières

1. [Vue d'ensemble](#vue-densemble)
2. [Fonctionnalités](#fonctionnalités)
3. [Installation et Déploiement](#installation-et-déploiement)
4. [Guide d'utilisation](#guide-dutilisation)
5. [Architecture technique](#architecture-technique)
6. [Configuration](#configuration)
7. [Dépannage](#dépannage)
8. [Support](#support)

---

## 🎯 Vue d'ensemble

SmartStock CI est une application web moderne conçue spécialement pour les commerçants ivoiriens. Elle offre une solution complète de gestion de stock, finances, et clients avec une interface intuitive en français.

### 🌟 Points forts
- **100% en français** - Interface adaptée aux utilisateurs ivoiriens
- **Gestion multi-utilisateurs** - Isolation complète des données
- **Calculs TVA automatiques** - Conformité fiscale ivoirienne (18%)
- **Sauvegarde automatique** - Aucune perte de données
- **Interface responsive** - Compatible mobile, tablette, desktop
- **PWA Ready** - Installation possible comme app native

---

## ✨ Fonctionnalités

### 📦 **Gestion de Stock**
- Ajout/modification/suppression de produits
- Suivi des quantités en temps réel
- Alertes de stock faible
- Catégorisation des produits
- Gestion des fournisseurs
- Historique des mouvements

### 💰 **Gestion Financière**
- Enregistrement des ventes et achats
- Calcul automatique de la TVA (18%)
- Déclarations fiscales automatisées
- Suivi des bénéfices et pertes
- Rapports financiers détaillés
- Gestion des méthodes de paiement

### 👥 **Gestion Clients**
- Base de données clients complète
- Historique des transactions par client
- Informations de contact
- Suivi des créances
- Fidélisation client

### 📊 **Tableaux de Bord**
- Analytics en temps réel
- Graphiques de performance
- Indicateurs clés (KPI)
- Prévisions de ventes
- Recommandations IA

### 🔐 **Sécurité et Multi-utilisateurs**
- Comptes utilisateurs séparés
- Isolation complète des données
- Sauvegarde automatique
- Récupération de données
- Sessions sécurisées

---

## 🚀 Installation et Déploiement

### **Prérequis**
- Node.js 18+
- npm ou yarn
- Compte GitHub
- Compte Vercel

### **Installation locale**
```bash
# Cloner le repository
git clone https://github.com/Mohkone01/smartstock-ci.git
cd smartstock-ci

# Installer les dépendances
npm install

# Démarrer en mode développement
npm start

# Build de production
npm run build
```

### **Déploiement sur Vercel**
```bash
# Via CLI
npm install -g vercel
vercel login
vercel --prod

# Ou via interface web
# 1. Aller sur vercel.com
# 2. Importer le repository GitHub
# 3. Déployer automatiquement
```

### **URLs de production**
- **Application** : https://smartstock-ci.vercel.app
- **Repository** : https://github.com/Mohkone01/smartstock-ci
- **Dashboard Vercel** : https://vercel.com/mohkone01/smartstock-ci

---

## 📖 Guide d'utilisation

### **1. Première connexion**
1. Ouvrir l'application dans le navigateur
2. Créer un compte utilisateur
3. Configurer les informations du magasin
4. Paramétrer les catégories et fournisseurs

### **2. Gestion des produits**
1. Aller dans "Stock" → "Produits"
2. Cliquer sur "Ajouter un produit"
3. Remplir les informations (nom, prix, quantité, etc.)
4. Sélectionner une catégorie et un fournisseur
5. Sauvegarder

### **3. Enregistrement des ventes**
1. Aller dans "Finances" → "Transactions"
2. Cliquer sur "Nouvelle transaction"
3. Sélectionner "Vente"
4. Choisir le produit et la quantité
5. Renseigner le client (optionnel)
6. Valider la transaction

### **4. Suivi financier**
1. Consulter le tableau de bord pour les KPI
2. Aller dans "Finances" → "Déclarations TVA"
3. Vérifier les calculs automatiques
4. Générer les rapports mensuels

### **5. Gestion des clients**
1. Aller dans "Clients"
2. Ajouter les informations clients
3. Consulter l'historique des achats
4. Suivre les créances

---

## 🏗️ Architecture technique

### **Frontend**
- **React 18** - Framework principal
- **Material-UI** - Composants d'interface
- **Recharts** - Graphiques et analytics
- **React Hooks** - Gestion d'état moderne

### **Stockage**
- **LocalStorage** - Stockage principal
- **Système de backup** - Sauvegardes automatiques
- **Isolation utilisateur** - Données séparées par compte

### **Déploiement**
- **Vercel** - Hébergement et CDN
- **GitHub** - Contrôle de version
- **HTTPS** - Sécurité automatique
- **PWA** - Installation native possible

### **Structure des fichiers**
```
src/
├── components/          # Composants React
│   ├── Auth/           # Authentification
│   ├── Dashboard/      # Tableau de bord
│   ├── Finance/        # Gestion financière
│   ├── Stock/          # Gestion de stock
│   ├── Clients/        # Gestion clients
│   └── Settings/       # Paramètres
├── hooks/              # Hooks personnalisés
├── utils/              # Utilitaires
└── index.js           # Point d'entrée
```

---

## ⚙️ Configuration

### **Variables d'environnement**
```env
REACT_APP_ENV=production
REACT_APP_VERSION=1.0.0
REACT_APP_DEFAULT_CURRENCY=FCFA
REACT_APP_DEFAULT_LANGUAGE=fr
REACT_APP_DEFAULT_TIMEZONE=Africa/Abidjan
REACT_APP_PWA_ENABLED=true
```

### **Configuration Vercel**
```json
{
  "version": 2,
  "builds": [
    {
      "src": "package.json",
      "use": "@vercel/static-build",
      "config": { "distDir": "build" }
    }
  ],
  "routes": [
    { "src": "/(.*)", "dest": "/index.html" }
  ]
}
```

### **Scripts disponibles**
```bash
npm start              # Développement
npm run build          # Build production
npm run vercel-build   # Build pour Vercel
npm test               # Tests
npm run deploy         # Déploiement Vercel
```

---

## 🔧 Dépannage

### **Problèmes courants**

#### **1. Données non sauvegardées**
**Symptôme** : Les transactions ou produits disparaissent après actualisation
**Solution** :
```javascript
// Vérifier le localStorage
console.log(localStorage.getItem('smartstock_transactions'));
console.log(localStorage.getItem('smartstock_products'));

// Forcer une sauvegarde
window.triggerTransactionsSync();
```

#### **2. Erreur de déploiement Vercel**
**Symptôme** : Build failed ou fichiers manquants
**Solutions** :
```bash
# Vérifier que public/index.html existe
ls public/

# Corriger le .gitignore si nécessaire
git add public/
git commit -m "Add missing public folder"
git push origin main
```

#### **3. Interface qui ne répond pas**
**Symptôme** : Boutons ou champs de saisie bloqués
**Solution** :
- Actualiser la page (F5)
- Vider le cache du navigateur
- Vérifier la console pour les erreurs JavaScript

#### **4. Calculs TVA incorrects**
**Symptôme** : Montants de TVA erronés
**Vérification** :
- Taux TVA configuré à 18%
- Formule : TVA = (Montant HT × 18) / 100
- Vérifier les paramètres dans "Réglages"

### **Logs de débogage**
```javascript
// Activer les logs détaillés
localStorage.setItem('smartstock_debug', 'true');

// Vérifier l'état de l'application
console.log('État actuel:', {
  transactions: JSON.parse(localStorage.getItem('smartstock_transactions') || '[]'),
  products: JSON.parse(localStorage.getItem('smartstock_products') || '[]'),
  clients: JSON.parse(localStorage.getItem('smartstock_clients') || '[]')
});
```

### **Récupération de données**
```javascript
// Sauvegarder toutes les données
function backupAllData() {
  const backup = {
    transactions: localStorage.getItem('smartstock_transactions'),
    products: localStorage.getItem('smartstock_products'),
    clients: localStorage.getItem('smartstock_clients'),
    settings: localStorage.getItem('smartstock_settings'),
    timestamp: new Date().toISOString()
  };

  const blob = new Blob([JSON.stringify(backup, null, 2)],
    { type: 'application/json' });
  const url = URL.createObjectURL(blob);
  const a = document.createElement('a');
  a.href = url;
  a.download = `smartstock_backup_${Date.now()}.json`;
  a.click();
}
```

---

## 📞 Support

### **Contacts**
- **Email** : mohkone303@gmail.com
- **GitHub** : https://github.com/Mohkone01/smartstock-ci
- **Issues** : https://github.com/Mohkone01/smartstock-ci/issues

### **Documentation technique**
- **React** : https://reactjs.org/docs
- **Material-UI** : https://mui.com/getting-started
- **Vercel** : https://vercel.com/docs

### **Ressources**
- **Guide utilisateur** : Disponible dans l'application (menu Aide)
- **Tutoriels vidéo** : À venir
- **FAQ** : Section dédiée dans l'application

---

## 🔄 Mises à jour

### **Version actuelle : 1.0.0**
- ✅ Gestion complète de stock
- ✅ Système financier avec TVA
- ✅ Multi-utilisateurs
- ✅ Interface responsive
- ✅ Déploiement Vercel

### **Prochaines versions**
- **1.1.0** : Rapports PDF exportables
- **1.2.0** : Synchronisation cloud
- **1.3.0** : Application mobile native
- **2.0.0** : Intelligence artificielle intégrée

### **Historique des versions**
```
v1.0.0 (2024-12-XX) - Version initiale
- Fonctionnalités de base
- Déploiement Vercel
- Documentation complète
```

---

## 📄 Licence et Crédits

### **Licence**
Propriétaire - Tous droits réservés

### **Développé par**
- **Mohkone** - Développeur principal
- **Email** : mohkone303@gmail.com

### **Technologies utilisées**
- React.js (MIT License)
- Material-UI (MIT License)
- Recharts (MIT License)
- Vercel (Commercial)

### **Remerciements**
Merci à la communauté open source pour les outils et bibliothèques utilisés.

---

## 🇨🇮 Spécialement conçu pour la Côte d'Ivoire

Cette application a été développée en tenant compte des spécificités du marché ivoirien :

- **Langue française** - Interface 100% en français
- **Devise FCFA** - Calculs et affichage en Francs CFA
- **TVA 18%** - Conformité fiscale ivoirienne
- **Fuseau horaire** - Africa/Abidjan par défaut
- **Contexte local** - Adapté aux pratiques commerciales locales

---

*Documentation mise à jour le : 2024-12-XX*
*Version de l'application : 1.0.0*
*Statut du déploiement : ✅ En ligne sur Vercel*
