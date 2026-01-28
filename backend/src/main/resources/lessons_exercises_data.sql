-- Leçons, Exercices et QCM pour la plateforme
-- Ce fichier doit être exécuté après data.sql

-- Créer une contrainte unique sur (course_id, order_index) pour les leçons si elle n'existe pas
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_constraint 
        WHERE conname = 'lessons_course_order_unique'
    ) THEN
        ALTER TABLE lessons ADD CONSTRAINT lessons_course_order_unique UNIQUE (course_id, order_index);
    END IF;
END $$;

-- ============================================
-- COURS 1: Fondamentaux du développement
-- ============================================

-- Leçon 1.1: Introduction à la logique de programmation
INSERT INTO lessons (course_id, title_fr, title_en, title_ar, content_fr, content_en, content_ar, 
                     key_points_fr, key_points_en, key_points_ar,
                     analogies_fr, analogies_en, analogies_ar,
                     examples_fr, examples_en, examples_ar,
                     order_index, estimated_duration, created_at, updated_at)
VALUES (
  1,
  'Introduction à la logique de programmation',
  'Introduction to Programming Logic',
  'مقدمة في منطق البرمجة',
  'La programmation, c''est comme donner des instructions précises à un ordinateur. Imaginez que vous donnez une recette de cuisine : chaque étape doit être claire, dans le bon ordre, et sans ambiguïté. Un programme est une série d''instructions que l''ordinateur exécute une par une, exactement comme vous suivez une recette étape par étape.',
  'Programming is like giving precise instructions to a computer. Imagine you are giving a cooking recipe: each step must be clear, in the right order, and unambiguous. A program is a series of instructions that the computer executes one by one, exactly as you follow a recipe step by step.',
  'البرمجة هي مثل إعطاء تعليمات دقيقة لجهاز كمبيوتر. تخيل أنك تعطي وصفة طبخ: كل خطوة يجب أن تكون واضحة، بالترتيب الصحيح، وبدون غموض. البرنامج هو سلسلة من التعليمات التي ينفذها الكمبيوتر واحدة تلو الأخرى، تمامًا كما تتبع وصفة خطوة بخطوة.',
  '1. Un programme = une série d''instructions\n2. L''ordinateur exécute les instructions dans l''ordre\n3. Chaque instruction doit être précise et sans ambiguïté\n4. La logique = penser étape par étape\n5. Les erreurs viennent souvent d''instructions mal formulées',
  '1. A program = a series of instructions\n2. The computer executes instructions in order\n3. Each instruction must be precise and unambiguous\n4. Logic = thinking step by step\n5. Errors often come from poorly formulated instructions',
  '1. البرنامج = سلسلة من التعليمات\n2. الكمبيوتر ينفذ التعليمات بالترتيب\n3. كل تعليمة يجب أن تكون دقيقة وواضحة\n4. المنطق = التفكير خطوة بخطوة\n5. الأخطاء غالبًا تأتي من تعليمات غير واضحة',
  'Pensez à une recette de cuisine : "Mélangez les œufs" est vague, mais "Cassez 3 œufs dans un bol et battez-les avec une fourchette pendant 30 secondes" est précis. En programmation, c''est pareil : il faut être très précis.',
  'Think of a cooking recipe: "Mix the eggs" is vague, but "Break 3 eggs into a bowl and beat them with a fork for 30 seconds" is precise. In programming, it''s the same: you need to be very precise.',
  'فكر في وصفة طبخ: "اخلط البيض" غامض، لكن "اكسر 3 بيضات في وعاء واخفقها بشوكة لمدة 30 ثانية" دقيق. في البرمجة، الأمر نفسه: يجب أن تكون دقيقًا جدًا.',
  'Exemple : Instructions pour traverser une rue\n1. Regardez à gauche\n2. Regardez à droite\n3. Si aucune voiture n''arrive, traversez\n4. Sinon, attendez\n\nEn programmation, cela devient :\nif (aucune_voiture) {\n    traverser(); ON CONFLICT (course_id, order_index) DO NOTHING;\n} else {\n    attendre();\n}',
  'Example: Instructions to cross a street\n1. Look left\n2. Look right\n3. If no car is coming, cross\n4. Otherwise, wait\n\nIn programming, this becomes:\nif (no_car) {\n    cross();\n} else {\n    wait();\n}',
  'مثال: تعليمات لعبور الشارع\n1. انظر يسارًا\n2. انظر يمينًا\n3. إذا لم تكن هناك سيارة، اعبر\n4. وإلا انتظر\n\nفي البرمجة، يصبح:\nif (لا_سيارة) {\n    اعبر();\n} else {\n    انتظر();\n}',
  1, 30, NOW(), NOW()
)
ON CONFLICT (course_id, order_index) DO NOTHING;

-- Exercice 1.1: Logique de base
INSERT INTO exercises (course_id, lesson_id, title_fr, title_en, title_ar,
                      description_fr, description_en, description_ar,
                      solution_fr, solution_en, solution_ar,
                      type, order_index, difficulty, created_at, updated_at)
