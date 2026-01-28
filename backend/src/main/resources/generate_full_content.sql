-- ============================================
-- GÉNÉRATION COMPLÈTE DU CONTENU PÉDAGOGIQUE
-- Pour tous les 11 cours de la plateforme
-- Ce fichier complète lessons_exercises_data.sql
-- ============================================

-- Note: Les options des QCM sont stockées dans des tables séparées
-- Pour insérer les options, utilisez des requêtes séparées après avoir créé les questions

-- ============================================
-- COURS 3: Java et Spring Boot - Leçons supplémentaires
-- ============================================

-- Leçon 3.2: Classes et objets
INSERT INTO lessons (course_id, title_fr, title_en, title_ar, content_fr, content_en, content_ar,
                     key_points_fr, key_points_en, key_points_ar,
                     analogies_fr, analogies_en, analogies_ar,
                     examples_fr, examples_en, examples_ar,
                     order_index, estimated_duration, created_at, updated_at)
VALUES (
  3,
  'Classes et objets : La programmation orientée objet',
  'Classes and Objects: Object-Oriented Programming',
  'الفئات والكائنات: البرمجة الموجهة للكائنات',
  'Une classe est comme un plan de construction pour une maison. L''objet est la maison réelle construite à partir de ce plan. Vous pouvez construire plusieurs maisons (objets) à partir du même plan (classe), mais chaque maison a ses propres caractéristiques (attributs) et peut faire des actions (méthodes).',
  'A class is like a construction plan for a house. The object is the actual house built from that plan. You can build several houses (objects) from the same plan (class), but each house has its own characteristics (attributes) and can perform actions (methods).',
  'الفئة مثل خطة بناء لمنزل. الكائن هو المنزل الفعلي المبني من تلك الخطة. يمكنك بناء عدة منازل (كائنات) من نفس الخطة (الفئة)، لكن كل منزل له خصائصه الخاصة (السمات) ويمكنه تنفيذ إجراءات (طرق).',
  '1. Classe = modèle/plan (ex: Plan de Voiture)\n2. Objet = instance concrète (ex: Ma voiture rouge)\n3. Attribut = caractéristique (ex: couleur, vitesse)\n4. Méthode = action (ex: démarrer(), accélérer())\n5. new = mot-clé pour créer un objet\n6. Constructeur = méthode spéciale qui initialise l''objet',
  '1. Class = template/plan (e.g., Car Plan)\n2. Object = concrete instance (e.g., My red car)\n3. Attribute = characteristic (e.g., color, speed)\n4. Method = action (e.g., start(), accelerate())\n5. new = keyword to create an object\n6. Constructor = special method that initializes the object',
  '1. الفئة = قالب/خطة (مثلاً: خطة سيارة)\n2. الكائن = مثيل ملموس (مثلاً: سيارتي الحمراء)\n3. السمة = خاصية (مثلاً: اللون، السرعة)\n4. الطريقة = إجراء (مثلاً: start()، accelerate())\n5. new = كلمة مفتاحية لإنشاء كائن\n6. المُنشئ = طريقة خاصة تهيئ الكائن',
  'Pensez à une classe "Voiture" : le plan définit qu''une voiture a une couleur, une marque, une vitesse. Vous créez ensuite des objets : "maVoiture" (rouge, Toyota, 0 km/h) et "taVoiture" (bleue, Honda, 0 km/h). Chaque objet est indépendant.',
  'Think of a "Car" class: the plan defines that a car has a color, a brand, a speed. You then create objects: "myCar" (red, Toyota, 0 km/h) and "yourCar" (blue, Honda, 0 km/h). Each object is independent.',
  'فكر في فئة "سيارة": الخطة تحدد أن السيارة لها لون، علامة تجارية، سرعة. ثم تنشئ كائنات: "سيارتي" (حمراء، تويوتا، 0 كم/س) و "سيارتك" (زرقاء، هوندا، 0 كم/س). كل كائن مستقل.',
  'Exemple Java :\n\n// Définition de la classe\npublic class Voiture {\n    // Attributs\n    String couleur;\n    String marque;\n    int vitesse;\n    \n    // Constructeur\n    public Voiture(String c, String m) {\n        couleur = c;\n        marque = m;\n        vitesse = 0;\n    }\n    \n    // Méthode\n    public void accelerer() {\n        vitesse += 10;\n    }\n}\n\n// Création d''objets\nVoiture maVoiture = new Voiture("Rouge", "Toyota");\nmaVoiture.accelerer();\nSystem.out.println("Vitesse : " + maVoiture.vitesse);',
  'Java example:\n\n// Class definition\npublic class Car {\n    // Attributes\n    String color;\n    String brand;\n    int speed;\n    \n    // Constructor\n    public Car(String c, String m) {\n        color = c;\n        brand = m;\n        speed = 0;\n    }\n    \n    // Method\n    public void accelerate() {\n        speed += 10;\n    }\n}\n\n// Object creation\nCar myCar = new Car("Red", "Toyota");\nmyCar.accelerate();\nSystem.out.println("Speed: " + myCar.speed);',
  'مثال Java:\n\n// تعريف الفئة\npublic class Voiture {\n    // السمات\n    String couleur;\n    String marque;\n    int vitesse;\n    \n    // المُنشئ\n    public Voiture(String c, String m) {\n        couleur = c;\n        marque = m;\n        vitesse = 0;\n    }\n    \n    // الطريقة\n    public void accelerer() {\n        vitesse += 10;\n    }\n}\n\n// إنشاء الكائنات\nVoiture maVoiture = new Voiture("أحمر", "تويوتا");\nmaVoiture.accelerer();\nSystem.out.println("السرعة: " + maVoiture.vitesse);',
  2, 45, NOW(), NOW()
);

