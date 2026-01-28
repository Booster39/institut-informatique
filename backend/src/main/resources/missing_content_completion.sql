-- ============================================
-- CONTENU COMPLÉMENTAIRE POUR COURS 3-11
-- Ce fichier complète le contenu manquant identifié
-- ============================================

-- ============================================
-- COURS 3: Java et Spring Boot - Leçons manquantes
-- ============================================

-- Leçon 3.3: Collections Java
INSERT INTO lessons (course_id, title_fr, title_en, title_ar, content_fr, content_en, content_ar,
                     key_points_fr, key_points_en, key_points_ar,
                     analogies_fr, analogies_en, analogies_ar,
                     examples_fr, examples_en, examples_ar,
                     order_index, estimated_duration, created_at, updated_at)
VALUES (
  3,
  'Collections Java : Listes, Sets et Maps',
  'Java Collections: Lists, Sets and Maps',
  'مجموعات Java: القوائم والمجموعات والخرائط',
  'Les collections Java sont comme des boîtes organisées : une List est comme une boîte où vous gardez l''ordre (comme une liste de courses), un Set est comme une boîte qui n''accepte pas les doublons (comme un carnet d''adresses), et une Map est comme un dictionnaire où chaque mot (clé) a une définition (valeur).',
  'Java collections are like organized boxes: a List is like a box where you keep order (like a shopping list), a Set is like a box that doesn''t accept duplicates (like an address book), and a Map is like a dictionary where each word (key) has a definition (value).',
  'مجموعات Java مثل صناديق منظمة: List مثل صندوق تحافظ فيه على الترتيب (مثل قائمة تسوق)، Set مثل صندوق لا يقبل التكرارات (مثل دفتر عناوين)، و Map مثل قاموس حيث كل كلمة (مفتاح) لها تعريف (قيمة).',
  '1. List = collection ordonnée avec doublons\n2. ArrayList = liste dynamique (tableau redimensionnable)\n3. Set = collection sans doublons\n4. HashSet = set rapide sans ordre\n5. Map = association clé-valeur\n6. HashMap = map rapide sans ordre\n7. Iterator = parcourir une collection',
  '1. List = ordered collection with duplicates\n2. ArrayList = dynamic list (resizable array)\n3. Set = collection without duplicates\n4. HashSet = fast set without order\n5. Map = key-value association\n6. HashMap = fast map without order\n7. Iterator = iterate through collection',
  '1. List = مجموعة مرتبة مع تكرارات\n2. ArrayList = قائمة ديناميكية (مصفوفة قابلة لإعادة الحجم)\n3. Set = مجموعة بدون تكرارات\n4. HashSet = مجموعة سريعة بدون ترتيب\n5. Map = ارتباط مفتاح-قيمة\n6. HashMap = خريطة سريعة بدون ترتيب\n7. Iterator = التكرار عبر مجموعة',
  3, 40, NOW(), NOW()
); ON CONFLICT (course_id, order_index) DO NOTHING;

-- Exercice 3.3
INSERT INTO exercises (course_id, lesson_id, title_fr, title_en, title_ar,
                      description_fr, description_en, description_ar,
                      solution_fr, solution_en, solution_ar,
                      type, order_index, difficulty, created_at, updated_at)
VALUES (
  3, (SELECT id FROM lessons WHERE course_id = 3 AND order_index = 3),
  'Exercice : Manipuler des collections',
  'Exercise: Manipulate Collections',
  'تمرين: التعامل مع المجموعات',
  'Créez un programme qui :\n1. Crée une ArrayList de noms d''étudiants\n2. Ajoute 5 noms\n3. Affiche tous les noms\n4. Crée un HashSet pour éliminer les doublons\n5. Crée une HashMap associant nom → note\n6. Affiche les notes',
  'Create a program that:\n1. Creates an ArrayList of student names\n2. Adds 5 names\n3. Displays all names\n4. Creates a HashSet to eliminate duplicates\n5. Creates a HashMap associating name → grade\n6. Displays grades',
  'أنشئ برنامجًا:\n1. ينشئ ArrayList لأسماء الطلاب\n2. يضيف 5 أسماء\n3. يعرض جميع الأسماء\n4. ينشئ HashSet لإزالة التكرارات\n5. ينشئ HashMap يربط الاسم → الدرجة\n6. يعرض الدرجات',
  'Solution :\n\nimport java.util.*;\n\npublic class CollectionsDemo {\n    public static void main(String[] args) {\n        // ArrayList\n        List<String> noms = new ArrayList<>();\n        noms.add("Ahmed");\n        noms.add("Fatima");\n        noms.add("Mohamed");\n        noms.add("Aicha");\n        noms.add("Ahmed"); // doublon\n        \n        System.out.println("Liste: " + noms);\n        \n        // HashSet (élimine doublons)\n        Set<String> nomsUniques = new HashSet<>(noms);\n        System.out.println("Set: " + nomsUniques);\n        \n        // HashMap\n        Map<String, Integer> notes = new HashMap<>();\n        notes.put("Ahmed", 18);\n        notes.put("Fatima", 16);\n        notes.put("Mohamed", 15);\n        \n        for (Map.Entry<String, Integer> entry : notes.entrySet()) {\n            System.out.println(entry.getKey() + " : " + entry.getValue());\n        }\n    }\n}',
  'Solution:\n\nimport java.util.*;\n\npublic class CollectionsDemo {\n    public static void main(String[] args) {\n        // ArrayList\n        List<String> names = new ArrayList<>();\n        names.add("Ahmed");\n        names.add("Fatima");\n        names.add("Mohamed");\n        names.add("Aicha");\n        names.add("Ahmed"); // duplicate\n        \n        System.out.println("List: " + names);\n        \n        // HashSet (eliminates duplicates)\n        Set<String> uniqueNames = new HashSet<>(names);\n        System.out.println("Set: " + uniqueNames);\n        \n        // HashMap\n        Map<String, Integer> grades = new HashMap<>();\n        grades.put("Ahmed", 18);\n        grades.put("Fatima", 16);\n        grades.put("Mohamed", 15);\n        \n        for (Map.Entry<String, Integer> entry : grades.entrySet()) {\n            System.out.println(entry.getKey() + " : " + entry.getValue());\n        }\n    }\n}',
  'الحل:\n\nimport java.util.*;\n\npublic class CollectionsDemo {\n    public static void main(String[] args) {\n        // ArrayList\n        List<String> noms = new ArrayList<>();\n        noms.add("أحمد");\n        noms.add("فاطمة");\n        noms.add("محمد");\n        noms.add("عائشة");\n        noms.add("أحمد"); // تكرار\n        \n        System.out.println("القائمة: " + noms);\n        \n        // HashSet (يزيل التكرارات)\n        Set<String> nomsUniques = new HashSet<>(noms);\n        System.out.println("المجموعة: " + nomsUniques);\n        \n        // HashMap\n        Map<String, Integer> notes = new HashMap<>();\n        notes.put("أحمد", 18);\n        notes.put("فاطمة", 16);\n        notes.put("محمد", 15);\n        \n        for (Map.Entry<String, Integer> entry : notes.entrySet()) {\n            System.out.println(entry.getKey() + " : " + entry.getValue());\n        }\n    }\n}',
  'CODING', 3, 3, NOW(), NOW()
);

-- QCM pour leçon 3.3 (4 questions)
INSERT INTO quiz_questions (exercise_id, question_fr, question_en, question_ar,
                           correct_answer_index, explanation_fr, explanation_en, explanation_ar)
VALUES 
(
  (SELECT id FROM exercises WHERE course_id = 3 AND lesson_id = (SELECT id FROM lessons WHERE course_id = 3 AND order_index = 3) AND order_index = 3),
  'Quelle est la différence principale entre ArrayList et HashSet ?',
  'What is the main difference between ArrayList and HashSet?',
  'ما الفرق الرئيسي بين ArrayList و HashSet؟',
  1,
  'ArrayList maintient l''ordre et accepte les doublons. HashSet n''accepte pas les doublons et ne garantit pas l''ordre. Utilisez ArrayList pour une liste ordonnée, HashSet pour éliminer les doublons.',
  'ArrayList maintains order and accepts duplicates. HashSet does not accept duplicates and does not guarantee order. Use ArrayList for an ordered list, HashSet to eliminate duplicates.',
  'ArrayList يحافظ على الترتيب ويقبل التكرارات. HashSet لا يقبل التكرارات ولا يضمن الترتيب. استخدم ArrayList لقائمة مرتبة، HashSet لإزالة التكرارات.'
),
(
  (SELECT id FROM exercises WHERE course_id = 3 AND lesson_id = (SELECT id FROM lessons WHERE course_id = 3 AND order_index = 3) AND order_index = 3),
  'Qu''est-ce qu''une Map en Java ?',
  'What is a Map in Java?',
  'ما هي Map في Java؟',
  2,
  'Une Map est une collection qui associe des clés à des valeurs. Chaque clé est unique. C''est comme un dictionnaire : le mot (clé) correspond à sa définition (valeur).',
  'A Map is a collection that associates keys with values. Each key is unique. It''s like a dictionary: the word (key) corresponds to its definition (value).',
  'Map هي مجموعة تربط المفاتيح بالقيم. كل مفتاح فريد. إنه مثل قاموس: الكلمة (المفتاح) تتوافق مع تعريفها (القيمة).'
),
(
  (SELECT id FROM exercises WHERE course_id = 3 AND lesson_id = (SELECT id FROM lessons WHERE course_id = 3 AND order_index = 3) AND order_index = 3),
  'Comment parcourir une ArrayList en Java ?',
  'How to iterate through an ArrayList in Java?',
  'كيف تتكرر عبر ArrayList في Java؟',
  0,
  'Vous pouvez utiliser : une boucle for classique (for (int i = 0; i < list.size(); i++)), une boucle for-each (for (String item : list)), ou un Iterator. La boucle for-each est la plus simple.',
  'You can use: a classic for loop (for (int i = 0; i < list.size(); i++)), a for-each loop (for (String item : list)), or an Iterator. The for-each loop is the simplest.',
  'يمكنك استخدام: حلقة for كلاسيكية (for (int i = 0; i < list.size(); i++))، حلقة for-each (for (String item : list))، أو Iterator. حلقة for-each هي الأبسط.'
),
(
  (SELECT id FROM exercises WHERE course_id = 3 AND lesson_id = (SELECT id FROM lessons WHERE course_id = 3 AND order_index = 3) AND order_index = 3),
  'Quelle collection utiliser pour stocker des paires clé-valeur ?',
  'Which collection to use to store key-value pairs?',
  'أي مجموعة تستخدم لتخزين أزواج مفتاح-قيمة؟',
  3,
  'HashMap est la collection idéale pour stocker des paires clé-valeur. Elle permet un accès rapide aux valeurs via leur clé. Exemple : Map<String, Integer> notes = new HashMap<>();',
  'HashMap is the ideal collection to store key-value pairs. It allows fast access to values via their key. Example: Map<String, Integer> grades = new HashMap<>();',
  'HashMap هي المجموعة المثالية لتخزين أزواج مفتاح-قيمة. تسمح بالوصول السريع إلى القيم عبر مفتاحها. مثال: Map<String, Integer> notes = new HashMap<>();'
);