VALUES (
  1, 1,
  'Exercice : Instructions pour faire un café',
  'Exercise: Instructions to Make Coffee',
  'تمرين: تعليمات لصنع القهوة',
  'Écrivez les instructions étape par étape pour faire un café, comme si vous expliquiez à un robot qui ne connaît rien. Soyez très précis : quelles actions ? Dans quel ordre ? Quelles conditions (si l''eau est chaude, etc.) ?',
  'Write step-by-step instructions to make coffee, as if you were explaining to a robot that knows nothing. Be very precise: what actions? In what order? What conditions (if water is hot, etc.)?',
  'اكتب التعليمات خطوة بخطوة لصنع القهوة، كما لو كنت تشرح لروبوت لا يعرف شيئًا. كن دقيقًا جدًا: ما هي الإجراءات؟ بأي ترتيب؟ ما هي الشروط (إذا كانت الماء ساخنة، إلخ)؟',
  'Solution :\n1. Prendre une tasse\n2. Mettre une cuillère de café dans la tasse\n3. Si l''eau n''est pas chaude, allumer la bouilloire et attendre\n4. Verser l''eau chaude dans la tasse\n5. Mélanger avec une cuillère\n6. Le café est prêt',
  'Solution:\n1. Take a cup\n2. Put a spoonful of coffee in the cup\n3. If water is not hot, turn on the kettle and wait\n4. Pour hot water into the cup\n5. Stir with a spoon\n6. Coffee is ready',
  'الحل:\n1. خذ كوبًا\n2. ضع ملعقة من القهوة في الكوب\n3. إذا لم تكن الماء ساخنة، شغّل الغلاية وانتظر\n4. صب الماء الساخن في الكوب\n5. حرّك بملعقة\n6. القهوة جاهزة',
  'THEORETICAL', 1, 2, NOW(), NOW()
);

-- QCM pour l'exercice 1.1
INSERT INTO quiz_questions (exercise_id, question_fr, question_en, question_ar,
                           correct_answer_index, explanation_fr, explanation_en, explanation_ar)
VALUES (
  (SELECT id FROM exercises WHERE lesson_id = 1 AND order_index = 1),
  'Pourquoi est-il important d''être précis dans les instructions ?',
  'Why is it important to be precise in instructions?',
  'لماذا من المهم أن تكون دقيقًا في التعليمات؟',
  0,
  'L''ordinateur ne peut pas deviner ce que vous voulez dire. Il exécute exactement ce que vous écrivez, donc chaque instruction doit être claire et sans ambiguïté.',
  'The computer cannot guess what you mean. It executes exactly what you write, so each instruction must be clear and unambiguous.',
  'الكمبيوتر لا يستطيع تخمين ما تقصده. ينفذ بالضبط ما تكتبه، لذلك يجب أن تكون كل تعليمة واضحة وبدون غموض.'
);

-- Ajouter les options pour le QCM
-- Note: Les options sont stockées dans des tables séparées (quiz_options), mais pour simplifier, on peut les inclure dans la question
-- Pour une implémentation complète, il faudrait créer les tables quiz_options_fr, quiz_options_en, quiz_options_ar

-- Leçon 1.2: Variables et types de données
INSERT INTO lessons (course_id, title_fr, title_en, title_ar, content_fr, content_en, content_ar,
                     key_points_fr, key_points_en, key_points_ar,
                     analogies_fr, analogies_en, analogies_ar,
                     examples_fr, examples_en, examples_ar,
                     order_index, estimated_duration, created_at, updated_at)
VALUES (
  1,
  'Variables et types de données',
  'Variables and Data Types',
  'المتغيرات وأنواع البيانات',
  'Une variable, c''est comme une boîte avec une étiquette. Vous mettez quelque chose dedans (un nombre, un texte, etc.) et vous pouvez le récupérer plus tard en utilisant le nom de la boîte. Les types de données définissent ce que vous pouvez mettre dans chaque boîte : des nombres entiers, des nombres décimaux, du texte, etc.',
  'A variable is like a box with a label. You put something in it (a number, text, etc.) and you can retrieve it later using the box name. Data types define what you can put in each box: whole numbers, decimal numbers, text, etc.',
  'المتغير هو مثل صندوق مع ملصق. تضع شيئًا فيه (رقم، نص، إلخ) ويمكنك استرجاعه لاحقًا باستخدام اسم الصندوق. أنواع البيانات تحدد ما يمكنك وضعه في كل صندوق: أرقام صحيحة، أرقام عشرية، نص، إلخ.',
  '1. Variable = boîte nommée qui stocke une valeur\n2. Type = ce que la boîte peut contenir (nombre, texte, etc.)\n3. Types courants : entier (int), décimal (float), texte (string), booléen (true/false)\n4. Le nom de la variable doit être clair et descriptif\n5. On peut changer la valeur d''une variable',
  '1. Variable = named box that stores a value\n2. Type = what the box can contain (number, text, etc.)\n3. Common types: integer (int), decimal (float), text (string), boolean (true/false)\n4. Variable name must be clear and descriptive\n5. We can change a variable''s value',
  '1. المتغير = صندوق مسمى يخزن قيمة\n2. النوع = ما يمكن أن يحتويه الصندوق (رقم، نص، إلخ)\n3. أنواع شائعة: عدد صحيح (int)، عشري (float)، نص (string)، منطقي (true/false)\n4. اسم المتغير يجب أن يكون واضحًا ووصفيًا\n5. يمكننا تغيير قيمة المتغير',
  'Imaginez des boîtes de rangement : une boîte "âge" contient un nombre (25), une boîte "nom" contient du texte ("Ahmed"), une boîte "est_majeur" contient true ou false. Chaque boîte a un type spécifique.',
  'Imagine storage boxes: an "age" box contains a number (25), a "name" box contains text ("Ahmed"), an "is_adult" box contains true or false. Each box has a specific type.',
  'تخيل صناديق التخزين: صندوق "العمر" يحتوي على رقم (25)، صندوق "الاسم" يحتوي على نص ("أحمد")، صندوق "بالغ" يحتوي على true أو false. كل صندوق له نوع محدد.',
  'Exemples de variables :\nage = 25          (nombre entier)\nprix = 19.99      (nombre décimal)\nnom = "Ahmed"     (texte)\nest_majeur = true (booléen)\n\nEn Java :\nint age = 25;\nString nom = "Ahmed";\nboolean estMajeur = true;',
  'Variable examples:\nage = 25          (whole number)\nprice = 19.99    (decimal number)\nname = "Ahmed"   (text)\nis_adult = true  (boolean)\n\nIn Java:\nint age = 25;\nString name = "Ahmed";\nboolean isAdult = true;',
  'أمثلة على المتغيرات:\nالعمر = 25          (عدد صحيح)\nالسعر = 19.99      (عدد عشري)\nالاسم = "أحمد"     (نص)\nبالغ = true         (منطقي)\n\nفي Java:\nint age = 25;\nString name = "Ahmed";\nboolean isAdult = true;',
  2, 25, NOW(), NOW()
);