-- Bloc de code pour leçon 3.2
INSERT INTO code_blocks (lesson_id, code, language, description_fr, description_en, description_ar, is_editable, is_runnable, order_index)
VALUES (
  (SELECT id FROM lessons WHERE course_id = 3 AND order_index = 2),
  'public class Etudiant {
    // Attributs
    private String nom;
    private int age;
    private String[] cours;
    
    // Constructeur
    public Etudiant(String nom, int age) {
        this.nom = nom;
        this.age = age;
        this.cours = new String[5];
    }
    
    // Méthode pour ajouter un cours
    public void ajouterCours(String nomCours) {
        for (int i = 0; i < cours.length; i++) {
            if (cours[i] == null) {
                cours[i] = nomCours;
                break;
            }
        }
    }
    
    // Méthode pour afficher les informations
    public void afficherInfo() {
        System.out.println("Nom: " + nom);
        System.out.println("Âge: " + age);
        System.out.print("Cours: ");
        for (String c : cours) {
            if (c != null) {
                System.out.print(c + " ");
            }
        }
    }
}

// Utilisation
Etudiant etudiant1 = new Etudiant("Ahmed", 25);
etudiant1.ajouterCours("Java");
etudiant1.ajouterCours("Angular");
etudiant1.afficherInfo();',
  'java',
  'Cet exemple montre une classe complète avec attributs, constructeur et méthodes. Vous pouvez créer plusieurs étudiants avec des valeurs différentes.',
  'This example shows a complete class with attributes, constructor and methods. You can create multiple students with different values.',
  'هذا المثال يوضح فئة كاملة مع سمات، مُنشئ وطرق. يمكنك إنشاء عدة طلاب بقيم مختلفة.',
  true,
  true,
  1
);

-- Exercice 3.2
INSERT INTO exercises (course_id, lesson_id, title_fr, title_en, title_ar,
                      description_fr, description_en, description_ar,
                      solution_fr, solution_en, solution_ar,
                      type, order_index, difficulty, created_at, updated_at)