-- Leçon 3.4: Gestion des exceptions
INSERT INTO lessons (course_id, title_fr, title_en, title_ar, content_fr, content_en, content_ar,
                     key_points_fr, key_points_en, key_points_ar,
                     analogies_fr, analogies_en, analogies_ar,
                     examples_fr, examples_en, examples_ar,
                     order_index, estimated_duration, created_at, updated_at)
VALUES (
  3,
  'Gestion des exceptions : try-catch-finally',
  'Exception Handling: try-catch-finally',
  'معالجة الاستثناءات: try-catch-finally',
  'Les exceptions sont comme des accidents de route : parfois, quelque chose d''inattendu se produit (une erreur). Le bloc try est comme conduire prudemment, catch est comme avoir un plan B si un accident arrive, et finally est comme nettoyer après, peu importe ce qui s''est passé. Cela permet à votre programme de ne pas planter complètement.',
  'Exceptions are like road accidents: sometimes something unexpected happens (an error). The try block is like driving carefully, catch is like having a plan B if an accident happens, and finally is like cleaning up afterwards, no matter what happened. This allows your program not to crash completely.',
  'الاستثناءات مثل حوادث الطريق: أحيانًا يحدث شيء غير متوقع (خطأ). كتلة try مثل القيادة بحذر، catch مثل وجود خطة بديلة إذا حدث حادث، و finally مثل التنظيف بعد ذلك، بغض النظر عما حدث. هذا يسمح لبرنامجك بعدم التعطل تمامًا.',
  '1. Exception = erreur à l''exécution\n2. try = code à risque\n3. catch = gestion de l''erreur\n4. finally = code toujours exécuté\n5. throw = lancer une exception\n6. throws = déclarer une exception\n7. Exception types : RuntimeException, IOException, etc.',
  '1. Exception = runtime error\n2. try = risky code\n3. catch = error handling\n4. finally = code always executed\n5. throw = throw an exception\n6. throws = declare an exception\n7. Exception types: RuntimeException, IOException, etc.',
  '1. Exception = خطأ في وقت التشغيل\n2. try = كود محفوف بالمخاطر\n3. catch = معالجة الخطأ\n4. finally = كود يُنفذ دائمًا\n5. throw = رمي استثناء\n6. throws = الإعلان عن استثناء\n7. أنواع الاستثناءات: RuntimeException، IOException، إلخ.',
  4, 35, NOW(), NOW()
); ON CONFLICT (course_id, order_index) DO NOTHING;

-- Exercice 3.4
INSERT INTO exercises (course_id, lesson_id, title_fr, title_en, title_ar,
                      description_fr, description_en, description_ar,
                      solution_fr, solution_en, solution_ar,
                      type, order_index, difficulty, created_at, updated_at)
VALUES (
  3, (SELECT id FROM lessons WHERE course_id = 3 AND order_index = 4),
  'Exercice : Gérer les exceptions',
  'Exercise: Handle Exceptions',
  'تمرين: معالجة الاستثناءات',
  'Créez un programme qui :\n1. Demande un nombre à l''utilisateur\n2. Divise 100 par ce nombre\n3. Gère l''exception si l''utilisateur entre 0\n4. Affiche un message d''erreur approprié\n5. Utilise finally pour afficher "Fin du calcul"',
  'Create a program that:\n1. Asks user for a number\n2. Divides 100 by this number\n3. Handles exception if user enters 0\n4. Displays appropriate error message\n5. Uses finally to display "End of calculation"',
  'أنشئ برنامجًا:\n1. يطلب رقمًا من المستخدم\n2. يقسم 100 على هذا الرقم\n3. يتعامل مع الاستثناء إذا أدخل المستخدم 0\n4. يعرض رسالة خطأ مناسبة\n5. يستخدم finally لعرض "نهاية الحساب"',
  'Solution :\n\nimport java.util.Scanner;\n\npublic class ExceptionDemo {\n    public static void main(String[] args) {\n        Scanner scanner = new Scanner(System.in);\n        \n        try {\n            System.out.print("Entrez un nombre : ");\n            int nombre = scanner.nextInt();\n            \n            int resultat = 100 / nombre;\n            System.out.println("Résultat : " + resultat);\n            \n        } catch (ArithmeticException e) {\n            System.out.println("Erreur : Division par zéro !");\n        } catch (Exception e) {\n            System.out.println("Erreur : " + e.getMessage());\n        } finally {\n            System.out.println("Fin du calcul");\n            scanner.close();\n        }\n    }\n}',
  'Solution:\n\nimport java.util.Scanner;\n\npublic class ExceptionDemo {\n    public static void main(String[] args) {\n        Scanner scanner = new Scanner(System.in);\n        \n        try {\n            System.out.print("Enter a number: ");\n            int number = scanner.nextInt();\n            \n            int result = 100 / number;\n            System.out.println("Result: " + result);\n            \n        } catch (ArithmeticException e) {\n            System.out.println("Error: Division by zero!");\n        } catch (Exception e) {\n            System.out.println("Error: " + e.getMessage());\n        } finally {\n            System.out.println("End of calculation");\n            scanner.close();\n        }\n    }\n}',
  'الحل:\n\nimport java.util.Scanner;\n\npublic class ExceptionDemo {\n    public static void main(String[] args) {\n        Scanner scanner = new Scanner(System.in);\n        \n        try {\n            System.out.print("أدخل رقمًا: ");\n            int nombre = scanner.nextInt();\n            \n            int resultat = 100 / nombre;\n            System.out.println("النتيجة: " + resultat);\n            \n        } catch (ArithmeticException e) {\n            System.out.println("خطأ: القسمة على صفر!");\n        } catch (Exception e) {\n            System.out.println("خطأ: " + e.getMessage());\n        } finally {\n            System.out.println("نهاية الحساب");\n            scanner.close();\n        }\n    }\n}',
  'CODING', 4, 3, NOW(), NOW()
);

-- QCM pour leçon 3.4 (4 questions)
INSERT INTO quiz_questions (exercise_id, question_fr, question_en, question_ar,
                           correct_answer_index, explanation_fr, explanation_en, explanation_ar)