-- Exercice 1.2: Variables
INSERT INTO exercises (course_id, lesson_id, title_fr, title_en, title_ar,
                      description_fr, description_en, description_ar,
                      solution_fr, solution_en, solution_ar,
                      type, order_index, difficulty, created_at, updated_at)
VALUES (
  1, (SELECT id FROM lessons WHERE course_id = 1 AND order_index = 2),
  'Exercice : Créer des variables',
  'Exercise: Create Variables',
  'تمرين: إنشاء متغيرات',
  'Créez des variables pour stocker : votre nom (texte), votre âge (nombre entier), votre taille en mètres (nombre décimal), et si vous avez un permis de conduire (booléen). Écrivez le code dans l''espace prévu.',
  'Create variables to store: your name (text), your age (whole number), your height in meters (decimal number), and whether you have a driver''s license (boolean). Write the code in the provided space.',
  'أنشئ متغيرات لتخزين: اسمك (نص)، عمرك (عدد صحيح)، طولك بالأمتار (عدد عشري)، وما إذا كان لديك رخصة قيادة (منطقي). اكتب الكود في المساحة المخصصة.',
  'Solution Java :\nString nom = "Ahmed";\nint age = 25;\ndouble taille = 1.75;\nboolean aPermis = true;\n\nSolution Python (exemple) :\nnom = "Ahmed"\nage = 25\ntaille = 1.75\na_permis = True',
  'Java Solution:\nString name = "Ahmed";\nint age = 25;\ndouble height = 1.75;\nboolean hasLicense = true;\n\nPython Solution (example):\nname = "Ahmed"\nage = 25\nheight = 1.75\nhas_license = True',
  'حل Java:\nString name = "Ahmed";\nint age = 25;\ndouble height = 1.75;\nboolean hasLicense = true;\n\nحل Python (مثال):\nname = "Ahmed"\nage = 25\nheight = 1.75\nhas_license = True',
  'CODING', 2, 2, NOW(), NOW()
);

-- ============================================
-- COURS 2: Introduction au Développement Web
-- ============================================

-- Leçon 2.1: Comment fonctionne le web
INSERT INTO lessons (course_id, title_fr, title_en, title_ar, content_fr, content_en, content_ar,
                     key_points_fr, key_points_en, key_points_ar,
                     analogies_fr, analogies_en, analogies_ar,
                     examples_fr, examples_en, examples_ar,
                     order_index, estimated_duration, created_at, updated_at)
VALUES (
  2,
  'Comment fonctionne le web : HTTP, navigateur et serveur',
  'How the Web Works: HTTP, Browser and Server',
  'كيف يعمل الويب: HTTP والمتصفح والخادم',
  'Le web fonctionne comme un restaurant : vous (le navigateur) êtes le client, vous regardez le menu (la page web), vous commandez (requête HTTP), le serveur (le serveur web) prépare votre plat (la page HTML/CSS/JS) et vous le sert. HTTP est le protocole de communication, comme la langue que vous utilisez pour commander.',
  'The web works like a restaurant: you (the browser) are the customer, you look at the menu (the web page), you order (HTTP request), the server (the web server) prepares your dish (the HTML/CSS/JS page) and serves it to you. HTTP is the communication protocol, like the language you use to order.',
  'الويب يعمل مثل مطعم: أنت (المتصفح) الزبون، تنظر إلى القائمة (صفحة الويب)، تطلب (طلب HTTP)، الخادم (خادم الويب) يعد طبقك (صفحة HTML/CSS/JS) ويقدمه لك. HTTP هو بروتوكول الاتصال، مثل اللغة التي تستخدمها للطلب.',
  '1. Navigateur = client qui affiche les pages\n2. Serveur = ordinateur qui stocke et envoie les pages\n3. HTTP = protocole de communication (comme une langue)\n4. Requête = demande du navigateur au serveur\n5. Réponse = ce que le serveur renvoie (HTML, CSS, JS, images)',
  '1. Browser = client that displays pages\n2. Server = computer that stores and sends pages\n3. HTTP = communication protocol (like a language)\n4. Request = browser request to server\n5. Response = what server returns (HTML, CSS, JS, images)',
  '1. المتصفح = عميل يعرض الصفحات\n2. الخادم = كمبيوتر يخزن ويرسل الصفحات\n3. HTTP = بروتوكول الاتصال (مثل لغة)\n4. الطلب = طلب المتصفح إلى الخادم\n5. الاستجابة = ما يعيده الخادم (HTML، CSS، JS، صور)',
  'Analogie du restaurant :\n- Vous (navigateur) : "Je veux la page d''accueil"\n- Serveur : "Voici la page HTML avec le CSS et le JavaScript"\n- Vous recevez et affichez la page\n\nC''est exactement comme commander au restaurant !',
  'Restaurant analogy:\n- You (browser): "I want the home page"\n- Server: "Here is the HTML page with CSS and JavaScript"\n- You receive and display the page\n\nIt''s exactly like ordering at a restaurant!',
  'تشبيه المطعم:\n- أنت (المتصفح): "أريد الصفحة الرئيسية"\n- الخادم: "ها هي صفحة HTML مع CSS و JavaScript"\n- أنت تستقبل وتعرض الصفحة\n\nإنه تمامًا مثل الطلب في المطعم!',
  'Exemple de requête HTTP :\nGET /index.html HTTP/1.1\nHost: www.example.com\n\nRéponse du serveur :\nHTTP/1.1 200 OK\nContent-Type: text/html\n\n<html>...</html>',
  'HTTP request example:\nGET /index.html HTTP/1.1\nHost: www.example.com\n\nServer response:\nHTTP/1.1 200 OK\nContent-Type: text/html\n\n<html>...</html>',
  'مثال على طلب HTTP:\nGET /index.html HTTP/1.1\nHost: www.example.com\n\nاستجابة الخادم:\nHTTP/1.1 200 OK\nContent-Type: text/html\n\n<html>...</html>',
  1, 35, NOW(), NOW()
); ON CONFLICT (course_id, order_index) DO NOTHING;