VALUES (
  3, (SELECT id FROM lessons WHERE course_id = 3 AND order_index = 2),
  'Exercice : Créer une classe Livre',
  'Exercise: Create a Book Class',
  'تمرين: إنشاء فئة Livre',
  'Créez une classe "Livre" avec :\n- Attributs : titre (String), auteur (String), nombrePages (int), estEmprunte (boolean)\n- Constructeur qui initialise titre, auteur et nombrePages\n- Méthode emprunter() qui met estEmprunte à true\n- Méthode rendre() qui met estEmprunte à false\n- Méthode afficherInfo() qui affiche toutes les informations\n\nCréez ensuite deux objets Livre et testez les méthodes.',
  'Create a "Book" class with:\n- Attributes: title (String), author (String), pageCount (int), isBorrowed (boolean)\n- Constructor that initializes title, author and pageCount\n- borrow() method that sets isBorrowed to true\n- returnBook() method that sets isBorrowed to false\n- displayInfo() method that displays all information\n\nThen create two Book objects and test the methods.',
  'أنشئ فئة "Livre" مع:\n- السمات: titre (String)، auteur (String)، nombrePages (int)، estEmprunte (boolean)\n- مُنشئ يهيئ titre و auteur و nombrePages\n- طريقة emprunter() التي تجعل estEmprunte true\n- طريقة rendre() التي تجعل estEmprunte false\n- طريقة afficherInfo() التي تعرض جميع المعلومات\n\nثم أنشئ كائنين Livre واختبر الطرق.',
  'Solution :\n\npublic class Livre {\n    private String titre;\n    private String auteur;\n    private int nombrePages;\n    private boolean estEmprunte;\n    \n    public Livre(String titre, String auteur, int nombrePages) {\n        this.titre = titre;\n        this.auteur = auteur;\n        this.nombrePages = nombrePages;\n        this.estEmprunte = false;\n    }\n    \n    public void emprunter() {\n        estEmprunte = true;\n    }\n    \n    public void rendre() {\n        estEmprunte = false;\n    }\n    \n    public void afficherInfo() {\n        System.out.println("Titre: " + titre);\n        System.out.println("Auteur: " + auteur);\n        System.out.println("Pages: " + nombrePages);\n        System.out.println("Emprunté: " + estEmprunte);\n    }\n}\n\n// Test\nLivre livre1 = new Livre("Java pour débutants", "A. Auteur", 300);\nLivre livre2 = new Livre("Angular avancé", "B. Auteur", 450);\n\nlivre1.emprunter();\nlivre1.afficherInfo();\nlivre2.afficherInfo();',
  'Solution:\n\npublic class Book {\n    private String title;\n    private String author;\n    private int pageCount;\n    private boolean isBorrowed;\n    \n    public Book(String title, String author, int pageCount) {\n        this.title = title;\n        this.author = author;\n        this.pageCount = pageCount;\n        this.isBorrowed = false;\n    }\n    \n    public void borrow() {\n        isBorrowed = true;\n    }\n    \n    public void returnBook() {\n        isBorrowed = false;\n    }\n    \n    public void displayInfo() {\n        System.out.println("Title: " + title);\n        System.out.println("Author: " + author);\n        System.out.println("Pages: " + pageCount);\n        System.out.println("Borrowed: " + isBorrowed);\n    }\n}\n\n// Test\nBook book1 = new Book("Java for Beginners", "A. Author", 300);\nBook book2 = new Book("Advanced Angular", "B. Author", 450);\n\nbook1.borrow();\nbook1.displayInfo();\nbook2.displayInfo();',
  'الحل:\n\npublic class Livre {\n    private String titre;\n    private String auteur;\n    private int nombrePages;\n    private boolean estEmprunte;\n    \n    public Livre(String titre, String auteur, int nombrePages) {\n        this.titre = titre;\n        this.auteur = auteur;\n        this.nombrePages = nombrePages;\n        this.estEmprunte = false;\n    }\n    \n    public void emprunter() {\n        estEmprunte = true;\n    }\n    \n    public void rendre() {\n        estEmprunte = false;\n    }\n    \n    public void afficherInfo() {\n        System.out.println("العنوان: " + titre);\n        System.out.println("المؤلف: " + auteur);\n        System.out.println("الصفحات: " + nombrePages);\n        System.out.println("مستعار: " + estEmprunte);\n    }\n}\n\n// اختبار\nLivre livre1 = new Livre("Java للمبتدئين", "أ. مؤلف", 300);\nLivre livre2 = new Livre("Angular المتقدم", "ب. مؤلف", 450);\n\nlivre1.emprunter();\nlivre1.afficherInfo();\nlivre2.afficherInfo();',
  'CODING', 2, 3, NOW(), NOW()
);