VALUES 
(
  (SELECT id FROM exercises WHERE course_id = 3 AND lesson_id = (SELECT id FROM lessons WHERE course_id = 3 AND order_index = 4) AND order_index = 4),
  'Qu''est-ce qu''une exception en Java ?',
  'What is an exception in Java?',
  'ما هو الاستثناء في Java؟',
  1,
  'Une exception est une erreur qui se produit pendant l''exécution du programme. Elle interrompt le flux normal d''exécution. Les exceptions doivent être gérées avec try-catch pour éviter que le programme ne plante.',
  'An exception is an error that occurs during program execution. It interrupts the normal execution flow. Exceptions must be handled with try-catch to prevent the program from crashing.',
  'الاستثناء هو خطأ يحدث أثناء تنفيذ البرنامج. يقاطع التدفق الطبيعي للتنفيذ. يجب معالجة الاستثناءات بـ try-catch لمنع تعطل البرنامج.'
),
(
  (SELECT id FROM exercises WHERE course_id = 3 AND lesson_id = (SELECT id FROM lessons WHERE course_id = 3 AND order_index = 4) AND order_index = 4),
  'Quelle est la différence entre try et catch ?',
  'What is the difference between try and catch?',
  'ما الفرق بين try و catch؟',
  2,
  'try contient le code qui peut générer une exception. catch contient le code qui gère l''exception si elle se produit. Vous pouvez avoir plusieurs blocs catch pour différents types d''exceptions.',
  'try contains code that may generate an exception. catch contains code that handles the exception if it occurs. You can have multiple catch blocks for different exception types.',
  'try يحتوي على الكود الذي قد يولد استثناء. catch يحتوي على الكود الذي يتعامل مع الاستثناء إذا حدث. يمكنك الحصول على عدة كتل catch لأنواع مختلفة من الاستثناءات.'
),
(
  (SELECT id FROM exercises WHERE course_id = 3 AND lesson_id = (SELECT id FROM lessons WHERE course_id = 3 AND order_index = 4) AND order_index = 4),
  'Quand le bloc finally est-il exécuté ?',
  'When is the finally block executed?',
  'متى يتم تنفيذ كتلة finally؟',
  0,
  'Le bloc finally est toujours exécuté, qu''une exception soit levée ou non. Il est utile pour le nettoyage (fermer des fichiers, libérer des ressources) qui doit se faire dans tous les cas.',
  'The finally block is always executed, whether an exception is thrown or not. It is useful for cleanup (closing files, releasing resources) that must be done in all cases.',
  'كتلة finally تُنفذ دائمًا، سواء تم رمي استثناء أم لا. إنها مفيدة للتنظيف (إغلاق الملفات، تحرير الموارد) الذي يجب أن يتم في جميع الحالات.'
),
(
  (SELECT id FROM exercises WHERE course_id = 3 AND lesson_id = (SELECT id FROM lessons WHERE course_id = 3 AND order_index = 4) AND order_index = 4),
  'Quelle exception est levée lors d''une division par zéro ?',
  'Which exception is thrown during division by zero?',
  'أي استثناء يُرمى عند القسمة على صفر؟',
  3,
  'ArithmeticException est levée lors d''une division par zéro en Java. C''est une RuntimeException, donc elle n''a pas besoin d''être déclarée avec throws.',
  'ArithmeticException is thrown during division by zero in Java. It is a RuntimeException, so it does not need to be declared with throws.',
  'ArithmeticException تُرمى عند القسمة على صفر في Java. إنها RuntimeException، لذلك لا تحتاج إلى الإعلان بـ throws.'
);

-- ============================================
-- COURS 4: Angular - Leçons manquantes
-- ============================================

-- Leçon 4.4: Routing Angular (déjà dans all_courses_complete_content.sql mais vérifions)
-- Leçon 4.5: Forms Angular
INSERT INTO lessons (course_id, title_fr, title_en, title_ar, content_fr, content_en, content_ar,
                     key_points_fr, key_points_en, key_points_ar,
                     analogies_fr, analogies_en, analogies_ar,
                     examples_fr, examples_en, examples_ar,
                     order_index, estimated_duration, created_at, updated_at)
VALUES (
  4,
  'Forms Angular : Gestion des formulaires',
  'Angular Forms: Form Management',
  'نماذج Angular: إدارة النماذج',
  'Les formulaires Angular sont comme des questionnaires interactifs : vous créez des champs (input), vous validez les données (validation), et vous récupérez les valeurs soumises (submit). Angular offre deux approches : Template-Driven Forms (simple, déclaratif) et Reactive Forms (puissant, programmatique).',
  'Angular forms are like interactive questionnaires: you create fields (input), validate data (validation), and retrieve submitted values (submit). Angular offers two approaches: Template-Driven Forms (simple, declarative) and Reactive Forms (powerful, programmatic).',
  'نماذج Angular مثل استبيانات تفاعلية: تنشئ حقولًا (input)، تتحقق من البيانات (validation)، وتسترد القيم المقدمة (submit). Angular تقدم نهجين: Template-Driven Forms (بسيط، تصريحي) و Reactive Forms (قوي، برمجي).',
  '1. FormsModule = pour Template-Driven Forms\n2. ReactiveFormsModule = pour Reactive Forms\n3. ngModel = liaison bidirectionnelle\n4. FormGroup = groupe de champs\n5. FormControl = contrôle d''un champ\n6. Validators = règles de validation\n7. submit() = soumettre le formulaire',
  '1. FormsModule = for Template-Driven Forms\n2. ReactiveFormsModule = for Reactive Forms\n3. ngModel = two-way binding\n4. FormGroup = group of fields\n5. FormControl = control of a field\n6. Validators = validation rules\n7. submit() = submit form',
  '1. FormsModule = للنماذج القائمة على القالب\n2. ReactiveFormsModule = للنماذج التفاعلية\n3. ngModel = ربط ثنائي الاتجاه\n4. FormGroup = مجموعة حقول\n5. FormControl = تحكم في حقل\n6. Validators = قواعد التحقق\n7. submit() = تقديم النموذج',
  5, 40, NOW(), NOW()
); ON CONFLICT (course_id, order_index) DO NOTHING;

-- Exercice 4.5
INSERT INTO exercises (course_id, lesson_id, title_fr, title_en, title_ar,
                      description_fr, description_en, description_ar,
                      solution_fr, solution_en, solution_ar,
                      type, order_index, difficulty, created_at, updated_at)
VALUES (
  4, (SELECT id FROM lessons WHERE course_id = 4 AND order_index = 5),
  'Exercice : Créer un formulaire de contact',
  'Exercise: Create a Contact Form',
  'تمرين: إنشاء نموذج اتصال',
  'Créez un formulaire Angular avec :\n1. Champs : nom, email, message\n2. Validation : nom requis, email valide, message min 10 caractères\n3. Affichage des erreurs de validation\n4. Soumission du formulaire avec affichage des données',
  'Create an Angular form with:\n1. Fields: name, email, message\n2. Validation: name required, valid email, message min 10 characters\n3. Display validation errors\n4. Form submission with data display',
  'أنشئ نموذج Angular مع:\n1. حقول: الاسم، البريد الإلكتروني، الرسالة\n2. التحقق: الاسم مطلوب، بريد إلكتروني صالح، الرسالة 10 أحرف على الأقل\n3. عرض أخطاء التحقق\n4. تقديم النموذج مع عرض البيانات',
  'Solution :\n\n// component.ts\nimport { FormBuilder, FormGroup, Validators } from ''@angular/forms'';\n\nexport class ContactComponent {\n  contactForm: FormGroup;\n  \n  constructor(private fb: FormBuilder) {\n    this.contactForm = this.fb.group({\n      name: ['''', Validators.required],\n      email: ['''', [Validators.required, Validators.email]],\n      message: ['''', [Validators.required, Validators.minLength(10)]]\n    });\n  }\n  \n  onSubmit() {\n    if (this.contactForm.valid) {\n      console.log(this.contactForm.value);\n    }\n  }\n}\n\n// template.html\n<form [formGroup]="contactForm" (ngSubmit)="onSubmit()">\n  <input formControlName="name" placeholder="Nom">\n  <div *ngIf="contactForm.get(''name'')?.hasError(''required'')">\n    Le nom est requis\n  </div>\n  \n  <input formControlName="email" type="email" placeholder="Email">\n  <div *ngIf="contactForm.get(''email'')?.hasError(''email'')">\n    Email invalide\n  </div>\n  \n  <textarea formControlName="message" placeholder="Message"></textarea>\n  <div *ngIf="contactForm.get(''message'')?.hasError(''minlength'')">\n    Minimum 10 caractères\n  </div>\n  \n  <button type="submit" [disabled]="contactForm.invalid">Envoyer</button>\n</form>',
  'Solution:\n\n// component.ts\nimport { FormBuilder, FormGroup, Validators } from ''@angular/forms'';\n\nexport class ContactComponent {\n  contactForm: FormGroup;\n  \n  constructor(private fb: FormBuilder) {\n    this.contactForm = this.fb.group({\n      name: ['''', Validators.required],\n      email: ['''', [Validators.required, Validators.email]],\n      message: ['''', [Validators.required, Validators.minLength(10)]]\n    });\n  }\n  \n  onSubmit() {\n    if (this.contactForm.valid) {\n      console.log(this.contactForm.value);\n    }\n  }\n}\n\n// template.html\n<form [formGroup]="contactForm" (ngSubmit)="onSubmit()">\n  <input formControlName="name" placeholder="Name">\n  <div *ngIf="contactForm.get(''name'')?.hasError(''required'')">\n    Name is required\n  </div>\n  \n  <input formControlName="email" type="email" placeholder="Email">\n  <div *ngIf="contactForm.get(''email'')?.hasError(''email'')">\n    Invalid email\n  </div>\n  \n  <textarea formControlName="message" placeholder="Message"></textarea>\n  <div *ngIf="contactForm.get(''message'')?.hasError(''minlength'')">\n    Minimum 10 characters\n  </div>\n  \n  <button type="submit" [disabled]="contactForm.invalid">Send</button>\n</form>',
  'الحل:\n\n// component.ts\nimport { FormBuilder, FormGroup, Validators } from ''@angular/forms'';\n\nexport class ContactComponent {\n  contactForm: FormGroup;\n  \n  constructor(private fb: FormBuilder) {\n    this.contactForm = this.fb.group({\n      name: ['''', Validators.required],\n      email: ['''', [Validators.required, Validators.email]],\n      message: ['''', [Validators.required, Validators.minLength(10)]]\n    });\n  }\n  \n  onSubmit() {\n    if (this.contactForm.valid) {\n      console.log(this.contactForm.value);\n    }\n  }\n}\n\n// template.html\n<form [formGroup]="contactForm" (ngSubmit)="onSubmit()">\n  <input formControlName="name" placeholder="الاسم">\n  <div *ngIf="contactForm.get(''name'')?.hasError(''required'')">\n    الاسم مطلوب\n  </div>\n  \n  <input formControlName="email" type="email" placeholder="البريد الإلكتروني">\n  <div *ngIf="contactForm.get(''email'')?.hasError(''email'')">\n    بريد إلكتروني غير صالح\n  </div>\n  \n  <textarea formControlName="message" placeholder="الرسالة"></textarea>\n  <div *ngIf="contactForm.get(''message'')?.hasError(''minlength'')">\n    10 أحرف على الأقل\n  </div>\n  \n  <button type="submit" [disabled]="contactForm.invalid">إرسال</button>\n</form>',
  'CODING', 5, 4, NOW(), NOW()
);

-- QCM pour leçon 4.5 (4 questions)
INSERT INTO quiz_questions (exercise_id, question_fr, question_en, question_ar,
                           correct_answer_index, explanation_fr, explanation_en, explanation_ar)
VALUES 
(
  (SELECT id FROM exercises WHERE course_id = 4 AND lesson_id = (SELECT id FROM lessons WHERE course_id = 4 AND order_index = 5) AND order_index = 5),
  'Quelle est la différence entre Template-Driven Forms et Reactive Forms ?',
  'What is the difference between Template-Driven Forms and Reactive Forms?',
  'ما الفرق بين Template-Driven Forms و Reactive Forms؟',
  1,
  'Template-Driven Forms sont simples et déclaratifs, utilisent ngModel et la validation dans le template. Reactive Forms sont plus puissants, programmatiques, utilisent FormGroup/FormControl et la validation dans le TypeScript.',
  'Template-Driven Forms are simple and declarative, use ngModel and validation in template. Reactive Forms are more powerful, programmatic, use FormGroup/FormControl and validation in TypeScript.',
  'Template-Driven Forms بسيطة وتصريحية، تستخدم ngModel والتحقق في القالب. Reactive Forms أقوى، برمجية، تستخدم FormGroup/FormControl والتحقق في TypeScript.'
),
(
  (SELECT id FROM exercises WHERE course_id = 4 AND lesson_id = (SELECT id FROM lessons WHERE course_id = 4 AND order_index = 5) AND order_index = 5),
  'Qu''est-ce qu''un FormControl ?',
  'What is a FormControl?',
  'ما هو FormControl؟',
  2,
  'FormControl est un objet qui représente un champ de formulaire individuel. Il contient la valeur, l''état de validation, et les erreurs. Il est utilisé dans Reactive Forms.',
  'FormControl is an object that represents an individual form field. It contains the value, validation state, and errors. It is used in Reactive Forms.',
  'FormControl هو كائن يمثل حقل نموذج فردي. يحتوي على القيمة، حالة التحقق، والأخطاء. يُستخدم في Reactive Forms.'
),
(
  (SELECT id FROM exercises WHERE course_id = 4 AND lesson_id = (SELECT id FROM lessons WHERE course_id = 4 AND order_index = 5) AND order_index = 5),
  'Comment valider un champ email dans Angular ?',
  'How to validate an email field in Angular?',
  'كيف تتحقق من حقل بريد إلكتروني في Angular؟',
  0,
  'Utilisez Validators.email dans Reactive Forms : email: ['''', [Validators.required, Validators.email]]. Pour Template-Driven Forms, utilisez l''attribut type="email" et required.',
  'Use Validators.email in Reactive Forms: email: ['''', [Validators.required, Validators.email]]. For Template-Driven Forms, use type="email" attribute and required.',
  'استخدم Validators.email في Reactive Forms: email: ['''', [Validators.required, Validators.email]]. للنماذج القائمة على القالب، استخدم السمة type="email" و required.'
),
(
  (SELECT id FROM exercises WHERE course_id = 4 AND lesson_id = (SELECT id FROM lessons WHERE course_id = 4 AND order_index = 5) AND order_index = 5),
  'Comment désactiver un bouton si le formulaire est invalide ?',
  'How to disable a button if the form is invalid?',
  'كيف تعطل زرًا إذا كان النموذج غير صالح؟',
  3,
  'Utilisez [disabled]="contactForm.invalid" sur le bouton. Le formulaire est invalide si au moins un champ ne respecte pas les règles de validation.',
  'Use [disabled]="contactForm.invalid" on the button. The form is invalid if at least one field does not meet validation rules.',
  'استخدم [disabled]="contactForm.invalid" على الزر. النموذج غير صالح إذا كان حقل واحد على الأقل لا يلتزم بقواعد التحقق.'
);