-- Exercice 2.1: Comprendre HTTP
INSERT INTO exercises (course_id, lesson_id, title_fr, title_en, title_ar,
                      description_fr, description_en, description_ar,
                      solution_fr, solution_en, solution_ar,
                      type, order_index, difficulty, created_at, updated_at)
VALUES (
  2, (SELECT id FROM lessons WHERE course_id = 2 AND order_index = 1),
  'QCM : Comprendre le fonctionnement du web',
  'Quiz: Understanding How the Web Works',
  'اختبار: فهم كيفية عمل الويب',
  'Répondez aux questions suivantes pour vérifier votre compréhension du fonctionnement du web.',
  'Answer the following questions to verify your understanding of how the web works.',
  'أجب على الأسئلة التالية للتحقق من فهمك لكيفية عمل الويب.',
  'Voir les explications ci-dessous pour chaque question.',
  'See explanations below for each question.',
  'انظر إلى الشروحات أدناه لكل سؤال.',
  'QUIZ', 1, 2, NOW(), NOW()
);

-- QCM pour l'exercice 2.1
INSERT INTO quiz_questions (exercise_id, question_fr, question_en, question_ar,
                           correct_answer_index, explanation_fr, explanation_en, explanation_ar)
VALUES 
(
  (SELECT id FROM exercises WHERE course_id = 2 AND lesson_id = (SELECT id FROM lessons WHERE course_id = 2 AND order_index = 1) AND order_index = 1),
  'Qu''est-ce que HTTP ?',
  'What is HTTP?',
  'ما هو HTTP؟',
  1,
  'HTTP (HyperText Transfer Protocol) est le protocole de communication utilisé entre le navigateur et le serveur. C''est comme une langue commune que les deux comprennent pour échanger des informations.',
  'HTTP (HyperText Transfer Protocol) is the communication protocol used between the browser and the server. It''s like a common language that both understand to exchange information.',
  'HTTP (بروتوكول نقل النص التشعبي) هو بروتوكول الاتصال المستخدم بين المتصفح والخادم. إنه مثل لغة مشتركة يفهمها الاثنان لتبادل المعلومات.'
),
(
  (SELECT id FROM exercises WHERE course_id = 2 AND lesson_id = (SELECT id FROM lessons WHERE course_id = 2 AND order_index = 1) AND order_index = 1),
  'Quel est le rôle du navigateur ?',
  'What is the role of the browser?',
  'ما هو دور المتصفح؟',
  0,
  'Le navigateur est le client : il envoie des requêtes HTTP au serveur, reçoit les réponses (HTML, CSS, JS) et affiche la page web à l''utilisateur.',
  'The browser is the client: it sends HTTP requests to the server, receives responses (HTML, CSS, JS) and displays the web page to the user.',
  'المتصفح هو العميل: يرسل طلبات HTTP إلى الخادم، يستقبل الاستجابات (HTML، CSS، JS) ويعرض صفحة الويب للمستخدم.'
);

-- ============================================
-- COURS 3: Java et Spring Boot
-- ============================================

-- Leçon 3.1: Premiers pas avec Java
INSERT INTO lessons (course_id, title_fr, title_en, title_ar, content_fr, content_en, content_ar,
                     key_points_fr, key_points_en, key_points_ar,
                     analogies_fr, analogies_en, analogies_ar,
                     examples_fr, examples_en, examples_ar,
                     order_index, estimated_duration, created_at, updated_at)