-- QCM pour leçon 3.2 (3 questions)
INSERT INTO quiz_questions (exercise_id, question_fr, question_en, question_ar,
                           correct_answer_index, explanation_fr, explanation_en, explanation_ar)
VALUES 
(
  (SELECT id FROM exercises WHERE course_id = 3 AND lesson_id = (SELECT id FROM lessons WHERE course_id = 3 AND order_index = 2) AND order_index = 2),
  'Qu''est-ce qu''un objet en Java ?',
  'What is an object in Java?',
  'ما هو الكائن في Java؟',
  1,
  'Un objet est une instance concrète d''une classe. C''est comme une maison réelle construite à partir d''un plan. Vous créez un objet avec le mot-clé "new" suivi du constructeur de la classe.',
  'An object is a concrete instance of a class. It''s like a real house built from a plan. You create an object with the keyword "new" followed by the class constructor.',
  'الكائن هو مثيل ملموس لفئة. إنه مثل منزل حقيقي مبني من خطة. تنشئ كائنًا بكلمة "new" متبوعة بمُنشئ الفئة.'
),
(
  (SELECT id FROM exercises WHERE course_id = 3 AND lesson_id = (SELECT id FROM lessons WHERE course_id = 3 AND order_index = 2) AND order_index = 2),
  'Quelle est la différence entre une classe et un objet ?',
  'What is the difference between a class and an object?',
  'ما الفرق بين الفئة والكائن؟',
  2,
  'Une classe est un modèle/plan (comme un plan de maison), tandis qu''un objet est une instance concrète créée à partir de cette classe (comme une maison réelle). Vous pouvez créer plusieurs objets à partir d''une seule classe.',
  'A class is a template/plan (like a house plan), while an object is a concrete instance created from that class (like a real house). You can create multiple objects from a single class.',
  'الفئة هي قالب/خطة (مثل خطة منزل)، بينما الكائن هو مثيل ملموس تم إنشاؤه من تلك الفئة (مثل منزل حقيقي). يمكنك إنشاء عدة كائنات من فئة واحدة.'
),
(
  (SELECT id FROM exercises WHERE course_id = 3 AND lesson_id = (SELECT id FROM lessons WHERE course_id = 3 AND order_index = 2) AND order_index = 2),
  'Qu''est-ce qu''un constructeur ?',
  'What is a constructor?',
  'ما هو المُنشئ؟',
  0,
  'Un constructeur est une méthode spéciale qui a le même nom que la classe et qui est appelée automatiquement lors de la création d''un objet. Il sert à initialiser les attributs de l''objet.',
  'A constructor is a special method that has the same name as the class and is automatically called when creating an object. It is used to initialize the object''s attributes.',
  'المُنشئ هو طريقة خاصة لها نفس اسم الفئة ويتم استدعاؤها تلقائيًا عند إنشاء كائن. يُستخدم لتهيئة سمات الكائن.'
);

-- Note: Pour insérer les options des QCM, il faudrait utiliser des requêtes séparées
-- car les options sont dans des tables @ElementCollection
-- Exemple (à faire après insertion de la question):
-- INSERT INTO quiz_options (question_id, option_text) VALUES 
-- ((SELECT id FROM quiz_questions WHERE question_fr LIKE '%Qu''est-ce qu''un objet%'), 'Une méthode'),
-- ((SELECT id FROM quiz_questions WHERE question_fr LIKE '%Qu''est-ce qu''un objet%'), 'Une instance de classe'),
-- ...