-- ============================================
-- COURS 5: PostgreSQL - Leçons manquantes
-- ============================================

-- Leçon 5.4: INSERT, UPDATE, DELETE
INSERT INTO lessons (course_id, title_fr, title_en, title_ar, content_fr, content_en, content_ar,
                     key_points_fr, key_points_en, key_points_ar,
                     analogies_fr, analogies_en, analogies_ar,
                     examples_fr, examples_en, examples_ar,
                     order_index, estimated_duration, created_at, updated_at)
VALUES (
  5,
  'INSERT, UPDATE, DELETE : Modifier les données',
  'INSERT, UPDATE, DELETE: Modifying Data',
  'INSERT، UPDATE، DELETE: تعديل البيانات',
  'INSERT, UPDATE et DELETE sont comme les trois actions de base sur un classeur : INSERT ajoute une nouvelle fiche (nouvelle ligne), UPDATE modifie une fiche existante (modifie des valeurs), et DELETE supprime une fiche (supprime une ligne). Ces opérations permettent de gérer complètement les données dans votre base.',
  'INSERT, UPDATE and DELETE are like the three basic actions on a filing cabinet: INSERT adds a new file (new row), UPDATE modifies an existing file (modifies values), and DELETE removes a file (deletes a row). These operations allow complete data management in your database.',
  'INSERT و UPDATE و DELETE مثل ثلاث إجراءات أساسية على خزانة ملفات: INSERT يضيف ملفًا جديدًا (صف جديد)، UPDATE يعدل ملفًا موجودًا (يعدل القيم)، و DELETE يزيل ملفًا (يحذف صفًا). هذه العمليات تسمح بإدارة كاملة للبيانات في قاعدة البيانات.',
  '1. INSERT = ajouter une nouvelle ligne\n2. UPDATE = modifier des valeurs existantes\n3. DELETE = supprimer des lignes\n4. WHERE = condition pour cibler les lignes\n5. SET = définir les nouvelles valeurs\n6. RETURNING = retourner les lignes modifiées\n7. Transaction = grouper plusieurs opérations',
  '1. INSERT = add a new row\n2. UPDATE = modify existing values\n3. DELETE = delete rows\n4. WHERE = condition to target rows\n5. SET = set new values\n6. RETURNING = return modified rows\n7. Transaction = group multiple operations',
  '1. INSERT = إضافة صف جديد\n2. UPDATE = تعديل القيم الموجودة\n3. DELETE = حذف الصفوف\n4. WHERE = شرط لاستهداف الصفوف\n5. SET = تعيين القيم الجديدة\n6. RETURNING = إرجاع الصفوف المعدلة\n7. Transaction = تجميع عدة عمليات',
  4, 35, NOW(), NOW()
); ON CONFLICT (course_id, order_index) DO NOTHING;

-- Exercice 5.4
INSERT INTO exercises (course_id, lesson_id, title_fr, title_en, title_ar,
                      description_fr, description_en, description_ar,
                      solution_fr, solution_en, solution_ar,
                      type, order_index, difficulty, created_at, updated_at)
