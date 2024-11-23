Voici un fichier Markdown décrivant les endpoints de l'API ainsi que les règles métiers associées :

---

# 📚 API : Gestion d'une Librairie

## **Endpoints**

### **1. Créer un livre**
- **URL** : `POST /books`
- **Description** : Ajoute un nouveau livre à la bibliothèque.
- **Requête :**
  ```json
  {
    "title": "1984",
    "author": "George Orwell",
    "category": "Dystopian",
    "published_date": "1949-06-08",
    "pages": 328
  }
  ```  
- **Réponses possibles :**
    - **201 Created** : Livre créé avec succès.
      ```json
      {
        "id": "generated-uuid",
        "message": "Book created successfully!"
      }
      ```
    - **400 Bad Request** : Erreur de validation.
      ```json
      {
        "error": "Validation Error",
        "message": "The 'title' and 'author' fields are required."
      }
      ```

---

### **2. Lister les livres**
- **URL** : `GET /books`
- **Description** : Retourne la liste des livres avec pagination.
- **Paramètres (query)** :
    - `page` : Numéro de la page (par défaut : 1).
    - `limit` : Nombre de livres par page (par défaut : 10).
- **Réponse :**
  ```json
  {
    "current_page": 1,
    "total_pages": 5,
    "data": [
      {
        "id": "uuid-1",
        "title": "1984",
        "author": "George Orwell",
        "category": "Dystopian",
        "published_date": "1949-06-08",
        "pages": 328
      }
    ]
  }
  ```

---

### **3. Rechercher des livres**
- **URL** : `GET /books/search`
- **Description** : Permet de rechercher des livres selon plusieurs critères.
- **Paramètres (query)** :
    - `title` : Rechercher par titre.
    - `author` : Rechercher par auteur.
    - `category` : Rechercher par catégorie.
    - `published_date` : Rechercher par date de publication.
- **Réponse :**
  ```json
  [
    {
      "id": "uuid-1",
      "title": "1984",
      "author": "George Orwell",
      "category": "Dystopian",
      "published_date": "1949-06-08",
      "pages": 328
    }
  ]
  ```

---

### **4. Mettre à jour un livre**
- **URL** : `PUT /books/:id`
- **Description** : Met à jour les informations d’un livre existant.
- **Requête :**
  ```json
  {
    "title": "Animal Farm"
  }
  ```  
- **Réponses possibles :**
    - **200 OK** : Livre mis à jour avec succès.
      ```json
      {
        "message": "Book updated successfully!"
      }
      ```
    - **400 Bad Request** : Erreur de validation ou champ invalide.

---

### **5. Supprimer un livre**
- **URL** : `DELETE /books/:id`
- **Description** : Supprime un livre si aucune réservation n’y est liée.
- **Réponses possibles :**
    - **200 OK** : Livre supprimé avec succès.
    - **403 Forbidden** : Suppression interdite.
      ```json
      {
        "error": "Deletion Forbidden",
        "message": "The book '1984' cannot be deleted because it is currently reserved."
      }
      ```

---

## **Règles Métiers**

1. **Validation des champs obligatoires**
    - Les champs `title` et `author` sont obligatoires lors de la création ou la mise à jour d’un livre.

2. **Catégories limitées**
    - Seules les catégories suivantes sont autorisées : `Fiction`, `Non-fiction`, `Science`, `History`.

3. **Gestion des doublons**
    - Un livre avec le même `title` et `author` ne peut pas être ajouté deux fois.

4. **Validation de la date de publication**
    - Le champ `published_date` ne peut pas être une date future.

5. **Suppression conditionnelle**
    - Un livre ne peut pas être supprimé s’il est associé à une réservation ou commande.

6. **Pagination**
    - Les listes de livres sont paginées avec les paramètres `page` et `limit`.

7. **Nombre de pages minimal**
    - Le champ `pages` doit être supérieur ou égal à 10.

8. **Historique des modifications**
    - Les modifications doivent être tracées avec les champs `modified_by` et `modified_at`.