VALUES (
  3,
  'Premiers pas avec Java : syntaxe de base',
  'First Steps with Java: Basic Syntax',
  'الخطوات الأولى مع Java: الصياغة الأساسية',
  'Java est un langage orienté objet, comme un langage structuré avec des règles précises. Chaque programme Java commence par une classe (comme un modèle) et une méthode main (le point d''entrée). Pensez à une classe comme un plan de maison : vous définissez la structure, puis vous créez des instances (des maisons réelles) basées sur ce plan.',
  'Java is an object-oriented language, like a structured language with precise rules. Every Java program starts with a class (like a template) and a main method (the entry point). Think of a class as a house plan: you define the structure, then you create instances (real houses) based on that plan.',
  'Java هي لغة موجهة للكائنات، مثل لغة منظمة بقواعد دقيقة. كل برنامج Java يبدأ بفئة (مثل قالب) وطريقة main (نقطة الدخول). فكر في الفئة كخطة منزل: تحدد البنية، ثم تنشئ مثيلات (منازل حقيقية) بناءً على هذه الخطة.',
  '1. Chaque fichier Java = une classe\n2. public class NomClasse { ... }\n3. public static void main(String[] args) = point d''entrée\n4. System.out.println() = afficher du texte\n5. Les instructions se terminent par un point-virgule (;)\n6. Les accolades { } délimitent les blocs de code',
  '1. Each Java file = a class\n2. public class ClassName { ... }\n3. public static void main(String[] args) = entry point\n4. System.out.println() = display text\n5. Statements end with a semicolon (;)\n6. Braces { } delimit code blocks',
  '1. كل ملف Java = فئة\n2. public class NomClasse { ... }\n3. public static void main(String[] args) = نقطة الدخول\n4. System.out.println() = عرض النص\n5. التعليمات تنتهي بفاصلة منقوطة (;)\n6. الأقواس { } تحدد كتل الكود',
  'Une classe Java est comme un moule à gâteau : vous définissez le moule (la classe), puis vous créez plusieurs gâteaux (les objets) avec ce moule. Chaque gâteau a les mêmes caractéristiques mais peut avoir des valeurs différentes.',
  'A Java class is like a cake mold: you define the mold (the class), then you create several cakes (the objects) with that mold. Each cake has the same characteristics but can have different values.',
  'فئة Java مثل قالب كعك: تحدد القالب (الفئة)، ثم تنشئ عدة كعكات (الكائنات) بهذا القالب. كل كعكة لها نفس الخصائص لكن يمكن أن يكون لها قيم مختلفة.',
  'Exemple de programme Java simple :\n\npublic class Bonjour {\n    public static void main(String[] args) {\n        System.out.println("Bonjour le monde !");\n        int age = 25;\n        System.out.println("J''ai " + age + " ans");\n    }\n}\n\nRésultat :\nBonjour le monde !\nJ''ai 25 ans',
  'Simple Java program example:\n\npublic class Hello {\n    public static void main(String[] args) {\n        System.out.println("Hello world!");\n        int age = 25;\n        System.out.println("I am " + age + " years old");\n    }\n}\n\nOutput:\nHello world!\nI am 25 years old',
  'مثال على برنامج Java بسيط:\n\npublic class Bonjour {\n    public static void main(String[] args) {\n        System.out.println("مرحبا بالعالم!");\n        int age = 25;\n        System.out.println("عمري " + age + " سنة");\n    }\n}\n\nالنتيجة:\nمرحبا بالعالم!\nعمري 25 سنة',
  1, 40, NOW(), NOW()
);

-- Bloc de code pour la leçon 3.1
INSERT INTO code_blocks (lesson_id, code, language, description_fr, description_en, description_ar, is_editable, is_runnable, order_index)
VALUES (
  (SELECT id FROM lessons WHERE course_id = 3 AND order_index = 1),
  'public class Bonjour {
    public static void main(String[] args) {
        // Afficher un message
        System.out.println("Bonjour depuis Java !");
        
        // Déclarer une variable
        String nom = "Ahmed";
        int age = 25;
        
        // Afficher avec concaténation
        System.out.println("Je m''appelle " + nom + " et j''ai " + age + " ans");
    }
}',
  'java',
  'Ce code montre la structure de base d''un programme Java : une classe, la méthode main, et quelques instructions simples.',
  'This code shows the basic structure of a Java program: a class, the main method, and some simple statements.',
  'هذا الكود يوضح البنية الأساسية لبرنامج Java: فئة، طريقة main، وبعض التعليمات البسيطة.',
  true,
  true,
  1
);

-- Exercice 3.1: Premier programme Java
INSERT INTO exercises (course_id, lesson_id, title_fr, title_en, title_ar,
                      description_fr, description_en, description_ar,
                      solution_fr, solution_en, solution_ar,
                      type, order_index, difficulty, created_at, updated_at)
VALUES (
  3, (SELECT id FROM lessons WHERE course_id = 3 AND order_index = 1),
  'Exercice : Votre premier programme Java',
  'Exercise: Your First Java Program',
  'تمرين: برنامجك الأول في Java',
  'Créez un programme Java qui :\n1. Affiche "Bienvenue à l''Institut de l''informatique !"\n2. Déclare une variable pour votre nom\n3. Déclare une variable pour votre âge\n4. Affiche "Je m''appelle [votre nom] et j''ai [votre âge] ans"\n\nÉcrivez le code dans l''éditeur ci-dessous.',
  'Create a Java program that:\n1. Displays "Welcome to the Institut de l''informatique!"\n2. Declares a variable for your name\n3. Declares a variable for your age\n4. Displays "My name is [your name] and I am [your age] years old"\n\nWrite the code in the editor below.',
  'أنشئ برنامج Java يقوم بـ:\n1. عرض "مرحبًا بك في معهد المعلوماتية!"\n2. إعلان متغير لاسمك\n3. إعلان متغير لعمرك\n4. عرض "اسمي [اسمك] وعمري [عمرك] سنة"\n\nاكتب الكود في المحرر أدناه.',
  'Solution :\n\npublic class MonPremierProgramme {\n    public static void main(String[] args) {\n        System.out.println("Bienvenue à l''Institut de l''informatique !");\n        \n        String nom = "Ahmed";\n        int age = 25;\n        \n        System.out.println("Je m''appelle " + nom + " et j''ai " + age + " ans");\n    }\n}',
  'Solution:\n\npublic class MyFirstProgram {\n    public static void main(String[] args) {\n        System.out.println("Welcome to the Institut de l''informatique!");\n        \n        String name = "Ahmed";\n        int age = 25;\n        \n        System.out.println("My name is " + name + " and I am " + age + " years old");\n    }\n}',
  'الحل:\n\npublic class MonPremierProgramme {\n    public static void main(String[] args) {\n        System.out.println("مرحبًا بك في معهد المعلوماتية!");\n        \n        String nom = "Ahmed";\n        int age = 25;\n        \n        System.out.println("اسمي " + nom + " وعمري " + age + " سنة");\n    }\n}',
  'CODING', 1, 2, NOW(), NOW()
);

-- ============================================
-- COURS 4: Angular et TypeScript
-- ============================================

-- Leçon 4.1: Introduction à TypeScript
INSERT INTO lessons (course_id, title_fr, title_en, title_ar, content_fr, content_en, content_ar,
                     key_points_fr, key_points_en, key_points_ar,
                     analogies_fr, analogies_en, analogies_ar,
                     examples_fr, examples_en, examples_ar,
                     order_index, estimated_duration, created_at, updated_at)