VALUES (
  5, (SELECT id FROM lessons WHERE course_id = 5 AND order_index = 4),
  'Exercice : Modifier les données',
  'Exercise: Modify Data',
  'تمرين: تعديل البيانات',
  'Écrivez des requêtes SQL pour :\n1. Insérer un nouveau cours dans la table courses\n2. Mettre à jour le titre d''un cours existant\n3. Supprimer un cours spécifique\n4. Insérer plusieurs leçons en une seule requête\n5. Mettre à jour plusieurs cours en une fois',
  'Write SQL queries to:\n1. Insert a new course into courses table\n2. Update the title of an existing course\n3. Delete a specific course\n4. Insert multiple lessons in a single query\n5. Update multiple courses at once',
  'اكتب استعلامات SQL لـ:\n1. إدراج كورس جديد في جدول courses\n2. تحديث عنوان كورس موجود\n3. حذف كورس محدد\n4. إدراج عدة دروس في استعلام واحد\n5. تحديث عدة كورسات دفعة واحدة',
  'Solutions SQL :\n\n-- 1. INSERT\nINSERT INTO courses (title_fr, title_en, title_ar, level, order_index)\nVALUES (''Nouveau Cours'', ''New Course'', ''كورس جديد'', ''BEGINNER'', 12);\n\n-- 2. UPDATE\nUPDATE courses\nSET title_fr = ''Titre Modifié''\nWHERE id = 1;\n\n-- 3. DELETE\nDELETE FROM courses\nWHERE id = 12;\n\n-- 4. INSERT multiple\nINSERT INTO lessons (course_id, title_fr, title_en, title_ar, order_index)\nVALUES\n  (1, ''Leçon 1'', ''Lesson 1'', ''الدرس 1'', 1),\n  (1, ''Leçon 2'', ''Lesson 2'', ''الدرس 2'', 2); ON CONFLICT (course_id, order_index) DO NOTHING;\n\n-- 5. UPDATE multiple\nUPDATE courses\nSET level = ''INTERMEDIATE''\nWHERE level = ''BEGINNER'' AND order_index < 5;',
  'SQL Solutions:\n\n-- 1. INSERT\nINSERT INTO courses (title_fr, title_en, title_ar, level, order_index)\nVALUES (''New Course'', ''New Course'', ''كورس جديد'', ''BEGINNER'', 12);\n\n-- 2. UPDATE\nUPDATE courses\nSET title_fr = ''Modified Title''\nWHERE id = 1;\n\n-- 3. DELETE\nDELETE FROM courses\nWHERE id = 12;\n\n-- 4. INSERT multiple\nINSERT INTO lessons (course_id, title_fr, title_en, title_ar, order_index)\nVALUES\n  (1, ''Lesson 1'', ''Lesson 1'', ''الدرس 1'', 1),\n  (1, ''Lesson 2'', ''Lesson 2'', ''الدرس 2'', 2); ON CONFLICT (course_id, order_index) DO NOTHING;\n\n-- 5. UPDATE multiple\nUPDATE courses\nSET level = ''INTERMEDIATE''\nWHERE level = ''BEGINNER'' AND order_index < 5;',
  'حلول SQL:\n\n-- 1. INSERT\nINSERT INTO courses (title_fr, title_en, title_ar, level, order_index)\nVALUES (''كورس جديد'', ''New Course'', ''كورس جديد'', ''BEGINNER'', 12);\n\n-- 2. UPDATE\nUPDATE courses\nSET title_fr = ''عنوان معدل''\nWHERE id = 1;\n\n-- 3. DELETE\nDELETE FROM courses\nWHERE id = 12;\n\n-- 4. INSERT multiple\nINSERT INTO lessons (course_id, title_fr, title_en, title_ar, order_index)\nVALUES\n  (1, ''الدرس 1'', ''Lesson 1'', ''الدرس 1'', 1),\n  (1, ''الدرس 2'', ''Lesson 2'', ''الدرس 2'', 2); ON CONFLICT (course_id, order_index) DO NOTHING;\n\n-- 5. UPDATE multiple\nUPDATE courses\nSET level = ''INTERMEDIATE''\nWHERE level = ''BEGINNER'' AND order_index < 5;',
  'CODING', 4, 3, NOW(), NOW()
);

-- QCM pour leçon 5.4 (5 questions)
INSERT INTO quiz_questions (exercise_id, question_fr, question_en, question_ar,
                           correct_answer_index, explanation_fr, explanation_en, explanation_ar)
VALUES 
(
  (SELECT id FROM exercises WHERE course_id = 5 AND lesson_id = (SELECT id FROM lessons WHERE course_id = 5 AND order_index = 4) AND order_index = 4),
  'Quelle est la syntaxe correcte pour INSERT ?',
  'What is the correct syntax for INSERT?',
  'ما هي الصيغة الصحيحة لـ INSERT؟',
  1,
  'INSERT INTO table_name (colonne1, colonne2) VALUES (valeur1, valeur2). Vous devez spécifier les colonnes et les valeurs correspondantes.',
  'INSERT INTO table_name (column1, column2) VALUES (value1, value2). You must specify columns and corresponding values.',
  'INSERT INTO table_name (colonne1, colonne2) VALUES (valeur1, valeur2). يجب تحديد الأعمدة والقيم المقابلة.'
),
(
  (SELECT id FROM exercises WHERE course_id = 5 AND lesson_id = (SELECT id FROM lessons WHERE course_id = 5 AND order_index = 4) AND order_index = 4),
  'Comment mettre à jour plusieurs colonnes en une seule requête UPDATE ?',
  'How to update multiple columns in a single UPDATE query?',
  'كيف تحدث عدة أعمدة في استعلام UPDATE واحد؟',
  2,
  'Utilisez plusieurs SET séparés par des virgules : UPDATE table SET colonne1 = valeur1, colonne2 = valeur2 WHERE condition.',
  'Use multiple SET separated by commas: UPDATE table SET column1 = value1, column2 = value2 WHERE condition.',
  'استخدم عدة SET مفصولة بفواصل: UPDATE table SET colonne1 = valeur1, colonne2 = valeur2 WHERE condition.'
),
(
  (SELECT id FROM exercises WHERE course_id = 5 AND lesson_id = (SELECT id FROM lessons WHERE course_id = 5 AND order_index = 4) AND order_index = 4),
  'Pourquoi est-il important d''utiliser WHERE dans UPDATE et DELETE ?',
  'Why is it important to use WHERE in UPDATE and DELETE?',
  'لماذا من المهم استخدام WHERE في UPDATE و DELETE؟',
  0,
  'Sans WHERE, UPDATE modifie TOUTES les lignes et DELETE supprime TOUTES les lignes. C''est très dangereux ! WHERE permet de cibler uniquement les lignes souhaitées.',
  'Without WHERE, UPDATE modifies ALL rows and DELETE removes ALL rows. This is very dangerous! WHERE allows targeting only desired rows.',
  'بدون WHERE، UPDATE يعدل جميع الصفوف و DELETE يحذف جميع الصفوف. هذا خطير جدًا! WHERE يسمح باستهداف الصفوف المطلوبة فقط.'
),
(
  (SELECT id FROM exercises WHERE course_id = 5 AND lesson_id = (SELECT id FROM lessons WHERE course_id = 5 AND order_index = 4) AND order_index = 4),
  'Comment insérer plusieurs lignes en une seule requête INSERT ?',
  'How to insert multiple rows in a single INSERT query?',
  'كيف تدخل عدة صفوف في استعلام INSERT واحد؟',
  3,
  'Utilisez plusieurs groupes de valeurs séparés par des virgules : INSERT INTO table VALUES (val1, val2), (val3, val4), (val5, val6).',
  'Use multiple value groups separated by commas: INSERT INTO table VALUES (val1, val2), (val3, val4), (val5, val6).',
  'استخدم عدة مجموعات قيم مفصولة بفواصل: INSERT INTO table VALUES (val1, val2), (val3, val4), (val5, val6).'
),
(
  (SELECT id FROM exercises WHERE course_id = 5 AND lesson_id = (SELECT id FROM lessons WHERE course_id = 5 AND order_index = 4) AND order_index = 4),
  'Que fait la clause RETURNING dans PostgreSQL ?',
  'What does the RETURNING clause do in PostgreSQL?',
  'ماذا تفعل بند RETURNING في PostgreSQL؟',
  1,
  'RETURNING retourne les lignes affectées par INSERT, UPDATE ou DELETE. Très utile pour obtenir les IDs générés automatiquement ou vérifier les modifications.',
  'RETURNING returns rows affected by INSERT, UPDATE or DELETE. Very useful to get auto-generated IDs or verify modifications.',
  'RETURNING ترجع الصفوف المتأثرة بـ INSERT أو UPDATE أو DELETE. مفيد جدًا للحصول على IDs المولدة تلقائيًا أو التحقق من التعديلات.'
);

-- Leçon 5.5: Index et optimisation
INSERT INTO lessons (course_id, title_fr, title_en, title_ar, content_fr, content_en, content_ar,
                     key_points_fr, key_points_en, key_points_ar,
                     analogies_fr, analogies_en, analogies_ar,
                     examples_fr, examples_en, examples_ar,
                     order_index, estimated_duration, created_at, updated_at)
VALUES (
  5,
  'Index et optimisation : Améliorer les performances',
  'Indexes and Optimization: Improving Performance',
  'الفهارس والتحسين: تحسين الأداء',
  'Un index est comme un index de livre : au lieu de parcourir toutes les pages pour trouver un mot, vous consultez l''index qui vous indique directement la page. Les index accélèrent les recherches dans la base de données, mais ralentissent légèrement les INSERT/UPDATE car ils doivent être maintenus.',
  'An index is like a book index: instead of browsing all pages to find a word, you consult the index which directly tells you the page. Indexes speed up searches in the database, but slightly slow down INSERT/UPDATE because they must be maintained.',
  'الفهرس مثل فهرس كتاب: بدلاً من تصفح جميع الصفحات للعثور على كلمة، تستشير الفهرس الذي يخبرك مباشرة بالصفحة. الفهارس تسرع البحث في قاعدة البيانات، لكنها تبطئ قليلاً INSERT/UPDATE لأنها يجب أن تُحافظ عليها.',
  '1. Index = structure pour accélérer les recherches\n2. CREATE INDEX = créer un index\n3. Index unique = empêche les doublons\n4. Index composite = sur plusieurs colonnes\n5. EXPLAIN = analyser les performances\n6. Index automatique sur PRIMARY KEY\n7. Trop d''index = ralentit les écritures',
  '1. Index = structure to speed up searches\n2. CREATE INDEX = create an index\n3. Unique index = prevents duplicates\n4. Composite index = on multiple columns\n5. EXPLAIN = analyze performance\n6. Automatic index on PRIMARY KEY\n7. Too many indexes = slows down writes',
  '1. الفهرس = هيكل لتسريع البحث\n2. CREATE INDEX = إنشاء فهرس\n3. فهرس فريد = يمنع التكرارات\n4. فهرس مركب = على عدة أعمدة\n5. EXPLAIN = تحليل الأداء\n6. فهرس تلقائي على PRIMARY KEY\n7. فهارس كثيرة = تبطئ الكتابة',
  5, 30, NOW(), NOW()
); ON CONFLICT (course_id, order_index) DO NOTHING;

