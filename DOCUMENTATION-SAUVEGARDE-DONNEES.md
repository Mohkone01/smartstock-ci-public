# 💾 Documentation Complète - Sauvegarde et Persistance des Données

## SmartStock CI - Système de Gestion des Données Multi-Plateforme

### Version 1.0.0 | Mise à jour : 2024-12-XX

---

## 📋 Table des Matières

1. [Vue d'ensemble du système](#vue-densemble-du-système)
2. [Mode Web - Sauvegarde Locale](#mode-web---sauvegarde-locale)
3. [Mode Logiciel - Sauvegarde Fichier](#mode-logiciel---sauvegarde-fichier)
4. [Comparaison des modes](#comparaison-des-modes)
5. [Sécurité et confidentialité](#sécurité-et-confidentialité)
6. [Procédures de sauvegarde](#procédures-de-sauvegarde)
7. [Récupération de données](#récupération-de-données)
8. [Bonnes pratiques](#bonnes-pratiques)

---

## 🌐 Vue d'ensemble du système

SmartStock CI fonctionne en **deux modes distincts** avec des systèmes de sauvegarde différents :

### **Mode Web (Navigateur)**
- **URL :** https://smartstock-ci.vercel.app
- **Stockage :** LocalStorage du navigateur
- **Portée :** Appareil + Navigateur spécifique

### **Mode Logiciel (Application Desktop)**
- **Installation :** Application Electron native
- **Stockage :** Fichiers système locaux
- **Portée :** Ordinateur spécifique

---

## 🌐 Mode Web - Sauvegarde Locale

### **🔧 Fonctionnement technique**

#### **Stockage LocalStorage**
```javascript
// Structure de stockage par utilisateur
localStorage.setItem('smartstock_transactions_user_[username]', JSON.stringify(transactions));
localStorage.setItem('smartstock_products_user_[username]', JSON.stringify(products));
localStorage.setItem('smartstock_clients_user_[username]', JSON.stringify(clients));
localStorage.setItem('smartstock_settings_user_[username]', JSON.stringify(settings));
```

#### **Isolation des données**
- **Clé unique** par utilisateur : `smartstock_[type]_user_[username]`
- **Séparation totale** entre les comptes
- **Pas d'accès croisé** possible

### **👥 Gestion multi-utilisateurs**

#### **Création de comptes**
```
✅ Accès libre avec le lien de l'application
✅ Nom d'utilisateur + mot de passe
✅ Pas de validation email requise
✅ Compte fonctionnel immédiatement
```

#### **Sessions utilisateur**
```javascript
// Session stockée localement
{
  username: "MonMagasin",
  loginTime: "2024-12-XX T10:30:00",
  lastActivity: "2024-12-XX T15:45:00",
  settings: {
    currency: "FCFA",
    language: "fr",
    timezone: "Africa/Abidjan"
  },
  isAuthenticated: true
}
```

### **💾 Persistance des données**

#### **Sauvegarde automatique**
- **Temps réel** : Chaque action sauvegardée immédiatement
- **Événements déclencheurs** :
  - Ajout/modification de produit
  - Enregistrement de transaction
  - Ajout de client
  - Modification des paramètres

#### **Système de backup**
```javascript
// Backup automatique avec horodatage
const backupKey = `smartstock_backup_${Date.now()}`;
localStorage.setItem(backupKey, JSON.stringify(allUserData));
```

### **📍 Localisation des données**

#### **Emplacement physique**
```
Windows: C:\Users\[User]\AppData\Local\Google\Chrome\User Data\Default\Local Storage
Mac: ~/Library/Application Support/Google/Chrome/Default/Local Storage
Linux: ~/.config/google-chrome/Default/Local Storage
```

#### **Caractéristiques**
- **Limite de stockage** : ~5-10 MB par domaine
- **Persistance** : Tant que le cache n'est pas vidé
- **Accessibilité** : Navigateur spécifique uniquement

### **🔄 Synchronisation**

#### **Limitations actuelles**
```
❌ Pas de synchronisation entre appareils
❌ Pas de backup cloud automatique
❌ Données liées au navigateur utilisé
❌ Perte possible si cache vidé
```

#### **Solutions de contournement**
```
✅ Export manuel des données (JSON)
✅ Import sur nouvel appareil
✅ Sauvegarde sur cloud personnel
✅ Backup régulier recommandé
```

---

## 💻 Mode Logiciel - Sauvegarde Fichier

### **🔧 Fonctionnement technique**

#### **Stockage fichier système**
```javascript
// Structure de fichiers
AppData/
├── SmartStock-CI/
│   ├── users/
│   │   ├── [username]/
│   │   │   ├── transactions.json
│   │   │   ├── products.json
│   │   │   ├── clients.json
│   │   │   ├── settings.json
│   │   │   └── backups/
│   │   │       ├── backup_2024-12-01.json
│   │   │       └── backup_2024-12-02.json
│   │   └── shared/
│   │       ├── categories.json
│   │       └── suppliers.json
│   └── logs/
│       └── app.log
```

#### **API Electron pour fichiers**
```javascript
// Sauvegarde via Electron
const fs = require('fs').promises;
const path = require('path');

async function saveUserData(username, dataType, data) {
  const userDir = path.join(app.getPath('userData'), 'users', username);
  await fs.mkdir(userDir, { recursive: true });

  const filePath = path.join(userDir, `${dataType}.json`);
  await fs.writeFile(filePath, JSON.stringify(data, null, 2));
}
```

### **💾 Persistance avancée**

#### **Sauvegarde automatique**
- **Intervalle régulier** : Toutes les 5 minutes
- **Sauvegarde immédiate** : À chaque action critique
- **Backup incrémental** : Historique des versions

#### **Système de versioning**
```javascript
// Backup avec versioning
{
  version: "1.0.0",
  timestamp: "2024-12-XX T10:30:00Z",
  user: "MonMagasin",
  data: {
    transactions: [...],
    products: [...],
    clients: [...]
  },
  checksum: "sha256_hash"
}
```

### **📍 Localisation des données**

#### **Emplacements système**
```
Windows: C:\Users\[User]\AppData\Roaming\SmartStock-CI\
Mac: ~/Library/Application Support/SmartStock-CI/
Linux: ~/.config/SmartStock-CI/
```

#### **Avantages**
- **Stockage illimité** (limité par l'espace disque)
- **Persistance garantie** (fichiers système)
- **Backup automatique** avec historique
- **Accès hors ligne** complet

### **🔄 Synchronisation avancée**

#### **Fonctionnalités disponibles**
```
✅ Backup automatique quotidien
✅ Export vers cloud (Google Drive, OneDrive)
✅ Import/Export entre installations
✅ Synchronisation réseau local (future)
```

#### **Configuration cloud**
```javascript
// Configuration synchronisation cloud
{
  cloudProvider: "googledrive", // ou "onedrive", "dropbox"
  autoSync: true,
  syncInterval: "daily",
  encryptionEnabled: true,
  lastSync: "2024-12-XX T08:00:00Z"
}
```

---

## ⚖️ Comparaison des modes

| Aspect | Mode Web | Mode Logiciel |
|--------|----------|---------------|
| **Installation** | Aucune | Application à installer |
| **Accès** | Navigateur web | Application native |
| **Stockage** | LocalStorage (5-10MB) | Fichiers système (illimité) |
| **Persistance** | Dépend du cache | Garantie |
| **Multi-appareils** | ❌ Non | ✅ Avec export/import |
| **Backup automatique** | ✅ Basique | ✅ Avancé avec historique |
| **Synchronisation cloud** | ❌ Manuelle | ✅ Automatique |
| **Sécurité** | LocalStorage | Fichiers chiffrés |
| **Performance** | Rapide | Très rapide |
| **Hors ligne** | ✅ Partiel | ✅ Complet |

---

## 🛡️ Sécurité et confidentialité

### **Mode Web**

#### **Protection des données**
```javascript
// Chiffrement des données sensibles
const encryptedData = CryptoJS.AES.encrypt(
  JSON.stringify(sensitiveData),
  userPassword
).toString();
```

#### **Isolation utilisateur**
- **Clés uniques** par utilisateur
- **Pas d'accès croisé** entre comptes
- **Session sécurisée** avec timeout

### **Mode Logiciel**

#### **Chiffrement fichiers**
```javascript
// Chiffrement AES-256 des fichiers
const crypto = require('crypto');
const algorithm = 'aes-256-gcm';

function encryptFile(data, password) {
  const key = crypto.scryptSync(password, 'salt', 32);
  const iv = crypto.randomBytes(16);
  const cipher = crypto.createCipher(algorithm, key, iv);

  return cipher.update(data, 'utf8', 'hex') + cipher.final('hex');
}
```

#### **Permissions système**
- **Accès restreint** au dossier utilisateur
- **Fichiers protégés** par le système d'exploitation
- **Logs d'audit** des accès

---

## 💾 Procédures de sauvegarde

### **Mode Web - Sauvegarde manuelle**

#### **Export des données**
```javascript
// Fonction d'export disponible dans l'interface
function exportAllData() {
  const userData = {
    transactions: getTransactions(),
    products: getProducts(),
    clients: getClients(),
    settings: getSettings(),
    exportDate: new Date().toISOString(),
    version: "1.0.0"
  };

  downloadJSON(userData, `smartstock_backup_${Date.now()}.json`);
}
```

#### **Procédure utilisateur**
```
1. Aller dans Paramètres → Sauvegarde
2. Cliquer sur "Exporter toutes les données"
3. Fichier JSON téléchargé automatiquement
4. Sauvegarder le fichier sur cloud personnel
```

### **Mode Logiciel - Sauvegarde automatique**

#### **Backup quotidien**
```javascript
// Backup automatique programmé
setInterval(() => {
  createDailyBackup();
}, 24 * 60 * 60 * 1000); // Toutes les 24h

function createDailyBackup() {
  const backupData = gatherAllUserData();
  const filename = `backup_${new Date().toISOString().split('T')[0]}.json`;
  saveToBackupFolder(filename, backupData);
}
```

#### **Backup cloud automatique**
```javascript
// Synchronisation cloud programmée
async function syncToCloud() {
  if (cloudConfig.autoSync) {
    const data = await gatherAllUserData();
    await uploadToCloud(cloudConfig.provider, data);
    updateLastSyncTime();
  }
}

---

## 🔄 Récupération de données

### **Mode Web - Récupération**

#### **Import de sauvegarde**
```javascript
// Fonction d'import dans l'interface
function importBackupData(file) {
  const reader = new FileReader();
  reader.onload = function(e) {
    try {
      const backupData = JSON.parse(e.target.result);

      // Validation des données
      if (validateBackupStructure(backupData)) {
        restoreUserData(backupData);
        showSuccessMessage("Données restaurées avec succès");
      }
    } catch (error) {
      showErrorMessage("Fichier de sauvegarde invalide");
    }
  };
  reader.readAsText(file);
}
```

#### **Procédure de récupération**
```
1. Aller dans Paramètres → Sauvegarde
2. Cliquer sur "Importer des données"
3. Sélectionner le fichier JSON de sauvegarde
4. Confirmer la restauration
5. Données restaurées automatiquement
```

#### **Récupération d'urgence**
```javascript
// Récupération depuis les backups automatiques
function emergencyRestore() {
  const backupKeys = Object.keys(localStorage)
    .filter(key => key.startsWith('smartstock_backup_'))
    .sort()
    .reverse(); // Plus récent en premier

  if (backupKeys.length > 0) {
    const latestBackup = localStorage.getItem(backupKeys[0]);
    restoreFromBackup(JSON.parse(latestBackup));
  }
}
```

### **Mode Logiciel - Récupération avancée**

#### **Restauration automatique**
```javascript
// Détection et récupération automatique
async function autoRecovery() {
  try {
    // Vérifier l'intégrité des fichiers principaux
    const dataIntegrity = await checkDataIntegrity();

    if (!dataIntegrity.isValid) {
      console.log("Corruption détectée, restauration automatique...");

      // Chercher le backup le plus récent
      const latestBackup = await findLatestBackup();
      if (latestBackup) {
        await restoreFromBackup(latestBackup);
        console.log("Données restaurées depuis le backup");
      }
    }
  } catch (error) {
    console.error("Erreur lors de la récupération:", error);
  }
}
```

#### **Historique des versions**
```javascript
// Restauration depuis une version spécifique
async function restoreFromVersion(date) {
  const backupFile = `backup_${date}.json`;
  const backupPath = path.join(userDataPath, 'backups', backupFile);

  if (await fs.access(backupPath)) {
    const backupData = await fs.readFile(backupPath, 'utf8');
    await restoreUserData(JSON.parse(backupData));
    return true;
  }
  return false;
}
```

---

## 📋 Bonnes pratiques

### **Pour les utilisateurs Web**

#### **Sauvegarde régulière**
```
✅ Exporter les données chaque semaine
✅ Sauvegarder sur Google Drive/OneDrive
✅ Garder plusieurs versions de backup
✅ Tester la restauration périodiquement
```

#### **Sécurité navigateur**
```
⚠️ Ne pas vider le cache sans backup
⚠️ Utiliser toujours le même navigateur
⚠️ Éviter la navigation privée pour l'usage quotidien
⚠️ Noter son nom d'utilisateur et mot de passe
```

#### **Multi-appareils**
```
📱 Mobile: Exporter depuis PC → Importer sur mobile
💻 Nouveau PC: Importer la dernière sauvegarde
🔄 Synchronisation: Export/Import manuel régulier
```

### **Pour les utilisateurs Logiciel**

#### **Configuration optimale**
```
✅ Activer la sauvegarde automatique
✅ Configurer la synchronisation cloud
✅ Vérifier l'espace disque disponible
✅ Programmer des backups réguliers
```

#### **Maintenance**
```
🔧 Nettoyer les anciens backups (> 30 jours)
🔧 Vérifier l'intégrité des données mensuellement
🔧 Mettre à jour l'application régulièrement
🔧 Tester la récupération trimestriellement
```

---

## 🚨 Scénarios de récupération

### **Scénario 1 : Cache navigateur vidé (Mode Web)**

#### **Symptômes**
- Application demande de se reconnecter
- Toutes les données semblent perdues
- Historique des transactions vide

#### **Solution**
```
1. Vérifier les backups automatiques dans localStorage
2. Utiliser la fonction de récupération d'urgence
3. Importer la dernière sauvegarde manuelle
4. Recréer les données si aucun backup disponible
```

### **Scénario 2 : Corruption de fichiers (Mode Logiciel)**

#### **Symptômes**
- Application ne démarre pas
- Erreurs de lecture de fichiers
- Données incohérentes

#### **Solution**
```
1. Récupération automatique au démarrage
2. Restauration depuis le backup quotidien
3. Restauration depuis une version antérieure
4. Récupération manuelle depuis les logs
```

### **Scénario 3 : Changement d'appareil**

#### **Mode Web**
```
1. Exporter toutes les données depuis l'ancien appareil
2. Accéder à l'application sur le nouvel appareil
3. Créer le même compte utilisateur
4. Importer les données exportées
```

#### **Mode Logiciel**
```
1. Installer l'application sur le nouvel appareil
2. Copier le dossier de données utilisateur
3. Ou utiliser la synchronisation cloud
4. Vérifier l'intégrité après transfert
```

---

## 📊 Monitoring et maintenance

### **Indicateurs de santé**

#### **Mode Web**
```javascript
// Vérification de l'état du stockage
function checkStorageHealth() {
  const usage = JSON.stringify(localStorage).length;
  const limit = 5 * 1024 * 1024; // 5MB

  return {
    usage: usage,
    limit: limit,
    percentage: (usage / limit) * 100,
    status: usage < limit * 0.8 ? 'healthy' : 'warning'
  };
}
```

#### **Mode Logiciel**
```javascript
// Vérification de l'intégrité des fichiers
async function checkDataIntegrity() {
  const files = ['transactions.json', 'products.json', 'clients.json'];
  const results = {};

  for (const file of files) {
    try {
      const data = await fs.readFile(path.join(userDataPath, file));
      JSON.parse(data); // Test de parsing
      results[file] = { status: 'ok', size: data.length };
    } catch (error) {
      results[file] = { status: 'error', error: error.message };
    }
  }

  return results;
}
```

### **Alertes et notifications**

#### **Alertes de sauvegarde**
```
⚠️ "Dernière sauvegarde il y a plus de 7 jours"
⚠️ "Espace de stockage bientôt plein"
⚠️ "Synchronisation cloud échouée"
⚠️ "Corruption de données détectée"
```

#### **Actions recommandées**
```
✅ Backup immédiat recommandé
✅ Nettoyage des anciennes données
✅ Vérification de la connexion cloud
✅ Récupération automatique lancée
```

---

## 🔮 Évolutions futures

### **Améliorations prévues**

#### **Mode Web**
```
🚀 Synchronisation cloud automatique
🚀 Backup en temps réel
🚀 Partage de données entre utilisateurs
🚀 API de synchronisation
```

#### **Mode Logiciel**
```
🚀 Synchronisation réseau local
🚀 Base de données intégrée
🚀 Backup incrémental intelligent
🚀 Chiffrement avancé
```

### **Intégrations futures**
```
☁️ Google Drive API
☁️ Microsoft OneDrive
☁️ Dropbox Business
☁️ Serveurs privés
```

---

*Documentation mise à jour le : 2025-07-02*
*Version SmartStock CI : 1.0.0*
*Modes supportés : Web + Logiciel (Electron)*
```