VALUES (
  4,
  'Introduction à TypeScript : JavaScript avec des types',
  'Introduction to TypeScript: JavaScript with Types',
  'مقدمة إلى TypeScript: JavaScript مع الأنواع',
  'TypeScript est comme JavaScript mais avec un système de types. Imaginez JavaScript comme une langue sans règles strictes, et TypeScript comme la même langue mais avec un dictionnaire et une grammaire précise. Cela vous aide à éviter les erreurs avant même d''exécuter votre code, comme un correcteur orthographique pour votre code.',
  'TypeScript is like JavaScript but with a type system. Imagine JavaScript as a language without strict rules, and TypeScript as the same language but with a precise dictionary and grammar. This helps you avoid errors before even running your code, like a spell checker for your code.',
  'TypeScript مثل JavaScript لكن مع نظام أنواع. تخيل JavaScript كلغة بدون قواعد صارمة، و TypeScript كلغة نفسها لكن مع قاموس وقواعد دقيقة. هذا يساعدك على تجنب الأخطاء قبل حتى تشغيل الكود، مثل مدقق إملائي لكودك.',
  '1. TypeScript = JavaScript + types\n2. Les types aident à détecter les erreurs tôt\n3. Syntaxe : let nom: string = "Ahmed"\n4. TypeScript se compile en JavaScript\n5. Angular utilise TypeScript par défaut',
  '1. TypeScript = JavaScript + types\n2. Types help detect errors early\n3. Syntax: let name: string = "Ahmed"\n4. TypeScript compiles to JavaScript\n5. Angular uses TypeScript by default',
  '1. TypeScript = JavaScript + أنواع\n2. الأنواع تساعد في اكتشاف الأخطاء مبكرًا\n3. الصياغة: let name: string = "Ahmed"\n4. TypeScript يترجم إلى JavaScript\n5. Angular يستخدم TypeScript افتراضيًا',
  'TypeScript est comme un GPS avec vérification : JavaScript vous dit "tournez à gauche" sans vérifier, TypeScript vérifie d''abord que la route existe avant de vous donner la direction. Cela évite les erreurs de navigation (erreurs de code).',
  'TypeScript is like a GPS with verification: JavaScript tells you "turn left" without checking, TypeScript first verifies that the route exists before giving you the direction. This avoids navigation errors (code errors).',
  'TypeScript مثل GPS مع التحقق: JavaScript يقول لك "انعطف يسارًا" بدون التحقق، TypeScript يتحقق أولاً من وجود الطريق قبل إعطائك الاتجاه. هذا يتجنب أخطاء الملاحة (أخطاء الكود).',
  'Exemple TypeScript :\n\n// Avec types explicites\nlet nom: string = "Ahmed";\nlet age: number = 25;\nlet actif: boolean = true;\n\n// Erreur détectée par TypeScript\n// nom = 123; // ❌ Erreur : string attendu\n\n// Tableau typé\nlet notes: number[] = [15, 18, 20];',
  'TypeScript example:\n\n// With explicit types\nlet name: string = "Ahmed";\nlet age: number = 25;\nlet active: boolean = true;\n\n// Error detected by TypeScript\n// name = 123; // ❌ Error: string expected\n\n// Typed array\nlet grades: number[] = [15, 18, 20];',
  'مثال TypeScript:\n\n// مع أنواع صريحة\nlet name: string = "Ahmed";\nlet age: number = 25;\nlet active: boolean = true;\n\n// خطأ يكتشفه TypeScript\n// name = 123; // ❌ خطأ: string متوقع\n\n// مصفوفة مكتوبة\nlet notes: number[] = [15, 18, 20];',
  1, 30, NOW(), NOW()
);

-- Bloc de code pour la leçon 4.1
INSERT INTO code_blocks (lesson_id, code, language, description_fr, description_en, description_ar, is_editable, is_runnable, order_index)
VALUES (
  (SELECT id FROM lessons WHERE course_id = 4 AND order_index = 1),
  '// Déclaration de variables avec types
let nom: string = "Ahmed";
let age: number = 25;
let estEtudiant: boolean = true;

// Tableau typé
let cours: string[] = ["Java", "Angular", "Docker"];

// Objet typé avec interface
interface Etudiant {
    nom: string;
    age: number;
    cours: string[];
}

let etudiant: Etudiant = {
    nom: "Ahmed",
    age: 25,
    cours: ["Java", "Angular"]
};

console.log(etudiant.nom);',
  'typescript',
  'Ce code montre les bases de TypeScript : types primitifs, tableaux typés et interfaces pour définir la structure d''objets.',
  'This code shows TypeScript basics: primitive types, typed arrays and interfaces to define object structure.',
  'هذا الكود يوضح أساسيات TypeScript: الأنواع البدائية، المصفوفات المكتوبة والواجهات لتعريف بنية الكائنات.',
  true,
  true,
  1
);

-- Leçon 4.2: Composants Angular
INSERT INTO lessons (course_id, title_fr, title_en, title_ar, content_fr, content_en, content_ar,
                     key_points_fr, key_points_en, key_points_ar,
                     analogies_fr, analogies_en, analogies_ar,
                     examples_fr, examples_en, examples_ar,
                     order_index, estimated_duration, created_at, updated_at)