-- Exercice 5.5
INSERT INTO exercises (course_id, lesson_id, title_fr, title_en, title_ar,
                      description_fr, description_en, description_ar,
                      solution_fr, solution_en, solution_ar,
                      type, order_index, difficulty, created_at, updated_at)
VALUES (
  5, (SELECT id FROM lessons WHERE course_id = 5 AND order_index = 5),
  'Exercice : Créer et utiliser des index',
  'Exercise: Create and Use Indexes',
  'تمرين: إنشاء واستخدام الفهارس',
  'Créez des index pour optimiser les requêtes :\n1. Créez un index sur la colonne course_id de la table lessons\n2. Créez un index unique sur email dans une table users\n3. Créez un index composite sur (course_id, order_index)\n4. Utilisez EXPLAIN pour analyser une requête\n5. Supprimez un index',
  'Create indexes to optimize queries:\n1. Create an index on course_id column of lessons table\n2. Create a unique index on email in a users table\n3. Create a composite index on (course_id, order_index)\n4. Use EXPLAIN to analyze a query\n5. Drop an index',
  'أنشئ فهارس لتحسين الاستعلامات:\n1. أنشئ فهرسًا على عمود course_id في جدول lessons\n2. أنشئ فهرسًا فريدًا على email في جدول users\n3. أنشئ فهرسًا مركبًا على (course_id, order_index)\n4. استخدم EXPLAIN لتحليل استعلام\n5. احذف فهرسًا',
  'Solutions SQL :\n\n-- 1. Index simple\nCREATE INDEX idx_lessons_course_id ON lessons(course_id);\n\n-- 2. Index unique\nCREATE UNIQUE INDEX idx_users_email ON users(email);\n\n-- 3. Index composite\nCREATE INDEX idx_lessons_course_order ON lessons(course_id, order_index);\n\n-- 4. EXPLAIN\nEXPLAIN SELECT * FROM lessons WHERE course_id = 1;\n\n-- 5. Supprimer index\nDROP INDEX idx_lessons_course_id;',
  'SQL Solutions:\n\n-- 1. Simple index\nCREATE INDEX idx_lessons_course_id ON lessons(course_id);\n\n-- 2. Unique index\nCREATE UNIQUE INDEX idx_users_email ON users(email);\n\n-- 3. Composite index\nCREATE INDEX idx_lessons_course_order ON lessons(course_id, order_index);\n\n-- 4. EXPLAIN\nEXPLAIN SELECT * FROM lessons WHERE course_id = 1;\n\n-- 5. Drop index\nDROP INDEX idx_lessons_course_id;',
  'حلول SQL:\n\n-- 1. فهرس بسيط\nCREATE INDEX idx_lessons_course_id ON lessons(course_id);\n\n-- 2. فهرس فريد\nCREATE UNIQUE INDEX idx_users_email ON users(email);\n\n-- 3. فهرس مركب\nCREATE INDEX idx_lessons_course_order ON lessons(course_id, order_index);\n\n-- 4. EXPLAIN\nEXPLAIN SELECT * FROM lessons WHERE course_id = 1;\n\n-- 5. حذف فهرس\nDROP INDEX idx_lessons_course_id;',
  'CODING', 5, 3, NOW(), NOW()
);

-- QCM pour leçon 5.5 (4 questions)
INSERT INTO quiz_questions (exercise_id, question_fr, question_en, question_ar,
                           correct_answer_index, explanation_fr, explanation_en, explanation_ar)
VALUES 
(
  (SELECT id FROM exercises WHERE course_id = 5 AND lesson_id = (SELECT id FROM lessons WHERE course_id = 5 AND order_index = 5) AND order_index = 5),
  'Qu''est-ce qu''un index en base de données ?',
  'What is an index in a database?',
  'ما هو الفهرس في قاعدة البيانات؟',
  1,
  'Un index est une structure de données qui accélère les recherches en créant une "table des matières" pour les colonnes indexées. Il permet de trouver rapidement les lignes sans parcourir toute la table.',
  'An index is a data structure that speeds up searches by creating a "table of contents" for indexed columns. It allows quickly finding rows without scanning the entire table.',
  'الفهرس هو هيكل بيانات يسرع البحث بإنشاء "جدول محتويات" للأعمدة المفهرسة. يسمح بالعثور بسرعة على الصفوف دون فحص الجدول بالكامل.'
),
(
  (SELECT id FROM exercises WHERE course_id = 5 AND lesson_id = (SELECT id FROM lessons WHERE course_id = 5 AND order_index = 5) AND order_index = 5),
  'Quelle est la différence entre un index normal et un index unique ?',
  'What is the difference between a normal index and a unique index?',
  'ما الفرق بين فهرس عادي وفهرس فريد؟',
  2,
  'Un index normal accélère les recherches mais permet les doublons. Un index unique accélère les recherches ET empêche les valeurs dupliquées dans la colonne indexée.',
  'A normal index speeds up searches but allows duplicates. A unique index speeds up searches AND prevents duplicate values in the indexed column.',
  'الفهرس العادي يسرع البحث لكن يسمح بالتكرارات. الفهرس الفريد يسرع البحث ويمنع القيم المكررة في العمود المفهرس.'
),
(
  (SELECT id FROM exercises WHERE course_id = 5 AND lesson_id = (SELECT id FROM lessons WHERE course_id = 5 AND order_index = 5) AND order_index = 5),
  'Qu''est-ce qu''un index composite ?',
  'What is a composite index?',
  'ما هو الفهرس المركب؟',
  0,
  'Un index composite est un index créé sur plusieurs colonnes. Il est utile pour les requêtes qui filtrent sur plusieurs colonnes. L''ordre des colonnes dans l''index est important.',
  'A composite index is an index created on multiple columns. It is useful for queries that filter on multiple columns. The order of columns in the index is important.',
  'الفهرس المركب هو فهرس يُنشأ على عدة أعمدة. مفيد للاستعلامات التي تصفّي على عدة أعمدة. ترتيب الأعمدة في الفهرس مهم.'
),
(
  (SELECT id FROM exercises WHERE course_id = 5 AND lesson_id = (SELECT id FROM lessons WHERE course_id = 5 AND order_index = 5) AND order_index = 5),
  'Pourquoi ne faut-il pas créer trop d''index ?',
  'Why should you not create too many indexes?',
  'لماذا لا يجب إنشاء فهارس كثيرة؟',
  3,
  'Trop d''index ralentit les opérations INSERT, UPDATE et DELETE car chaque index doit être mis à jour. Les index occupent aussi de l''espace disque. Il faut trouver un équilibre.',
  'Too many indexes slow down INSERT, UPDATE and DELETE operations because each index must be updated. Indexes also take up disk space. You need to find a balance.',
  'الفهارس الكثيرة تبطئ عمليات INSERT و UPDATE و DELETE لأن كل فهرس يجب تحديثه. الفهارس تأخذ أيضًا مساحة القرص. يجب إيجاد توازن.'
);

-- ============================================
-- COURS 6: Docker - Leçons manquantes
-- ============================================

-- Leçon 6.4: Bonnes pratiques Docker
INSERT INTO lessons (course_id, title_fr, title_en, title_ar, content_fr, content_en, content_ar,
                     key_points_fr, key_points_en, key_points_ar,
                     analogies_fr, analogies_en, analogies_ar,
                     examples_fr, examples_en, examples_ar,
                     order_index, estimated_duration, created_at, updated_at)
VALUES (
  6,
  'Bonnes pratiques Docker : Optimiser vos conteneurs',
  'Docker Best Practices: Optimize Your Containers',
  'أفضل ممارسات Docker: تحسين حاوياتك',
  'Les bonnes pratiques Docker sont comme les règles de conduite : elles rendent vos conteneurs plus sûrs, plus rapides et plus faciles à maintenir. Utilisez des images légères, évitez les privilèges root, utilisez des .dockerignore, et organisez vos Dockerfiles en couches pour optimiser le cache.',
  'Docker best practices are like driving rules: they make your containers safer, faster and easier to maintain. Use light images, avoid root privileges, use .dockerignore, and organize your Dockerfiles in layers to optimize cache.',
  'أفضل ممارسات Docker مثل قواعد القيادة: تجعل حاوياتك أكثر أمانًا وسرعة وسهولة في الصيانة. استخدم صورًا خفيفة، تجنب صلاحيات root، استخدم .dockerignore، ونظم Dockerfiles في طبقات لتحسين الذاكرة المؤقتة.',
  '1. Utiliser des images de base légères (alpine)\n2. Éviter les privilèges root (USER non-root)\n3. Utiliser .dockerignore pour exclure des fichiers\n4. Organiser les couches pour optimiser le cache\n5. Une seule responsabilité par conteneur\n6. Utiliser des tags spécifiques (pas latest)\n7. Limiter les ressources (CPU, mémoire)',
  '1. Use light base images (alpine)\n2. Avoid root privileges (USER non-root)\n3. Use .dockerignore to exclude files\n4. Organize layers to optimize cache\n5. Single responsibility per container\n6. Use specific tags (not latest)\n7. Limit resources (CPU, memory)',
  '1. استخدم صورًا أساسية خفيفة (alpine)\n2. تجنب صلاحيات root (USER non-root)\n3. استخدم .dockerignore لاستبعاد الملفات\n4. نظم الطبقات لتحسين الذاكرة المؤقتة\n5. مسؤولية واحدة لكل حاوية\n6. استخدم علامات محددة (ليس latest)\n7. حدد الموارد (CPU، الذاكرة)',
  4, 35, NOW(), NOW()
); ON CONFLICT (course_id, order_index) DO NOTHING;