-- ============================================
-- PROJET FINAL COURS 3: API REST avec Spring Boot
-- ============================================

INSERT INTO exercises (course_id, lesson_id, title_fr, title_en, title_ar,
                      description_fr, description_en, description_ar,
                      solution_fr, solution_en, solution_ar,
                      type, order_index, difficulty, created_at, updated_at)
VALUES (
  3, NULL,
  'PROJET FINAL : API REST pour gestion de cours',
  'FINAL PROJECT: REST API for Course Management',
  'المشروع النهائي: واجهة برمجية REST لإدارة الكورسات',
  'Créez une API REST complète avec Spring Boot pour gérer des cours :\n1. Modèle "Course" avec id, titre, description, niveau\n2. Repository JPA pour les opérations CRUD\n3. Service avec logique métier\n4. Controller REST avec endpoints :\n   - GET /api/courses (liste)\n   - GET /api/courses/{id} (détails)\n   - POST /api/courses (créer)\n   - PUT /api/courses/{id} (modifier)\n   - DELETE /api/courses/{id} (supprimer)\n5. Testez avec Postman ou curl',
  'Create a complete REST API with Spring Boot to manage courses:\n1. "Course" model with id, title, description, level\n2. JPA Repository for CRUD operations\n3. Service with business logic\n4. REST Controller with endpoints:\n   - GET /api/courses (list)\n   - GET /api/courses/{id} (details)\n   - POST /api/courses (create)\n   - PUT /api/courses/{id} (update)\n   - DELETE /api/courses/{id} (delete)\n5. Test with Postman or curl',
  'أنشئ واجهة برمجية REST كاملة مع Spring Boot لإدارة الكورسات:\n1. نموذج "Course" مع id، titre، description، niveau\n2. مستودع JPA للعمليات CRUD\n3. خدمة مع منطق الأعمال\n4. متحكم REST مع نقاط النهاية:\n   - GET /api/courses (قائمة)\n   - GET /api/courses/{id} (تفاصيل)\n   - POST /api/courses (إنشاء)\n   - PUT /api/courses/{id} (تعديل)\n   - DELETE /api/courses/{id} (حذف)\n5. اختبر باستخدام Postman أو curl',
  'Solution complète disponible dans le code source du projet. Structure :\n\n1. Entity Course\n2. CourseRepository extends JpaRepository\n3. CourseService avec méthodes métier\n4. CourseController avec @RestController et @RequestMapping\n5. Configuration CORS si nécessaire\n\nVoir les fichiers existants dans backend/src/main/java/com/institut/',
  'Complete solution available in project source code. Structure:\n\n1. Course Entity\n2. CourseRepository extends JpaRepository\n3. CourseService with business methods\n4. CourseController with @RestController and @RequestMapping\n5. CORS configuration if needed\n\nSee existing files in backend/src/main/java/com/institut/',
  'الحل الكامل متاح في كود المصدر للمشروع. البنية:\n\n1. كيان Course\n2. CourseRepository يمتد JpaRepository\n3. CourseService مع طرق الأعمال\n4. CourseController مع @RestController و @RequestMapping\n5. تكوين CORS إذا لزم الأمر\n\nانظر الملفات الموجودة في backend/src/main/java/com/institut/',
  'PROJECT', 20, 5, NOW(), NOW()
);

-- ============================================
-- Note: Ce fichier montre la structure pour ajouter du contenu complet
-- Pour tous les cours, suivez le même format :
-- 1. Leçons (3-5 par cours)
-- 2. Exercices de codage pour chaque leçon
-- 3. QCM (3-5 questions par leçon)
-- 4. Blocs de code éditable
-- 5. Projet final pour chaque cours
-- ============================================