VALUES (
  4,
  'Composants Angular : les briques de votre application',
  'Angular Components: Building Blocks of Your Application',
  'مكونات Angular: لبنات تطبيقك',
  'Un composant Angular est comme une pièce de LEGO : c''est une unité réutilisable qui a sa propre structure (template HTML), son style (CSS) et sa logique (TypeScript). Vous assemblez plusieurs composants pour créer une application complète, comme vous assemblez des pièces LEGO pour créer un modèle.',
  'An Angular component is like a LEGO piece: it''s a reusable unit that has its own structure (HTML template), style (CSS) and logic (TypeScript). You assemble multiple components to create a complete application, just like you assemble LEGO pieces to create a model.',
  'مكون Angular مثل قطعة LEGO: إنها وحدة قابلة لإعادة الاستخدام لها بنيتها الخاصة (قالب HTML)، نمطها (CSS) ومنطقها (TypeScript). تجمع عدة مكونات لإنشاء تطبيق كامل، تمامًا كما تجمع قطع LEGO لإنشاء نموذج.',
  '1. Composant = template + style + logique\n2. @Component() = décorateur qui définit le composant\n3. selector = nom du composant dans le HTML\n4. templateUrl = fichier HTML du template\n5. styleUrls = fichiers CSS du style',
  '1. Component = template + style + logic\n2. @Component() = decorator that defines the component\n3. selector = component name in HTML\n4. templateUrl = HTML template file\n5. styleUrls = CSS style files',
  '1. المكون = قالب + نمط + منطق\n2. @Component() = مزخرف يحدد المكون\n3. selector = اسم المكون في HTML\n4. templateUrl = ملف HTML للقالب\n5. styleUrls = ملفات CSS للنمط',
  'Un composant Angular est comme une pièce de puzzle : elle a une forme spécifique (template), une couleur (style), et elle s''assemble avec d''autres pièces (autres composants) pour former une image complète (l''application).',
  'An Angular component is like a puzzle piece: it has a specific shape (template), a color (style), and it assembles with other pieces (other components) to form a complete picture (the application).',
  'مكون Angular مثل قطعة أحجية: لها شكل محدد (القالب)، لون (النمط)، وتتجمع مع قطع أخرى (مكونات أخرى) لتشكل صورة كاملة (التطبيق).',
  'Exemple de composant Angular :\n\n// course-card.component.ts\nimport { Component } from ''@angular/core'';\n\n@Component({\n  selector: ''app-course-card'',\n  templateUrl: ''./course-card.component.html'',\n  styleUrls: [''./course-card.component.css'']\n})\nexport class CourseCardComponent {\n  title = ''Java et Spring Boot'';\n  description = ''Apprenez Java...'';\n}\n\n// course-card.component.html\n<div class="card">\n  <h3>{{ title }}</h3>\n  <p>{{ description }}</p>\n</div>',
  'Angular component example:\n\n// course-card.component.ts\nimport { Component } from ''@angular/core'';\n\n@Component({\n  selector: ''app-course-card'',\n  templateUrl: ''./course-card.component.html'',\n  styleUrls: [''./course-card.component.css'']\n})\nexport class CourseCardComponent {\n  title = ''Java and Spring Boot'';\n  description = ''Learn Java...'';\n}\n\n// course-card.component.html\n<div class="card">\n  <h3>{{ title }}</h3>\n  <p>{{ description }}</p>\n</div>',
  'مثال على مكون Angular:\n\n// course-card.component.ts\nimport { Component } from ''@angular/core'';\n\n@Component({\n  selector: ''app-course-card'',\n  templateUrl: ''./course-card.component.html'',\n  styleUrls: [''./course-card.component.css'']\n})\nexport class CourseCardComponent {\n  title = ''Java و Spring Boot'';\n  description = ''تعلم Java...'';\n}\n\n// course-card.component.html\n<div class="card">\n  <h3>{{ title }}</h3>\n  <p>{{ description }}</p>\n</div>',
  2, 45, NOW(), NOW()
);

-- ============================================
-- COURS 5: Bases de données avec PostgreSQL
-- ============================================

-- Leçon 5.1: Introduction aux bases de données
INSERT INTO lessons (course_id, title_fr, title_en, title_ar, content_fr, content_en, content_ar,
                     key_points_fr, key_points_en, key_points_ar,
                     analogies_fr, analogies_en, analogies_ar,
                     examples_fr, examples_en, examples_ar,
                     order_index, estimated_duration, created_at, updated_at)