-- Exercice 6.4
INSERT INTO exercises (course_id, lesson_id, title_fr, title_en, title_ar,
                      description_fr, description_en, description_ar,
                      solution_fr, solution_en, solution_ar,
                      type, order_index, difficulty, created_at, updated_at)
VALUES (
  6, (SELECT id FROM lessons WHERE course_id = 6 AND order_index = 4),
  'Exercice : Optimiser un Dockerfile',
  'Exercise: Optimize a Dockerfile',
  'تمرين: تحسين Dockerfile',
  'Optimisez le Dockerfile suivant :\n1. Utilisez une image alpine plus légère\n2. Créez un utilisateur non-root\n3. Ajoutez un .dockerignore\n4. Organisez les couches pour le cache\n5. Limitez les ressources du conteneur',
  'Optimize the following Dockerfile:\n1. Use a lighter alpine image\n2. Create a non-root user\n3. Add a .dockerignore\n4. Organize layers for cache\n5. Limit container resources',
  'حسّن Dockerfile التالي:\n1. استخدم صورة alpine أخف\n2. أنشئ مستخدمًا غير root\n3. أضف .dockerignore\n4. نظم الطبقات للذاكرة المؤقتة\n5. حدد موارد الحاوية',
  'Solution optimisée :\n\n# Dockerfile optimisé\nFROM openjdk:17-jre-alpine\n\n# Créer utilisateur non-root\nRUN addgroup -S appgroup && adduser -S appuser -G appgroup\n\n# Définir répertoire de travail\nWORKDIR /app\n\n# Copier uniquement le JAR (couche séparée pour cache)\nCOPY --chown=appuser:appgroup target/*.jar app.jar\n\n# Changer vers utilisateur non-root\nUSER appuser\n\n# Exposer le port\nEXPOSE 8080\n\n# Commande\nCMD ["java", "-jar", "app.jar"]\n\n# .dockerignore\nnode_modules/\n.git/\n*.md\n.DS_Store\n\n# Limiter ressources dans docker-compose.yml\nservices:\n  app:\n    deploy:\n      resources:\n        limits:\n          cpus: ''1.0''\n          memory: 512M',
  'Optimized solution:\n\n# Optimized Dockerfile\nFROM openjdk:17-jre-alpine\n\n# Create non-root user\nRUN addgroup -S appgroup && adduser -S appuser -G appgroup\n\n# Set working directory\nWORKDIR /app\n\n# Copy only JAR (separate layer for cache)\nCOPY --chown=appuser:appgroup target/*.jar app.jar\n\n# Switch to non-root user\nUSER appuser\n\n# Expose port\nEXPOSE 8080\n\n# Command\nCMD ["java", "-jar", "app.jar"]\n\n# .dockerignore\nnode_modules/\n.git/\n*.md\n.DS_Store\n\n# Limit resources in docker-compose.yml\nservices:\n  app:\n    deploy:\n      resources:\n        limits:\n          cpus: ''1.0''\n          memory: 512M',
  'الحل المحسّن:\n\n# Dockerfile محسّن\nFROM openjdk:17-jre-alpine\n\n# إنشاء مستخدم غير root\nRUN addgroup -S appgroup && adduser -S appuser -G appgroup\n\n# تعيين مجلد العمل\nWORKDIR /app\n\n# نسخ JAR فقط (طبقة منفصلة للذاكرة المؤقتة)\nCOPY --chown=appuser:appgroup target/*.jar app.jar\n\n# التبديل إلى مستخدم غير root\nUSER appuser\n\n# عرض المنفذ\nEXPOSE 8080\n\n# الأمر\nCMD ["java", "-jar", "app.jar"]\n\n# .dockerignore\nnode_modules/\n.git/\n*.md\n.DS_Store\n\n# تحديد الموارد في docker-compose.yml\nservices:\n  app:\n    deploy:\n      resources:\n        limits:\n          cpus: ''1.0''\n          memory: 512M',
  'CODING', 4, 4, NOW(), NOW()
);

-- QCM pour leçon 6.4 (5 questions)
INSERT INTO quiz_questions (exercise_id, question_fr, question_en, question_ar,
                           correct_answer_index, explanation_fr, explanation_en, explanation_ar)
VALUES 
(
  (SELECT id FROM exercises WHERE course_id = 6 AND lesson_id = (SELECT id FROM lessons WHERE course_id = 6 AND order_index = 4) AND order_index = 4),
  'Pourquoi utiliser des images alpine ?',
  'Why use alpine images?',
  'لماذا نستخدم صور alpine؟',
  1,
  'Les images alpine sont beaucoup plus légères (5-10 MB vs 100+ MB) car elles utilisent musl libc au lieu de glibc. Cela réduit la taille des images et accélère les téléchargements et déploiements.',
  'Alpine images are much lighter (5-10 MB vs 100+ MB) because they use musl libc instead of glibc. This reduces image size and speeds up downloads and deployments.',
  'صور alpine أخف بكثير (5-10 MB مقابل 100+ MB) لأنها تستخدم musl libc بدلاً من glibc. هذا يقلل حجم الصور ويسرع التنزيلات والنشر.'
),
(
  (SELECT id FROM exercises WHERE course_id = 6 AND lesson_id = (SELECT id FROM lessons WHERE course_id = 6 AND order_index = 4) AND order_index = 4),
  'Pourquoi éviter d''exécuter les conteneurs en root ?',
  'Why avoid running containers as root?',
  'لماذا نتجنب تشغيل الحاويات كـ root؟',
  2,
  'Exécuter en root est un risque de sécurité majeur. Si le conteneur est compromis, l''attaquant a les privilèges root. Utilisez USER pour exécuter avec un utilisateur non-privilégié.',
  'Running as root is a major security risk. If the container is compromised, the attacker has root privileges. Use USER to run with a non-privileged user.',
  'التشغيل كـ root خطر أمني كبير. إذا تم اختراق الحاوية، المهاجم لديه صلاحيات root. استخدم USER للتشغيل مع مستخدم غير مميز.'
),
(
  (SELECT id FROM exercises WHERE course_id = 6 AND lesson_id = (SELECT id FROM lessons WHERE course_id = 6 AND order_index = 4) AND order_index = 4),
  'À quoi sert .dockerignore ?',
  'What is .dockerignore used for?',
  'ما فائدة .dockerignore؟',
  0,
  '.dockerignore exclut des fichiers du contexte de build, comme .gitignore pour Git. Cela réduit la taille du contexte envoyé à Docker et accélère les builds.',
  '.dockerignore excludes files from build context, like .gitignore for Git. This reduces the size of context sent to Docker and speeds up builds.',
  '.dockerignore يستبعد الملفات من سياق البناء، مثل .gitignore لـ Git. هذا يقلل حجم السياق المرسل إلى Docker ويسرع البناء.'
),
(
  (SELECT id FROM exercises WHERE course_id = 6 AND lesson_id = (SELECT id FROM lessons WHERE course_id = 6 AND order_index = 4) AND order_index = 4),
  'Pourquoi organiser les couches dans un Dockerfile ?',
  'Why organize layers in a Dockerfile?',
  'لماذا ننظم الطبقات في Dockerfile؟',
  3,
  'Docker met en cache chaque couche. Si une couche change, toutes les suivantes sont reconstruites. Organiser les couches (dépendances d''abord, code ensuite) optimise le cache et accélère les rebuilds.',
  'Docker caches each layer. If a layer changes, all following ones are rebuilt. Organizing layers (dependencies first, code next) optimizes cache and speeds up rebuilds.',
  'Docker يخزن مؤقتًا كل طبقة. إذا تغيرت طبقة، جميع التالية تُعاد بناؤها. تنظيم الطبقات (التبعيات أولاً، الكود بعد ذلك) يحسّن الذاكرة المؤقتة ويسرع إعادة البناء.'
),
(
  (SELECT id FROM exercises WHERE course_id = 6 AND lesson_id = (SELECT id FROM lessons WHERE course_id = 6 AND order_index = 4) AND order_index = 4),
  'Quelle est la règle "une seule responsabilité par conteneur" ?',
  'What is the "single responsibility per container" rule?',
  'ما هي قاعدة "مسؤولية واحدة لكل حاوية"؟',
  1,
  'Chaque conteneur doit faire une seule chose bien. Par exemple : un conteneur pour l''application, un pour la base de données, un pour le cache. Cela facilite le scaling, la maintenance et le debugging.',
  'Each container should do one thing well. For example: one container for the application, one for the database, one for the cache. This facilitates scaling, maintenance and debugging.',
  'كل حاوية يجب أن تفعل شيئًا واحدًا جيدًا. مثلاً: حاوية للتطبيق، حاوية لقاعدة البيانات، حاوية للذاكرة المؤقتة. هذا يسهل التوسع والصيانة والتشخيص.'
);

-- Leçon 6.5: Optimisation Docker
INSERT INTO lessons (course_id, title_fr, title_en, title_ar, content_fr, content_en, content_ar,
                     key_points_fr, key_points_en, key_points_ar,
                     analogies_fr, analogies_en, analogies_ar,
                     examples_fr, examples_en, examples_ar,
                     order_index, estimated_duration, created_at, updated_at)
VALUES (
  6,
  'Optimisation Docker : Réduire la taille et accélérer',
  'Docker Optimization: Reduce Size and Speed Up',
  'تحسين Docker: تقليل الحجم والتسريع',
  'L''optimisation Docker est comme optimiser une valise pour un voyage : vous voulez emporter l''essentiel (images légères), organiser efficacement (couches optimisées), et éviter les doublons (multi-stage builds). Cela réduit la taille des images, accélère les builds et les déploiements.',
  'Docker optimization is like optimizing a suitcase for a trip: you want to take the essentials (light images), organize efficiently (optimized layers), and avoid duplicates (multi-stage builds). This reduces image size, speeds up builds and deployments.',
  'تحسين Docker مثل تحسين حقيبة سفر: تريد أخذ الأساسيات (صور خفيفة)، التنظيم بكفاءة (طبقات محسّنة)، وتجنب التكرارات (بناء متعدد المراحل). هذا يقلل حجم الصور ويسرع البناء والنشر.',
  '1. Multi-stage builds = réduire la taille finale\n2. .dockerignore = exclure fichiers inutiles\n3. Combiner RUN = réduire le nombre de couches\n4. Utiliser des tags spécifiques\n5. Nettoyer le cache (docker system prune)\n6. Utiliser BuildKit pour builds parallèles\n7. Analyser avec docker history',
  '1. Multi-stage builds = reduce final size\n2. .dockerignore = exclude unnecessary files\n3. Combine RUN = reduce number of layers\n4. Use specific tags\n5. Clean cache (docker system prune)\n6. Use BuildKit for parallel builds\n7. Analyze with docker history',
  '1. بناء متعدد المراحل = تقليل الحجم النهائي\n2. .dockerignore = استبعاد ملفات غير ضرورية\n3. دمج RUN = تقليل عدد الطبقات\n4. استخدم علامات محددة\n5. تنظيف الذاكرة المؤقتة (docker system prune)\n6. استخدم BuildKit للبناء المتوازي\n7. حلل بـ docker history',
  5, 30, NOW(), NOW()
); ON CONFLICT (course_id, order_index) DO NOTHING;

-- Exercice 6.5
INSERT INTO exercises (course_id, lesson_id, title_fr, title_en, title_ar,
                      description_fr, description_en, description_ar,
                      solution_fr, solution_en, solution_ar,
                      type, order_index, difficulty, created_at, updated_at)
VALUES (
  6, (SELECT id FROM lessons WHERE course_id = 6 AND order_index = 5),
  'Exercice : Optimiser un Dockerfile avec multi-stage',
  'Exercise: Optimize Dockerfile with Multi-stage',
  'تمرين: تحسين Dockerfile ببناء متعدد المراحل',
  'Créez un Dockerfile optimisé avec multi-stage build pour une application Spring Boot :\n1. Stage 1 : Build avec Maven (image complète)\n2. Stage 2 : Runtime avec JRE seulement (image légère)\n3. Copiez uniquement le JAR final\n4. Comparez la taille avant/après',
  'Create an optimized Dockerfile with multi-stage build for a Spring Boot application:\n1. Stage 1: Build with Maven (full image)\n2. Stage 2: Runtime with JRE only (light image)\n3. Copy only final JAR\n4. Compare size before/after',
  'أنشئ Dockerfile محسّنًا ببناء متعدد المراحل لتطبيق Spring Boot:\n1. المرحلة 1: بناء مع Maven (صورة كاملة)\n2. المرحلة 2: وقت التشغيل مع JRE فقط (صورة خفيفة)\n3. انسخ JAR النهائي فقط\n4. قارن الحجم قبل/بعد',
  'Solution :\n\n# Dockerfile optimisé multi-stage\n# Stage 1: Build\nFROM maven:3.8-openjdk-17 AS build\nWORKDIR /app\nCOPY pom.xml .\nRUN mvn dependency:go-offline\nCOPY src ./src\nRUN mvn clean package -DskipTests\n\n# Stage 2: Runtime\nFROM openjdk:17-jre-alpine\nWORKDIR /app\nCOPY --from=build /app/target/*.jar app.jar\nEXPOSE 8080\nCMD ["java", "-jar", "app.jar"]\n\n# Comparer les tailles :\n# docker images\n# docker history <image_name>',
  'Solution:\n\n# Optimized multi-stage Dockerfile\n# Stage 1: Build\nFROM maven:3.8-openjdk-17 AS build\nWORKDIR /app\nCOPY pom.xml .\nRUN mvn dependency:go-offline\nCOPY src ./src\nRUN mvn clean package -DskipTests\n\n# Stage 2: Runtime\nFROM openjdk:17-jre-alpine\nWORKDIR /app\nCOPY --from=build /app/target/*.jar app.jar\nEXPOSE 8080\nCMD ["java", "-jar", "app.jar"]\n\n# Compare sizes:\n# docker images\n# docker history <image_name>',
  'الحل:\n\n# Dockerfile محسّن متعدد المراحل\n# المرحلة 1: البناء\nFROM maven:3.8-openjdk-17 AS build\nWORKDIR /app\nCOPY pom.xml .\nRUN mvn dependency:go-offline\nCOPY src ./src\nRUN mvn clean package -DskipTests\n\n# المرحلة 2: وقت التشغيل\nFROM openjdk:17-jre-alpine\nWORKDIR /app\nCOPY --from=build /app/target/*.jar app.jar\nEXPOSE 8080\nCMD ["java", "-jar", "app.jar"]\n\n# مقارنة الأحجام:\n# docker images\n# docker history <image_name>',
  'CODING', 5, 4, NOW(), NOW()
);

-- QCM pour leçon 6.5 (4 questions)
INSERT INTO quiz_questions (exercise_id, question_fr, question_en, question_ar,
                           correct_answer_index, explanation_fr, explanation_en, explanation_ar)
VALUES 
(
  (SELECT id FROM exercises WHERE course_id = 6 AND lesson_id = (SELECT id FROM lessons WHERE course_id = 6 AND order_index = 5) AND order_index = 5),
  'Qu''est-ce qu''un build multi-stage dans Docker ?',
  'What is a multi-stage build in Docker?',
  'ما هو البناء متعدد المراحل في Docker؟',
  1,
  'Un build multi-stage utilise plusieurs images FROM dans un Dockerfile. La première image (build) contient les outils de compilation, la dernière (runtime) contient seulement ce qui est nécessaire pour exécuter. Cela réduit drastiquement la taille finale.',
  'A multi-stage build uses multiple FROM images in a Dockerfile. The first image (build) contains compilation tools, the last (runtime) contains only what is needed to run. This drastically reduces final size.',
  'البناء متعدد المراحل يستخدم عدة صور FROM في Dockerfile. الصورة الأولى (build) تحتوي على أدوات التجميع، الأخيرة (runtime) تحتوي فقط على ما هو ضروري للتشغيل. هذا يقلل الحجم النهائي بشكل كبير.'
),
(
  (SELECT id FROM exercises WHERE course_id = 6 AND lesson_id = (SELECT id FROM lessons WHERE course_id = 6 AND order_index = 5) AND order_index = 5),
  'Comment combiner plusieurs commandes RUN ?',
  'How to combine multiple RUN commands?',
  'كيف ندمج عدة أوامر RUN؟',
  2,
  'Utilisez && pour combiner : RUN command1 && command2 && command3. Cela crée une seule couche au lieu de plusieurs, réduisant la taille de l''image.',
  'Use && to combine: RUN command1 && command2 && command3. This creates a single layer instead of multiple, reducing image size.',
  'استخدم && للدمج: RUN command1 && command2 && command3. هذا ينشئ طبقة واحدة بدلاً من عدة طبقات، مما يقلل حجم الصورة.'
),
(
  (SELECT id FROM exercises WHERE course_id = 6 AND lesson_id = (SELECT id FROM lessons WHERE course_id = 6 AND order_index = 5) AND order_index = 5),
  'Quelle commande permet d''analyser la taille des couches d''une image ?',
  'Which command allows analyzing the size of image layers?',
  'أي أمر يسمح بتحليل حجم طبقات الصورة؟',
  0,
  'docker history <image_name> affiche toutes les couches d''une image avec leur taille. Très utile pour identifier les couches qui prennent le plus d''espace.',
  'docker history <image_name> displays all layers of an image with their size. Very useful to identify layers that take the most space.',
  'docker history <image_name> يعرض جميع طبقات الصورة مع حجمها. مفيد جدًا لتحديد الطبقات التي تأخذ أكبر مساحة.'
),
(
  (SELECT id FROM exercises WHERE course_id = 6 AND lesson_id = (SELECT id FROM lessons WHERE course_id = 6 AND order_index = 5) AND order_index = 5),
  'Pourquoi utiliser BuildKit ?',
  'Why use BuildKit?',
  'لماذا نستخدم BuildKit؟',
  3,
  'BuildKit est un moteur de build amélioré qui permet des builds parallèles, un meilleur cache, et des builds plus rapides. Activez-le avec DOCKER_BUILDKIT=1 ou docker buildx.',
  'BuildKit is an improved build engine that enables parallel builds, better cache, and faster builds. Enable it with DOCKER_BUILDKIT=1 or docker buildx.',
  'BuildKit هو محرك بناء محسّن يمكّن من البناء المتوازي، ذاكرة مؤقتة أفضل، وبناء أسرع. فعّله بـ DOCKER_BUILDKIT=1 أو docker buildx.'
);