VALUES (
  5,
  'Introduction aux bases de données relationnelles',
  'Introduction to Relational Databases',
  'مقدمة إلى قواعد البيانات العلائقية',
  'Une base de données est comme une bibliothèque bien organisée : au lieu de livres, vous avez des tables (étagères), chaque table contient des lignes (livres) avec des colonnes (informations sur chaque livre). Les relations entre tables sont comme des références croisées : un livre peut être lié à un auteur dans une autre table.',
  'A database is like a well-organized library: instead of books, you have tables (shelves), each table contains rows (books) with columns (information about each book). Relationships between tables are like cross-references: a book can be linked to an author in another table.',
  'قاعدة البيانات مثل مكتبة منظمة جيدًا: بدلاً من الكتب، لديك جداول (أرفف)، كل جدول يحتوي على صفوف (كتب) بأعمدة (معلومات عن كل كتاب). العلاقات بين الجداول مثل المراجع المتقاطعة: كتاب يمكن ربطه بمؤلف في جدول آخر.',
  '1. Table = structure qui stocke des données similaires\n2. Ligne (row) = un enregistrement\n3. Colonne (column) = un attribut/champ\n4. Clé primaire = identifiant unique\n5. Clé étrangère = lien vers une autre table\n6. Relation = connexion entre tables',
  '1. Table = structure that stores similar data\n2. Row = a record\n3. Column = an attribute/field\n4. Primary key = unique identifier\n5. Foreign key = link to another table\n6. Relationship = connection between tables',
  '1. الجدول = بنية تخزن بيانات متشابهة\n2. الصف = سجل\n3. العمود = خاصية/حقل\n4. المفتاح الأساسي = معرف فريد\n5. المفتاح الخارجي = رابط إلى جدول آخر\n6. العلاقة = اتصال بين الجداول',
  'Pensez à une base de données comme un classeur : chaque tiroir est une table (Cours, Étudiants), chaque fiche est une ligne, et chaque champ sur la fiche est une colonne. Les relations sont comme des notes qui renvoient à d''autres fiches dans d''autres tiroirs.',
  'Think of a database as a filing cabinet: each drawer is a table (Courses, Students), each file is a row, and each field on the file is a column. Relationships are like notes that refer to other files in other drawers.',
  'فكر في قاعدة البيانات كخزانة ملفات: كل درج هو جدول (كورسات، طلاب)، كل ملف هو صف، وكل حقل على الملف هو عمود. العلاقات مثل ملاحظات تشير إلى ملفات أخرى في أدراج أخرى.',
  'Exemple de structure de table :\n\nTable: courses\n+----+------------------+------------------+\n| id | title_fr         | description_fr   |\n+----+------------------+------------------+\n| 1  | Java et Spring   | Apprenez Java...|\n| 2  | Angular          | Créez des apps..|\n+----+------------------+------------------+\n\nid = clé primaire (unique)\nChaque ligne = un cours',
  'Table structure example:\n\nTable: courses\n+----+------------------+------------------+\n| id | title_fr         | description_fr   |\n+----+------------------+------------------+\n| 1  | Java and Spring  | Learn Java...    |\n| 2  | Angular          | Create apps...  |\n+----+------------------+------------------+\n\nid = primary key (unique)\nEach row = a course',
  'مثال على بنية الجدول:\n\nالجدول: courses\n+----+------------------+------------------+\n| id | title_fr         | description_fr   |\n+----+------------------+------------------+\n| 1  | Java و Spring    | تعلم Java...     |\n| 2  | Angular          | أنشئ تطبيقات... |\n+----+------------------+------------------+\n\nid = المفتاح الأساسي (فريد)\nكل صف = كورس',
  1, 35, NOW(), NOW()
); ON CONFLICT (course_id, order_index) DO NOTHING;

-- Exercice 5.1: Créer une table
INSERT INTO exercises (course_id, lesson_id, title_fr, title_en, title_ar,
                      description_fr, description_en, description_ar,
                      solution_fr, solution_en, solution_ar,
                      type, order_index, difficulty, created_at, updated_at)
VALUES (
  5, (SELECT id FROM lessons WHERE course_id = 5 AND order_index = 1),
  'Exercice : Créer votre première table SQL',
  'Exercise: Create Your First SQL Table',
  'تمرين: إنشاء جدول SQL الأول',
  'Créez une table "students" avec les colonnes suivantes :\n- id (nombre entier, clé primaire)\n- first_name (texte, maximum 100 caractères)\n- last_name (texte, maximum 100 caractères)\n- email (texte, unique, maximum 255 caractères)\n- age (nombre entier)\n- created_at (date et heure)\n\nÉcrivez la requête SQL CREATE TABLE.',
  'Create a "students" table with the following columns:\n- id (integer, primary key)\n- first_name (text, maximum 100 characters)\n- last_name (text, maximum 100 characters)\n- email (text, unique, maximum 255 characters)\n- age (integer)\n- created_at (date and time)\n\nWrite the CREATE TABLE SQL query.',
  'أنشئ جدول "students" بالأعمدة التالية:\n- id (عدد صحيح، مفتاح أساسي)\n- first_name (نص، حد أقصى 100 حرف)\n- last_name (نص، حد أقصى 100 حرف)\n- email (نص، فريد، حد أقصى 255 حرف)\n- age (عدد صحيح)\n- created_at (تاريخ ووقت)\n\nاكتب استعلام SQL CREATE TABLE.',
  'Solution SQL :\n\nCREATE TABLE students (\n    id SERIAL PRIMARY KEY,\n    first_name VARCHAR(100) NOT NULL,\n    last_name VARCHAR(100) NOT NULL,\n    email VARCHAR(255) UNIQUE NOT NULL,\n    age INTEGER,\n    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP\n);\n\nExplications :\n- SERIAL = auto-incrémenté\n- PRIMARY KEY = identifiant unique\n- VARCHAR(n) = texte de max n caractères\n- NOT NULL = obligatoire\n- UNIQUE = valeur unique\n- DEFAULT = valeur par défaut',
  'SQL Solution:\n\nCREATE TABLE students (\n    id SERIAL PRIMARY KEY,\n    first_name VARCHAR(100) NOT NULL,\n    last_name VARCHAR(100) NOT NULL,\n    email VARCHAR(255) UNIQUE NOT NULL,\n    age INTEGER,\n    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP\n);\n\nExplanations:\n- SERIAL = auto-incremented\n- PRIMARY KEY = unique identifier\n- VARCHAR(n) = text of max n characters\n- NOT NULL = required\n- UNIQUE = unique value\n- DEFAULT = default value',
  'حل SQL:\n\nCREATE TABLE students (\n    id SERIAL PRIMARY KEY,\n    first_name VARCHAR(100) NOT NULL,\n    last_name VARCHAR(100) NOT NULL,\n    email VARCHAR(255) UNIQUE NOT NULL,\n    age INTEGER,\n    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP\n);\n\nشروحات:\n- SERIAL = تلقائي الزيادة\n- PRIMARY KEY = معرف فريد\n- VARCHAR(n) = نص بحد أقصى n حرف\n- NOT NULL = إلزامي\n- UNIQUE = قيمة فريدة\n- DEFAULT = قيمة افتراضية',
  'CODING', 1, 3, NOW(), NOW()
);

-- ============================================
-- Note: Ce fichier contient des exemples de leçons, exercices et QCM
-- Pour une implémentation complète, continuez à ajouter du contenu
-- pour tous les cours restants en suivant le même format.
-- ============================================
