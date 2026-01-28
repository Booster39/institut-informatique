-- ============================================
-- CONTENU COMPLET : Leçons, Exercices, QCM et Projets
-- Pour tous les 11 cours de la plateforme
-- ============================================

-- ============================================
-- COURS 1: Fondamentaux du développement
-- ============================================

-- Leçon 1.3: Structures conditionnelles (if/else)
INSERT INTO lessons (course_id, title_fr, title_en, title_ar, content_fr, content_en, content_ar,
                     key_points_fr, key_points_en, key_points_ar,
                     analogies_fr, analogies_en, analogies_ar,
                     examples_fr, examples_en, examples_ar,
                     order_index, estimated_duration, created_at, updated_at)
VALUES (
  1,
  'Structures conditionnelles : Prendre des décisions',
  'Conditional Structures: Making Decisions',
  'الهياكل الشرطية: اتخاذ القرارات',
  'Les structures conditionnelles permettent à votre programme de prendre des décisions, comme un feu de circulation : si le feu est vert, vous passez ; sinon, vous attendez. C''est la base de la logique programmatique : votre code peut réagir différemment selon les situations.',
  'Conditional structures allow your program to make decisions, like a traffic light: if the light is green, you go; otherwise, you wait. This is the basis of programmatic logic: your code can react differently depending on situations.',
  'الهياكل الشرطية تسمح لبرنامجك باتخاذ قرارات، مثل إشارة المرور: إذا كانت الإشارة خضراء، تمر؛ وإلا تنتظر. هذا أساس المنطق البرمجي: كودك يمكنه التفاعل بشكل مختلف حسب المواقف.',
  '1. if = si une condition est vraie, exécute ce code\n2. else = sinon, exécute ce code alternatif\n3. else if = vérifie une autre condition\n4. Les conditions utilisent des opérateurs : == (égal), != (différent), >, <, >=, <=\n5. Les conditions peuvent être combinées avec && (ET) et || (OU)',
  '1. if = if a condition is true, execute this code\n2. else = otherwise, execute this alternative code\n3. else if = check another condition\n4. Conditions use operators: == (equal), != (not equal), >, <, >=, <=\n5. Conditions can be combined with && (AND) and || (OR)',
  '1. if = إذا كانت الحالة صحيحة، نفذ هذا الكود\n2. else = وإلا، نفذ هذا الكود البديل\n3. else if = تحقق من حالة أخرى\n4. الشروط تستخدم عوامل: == (يساوي)، != (لا يساوي)، >، <، >=، <=\n5. الشروط يمكن دمجها مع && (و) و || (أو)',
  'Pensez à une décision quotidienne : "Si j''ai faim ET j''ai de l''argent, alors je vais au restaurant. Sinon, si j''ai faim, je mange à la maison. Sinon, je ne fais rien." C''est exactement comme if/else en programmation.',
  'Think of a daily decision: "If I am hungry AND I have money, then I go to the restaurant. Otherwise, if I am hungry, I eat at home. Otherwise, I do nothing." This is exactly like if/else in programming.',
  'فكر في قرار يومي: "إذا كنت جائعًا ولدي مال، إذن أذهب إلى المطعم. وإلا، إذا كنت جائعًا، آكل في المنزل. وإلا، لا أفعل شيئًا." هذا تمامًا مثل if/else في البرمجة.',
  'Exemple Java :\n\nint age = 20;\n\nif (age >= 18) {\n    System.out.println("Vous êtes majeur");\n} else {\n    System.out.println("Vous êtes mineur");\n}\n\n// Avec plusieurs conditions\nif (age < 13) {\n    System.out.println("Enfant");\n} else if (age < 18) {\n    System.out.println("Adolescent");\n} else {\n    System.out.println("Adulte");\n}',
  'Java example:\n\nint age = 20;\n\nif (age >= 18) {\n    System.out.println("You are an adult");\n} else {\n    System.out.println("You are a minor");\n}\n\n// With multiple conditions\nif (age < 13) {\n    System.out.println("Child");\n} else if (age < 18) {\n    System.out.println("Teenager");\n} else {\n    System.out.println("Adult");\n}',
  'مثال Java:\n\nint age = 20;\n\nif (age >= 18) {\n    System.out.println("أنت بالغ");\n} else {\n    System.out.println("أنت قاصر");\n}\n\n// مع شروط متعددة\nif (age < 13) {\n    System.out.println("طفل");\n} else if (age < 18) {\n    System.out.println("مراهق");\n} else {\n    System.out.println("بالغ");\n}',
  3, 30, NOW(), NOW()
);

-- Exercice 1.3
INSERT INTO exercises (course_id, lesson_id, title_fr, title_en, title_ar,
                      description_fr, description_en, description_ar,
                      solution_fr, solution_en, solution_ar,
                      type, order_index, difficulty, created_at, updated_at)
VALUES (
  1, (SELECT id FROM lessons WHERE course_id = 1 AND order_index = 3),
  'Exercice : Système de notation',
  'Exercise: Grading System',
  'تمرين: نظام التقييم',
  'Créez un programme qui détermine la mention selon la note :\n- 16-20 : "Excellent"\n- 14-15 : "Très bien"\n- 12-13 : "Bien"\n- 10-11 : "Passable"\n- 0-9 : "Insuffisant"\n\nUtilisez des structures conditionnelles.',
  'Create a program that determines the grade based on the score:\n- 16-20: "Excellent"\n- 14-15: "Very good"\n- 12-13: "Good"\n- 10-11: "Passable"\n- 0-9: "Insufficient"\n\nUse conditional structures.',
  'أنشئ برنامجًا يحدد التقدير حسب الدرجة:\n- 16-20: "ممتاز"\n- 14-15: "جيد جدًا"\n- 12-13: "جيد"\n- 10-11: "مقبول"\n- 0-9: "غير كاف"\n\nاستخدم الهياكل الشرطية.',
  'Solution Java :\n\nint note = 15;\nString mention;\n\nif (note >= 16) {\n    mention = "Excellent";\n} else if (note >= 14) {\n    mention = "Très bien";\n} else if (note >= 12) {\n    mention = "Bien";\n} else if (note >= 10) {\n    mention = "Passable";\n} else {\n    mention = "Insuffisant";\n}\n\nSystem.out.println("Mention : " + mention);',
  'Java Solution:\n\nint score = 15;\nString grade;\n\nif (score >= 16) {\n    grade = "Excellent";\n} else if (score >= 14) {\n    grade = "Very good";\n} else if (score >= 12) {\n    grade = "Good";\n} else if (score >= 10) {\n    grade = "Passable";\n} else {\n    grade = "Insufficient";\n}\n\nSystem.out.println("Grade: " + grade);',
  'حل Java:\n\nint note = 15;\nString mention;\n\nif (note >= 16) {\n    mention = "ممتاز";\n} else if (note >= 14) {\n    mention = "جيد جدًا";\n} else if (note >= 12) {\n    mention = "جيد";\n} else if (note >= 10) {\n    mention = "مقبول";\n} else {\n    mention = "غير كاف";\n}\n\nSystem.out.println("التقدير: " + mention);',
  'CODING', 3, 2, NOW(), NOW()
);

-- QCM pour leçon 1.3
INSERT INTO quiz_questions (exercise_id, question_fr, question_en, question_ar,
                           correct_answer_index, explanation_fr, explanation_en, explanation_ar)
VALUES 
(
  (SELECT id FROM exercises WHERE course_id = 1 AND lesson_id = (SELECT id FROM lessons WHERE course_id = 1 AND order_index = 3) AND order_index = 3),
  'Quelle est la syntaxe correcte pour une condition if en Java ?',
  'What is the correct syntax for an if condition in Java?',
  'ما هي الصياغة الصحيحة لشرط if في Java؟',
  0,
  'La syntaxe correcte est : if (condition) { code }. Les parenthèses autour de la condition sont obligatoires, et le code à exécuter est entre accolades.',
  'The correct syntax is: if (condition) { code }. Parentheses around the condition are mandatory, and the code to execute is between braces.',
  'الصياغة الصحيحة هي: if (condition) { code }. الأقواس حول الشرط إلزامية، والكود المراد تنفيذه بين الأقواس المعقوفة.'
),
(
  (SELECT id FROM exercises WHERE course_id = 1 AND lesson_id = (SELECT id FROM lessons WHERE course_id = 1 AND order_index = 3) AND order_index = 3),
  'Que fait l''opérateur && en Java ?',
  'What does the && operator do in Java?',
  'ماذا يفعل العامل && في Java؟',
  1,
  'L''opérateur && signifie "ET logique" : la condition est vraie seulement si les deux parties sont vraies. Par exemple : (age >= 18) && (aPermis) est vrai seulement si la personne a 18 ans ou plus ET a un permis.',
  'The && operator means "logical AND": the condition is true only if both parts are true. For example: (age >= 18) && (hasLicense) is true only if the person is 18 or older AND has a license.',
  'العامل && يعني "و المنطقي": الشرط صحيح فقط إذا كان كلا الجزأين صحيحين. على سبيل المثال: (age >= 18) && (hasLicense) صحيح فقط إذا كان الشخص 18 أو أكثر ولديه رخصة.'
);

-- Leçon 1.4: Boucles (for, while)
INSERT INTO lessons (course_id, title_fr, title_en, title_ar, content_fr, content_en, content_ar,
                     key_points_fr, key_points_en, key_points_ar,
                     analogies_fr, analogies_en, analogies_ar,
                     examples_fr, examples_en, examples_ar,
                     order_index, estimated_duration, created_at, updated_at)
VALUES (
  1,
  'Boucles : Répéter des actions',
  'Loops: Repeating Actions',
  'الحلقات: تكرار الإجراءات',
  'Les boucles permettent de répéter une action plusieurs fois, comme compter de 1 à 10 ou afficher tous les éléments d''une liste. C''est comme dire "répète cette action jusqu''à ce que cette condition soit remplie".',
  'Loops allow you to repeat an action multiple times, like counting from 1 to 10 or displaying all items in a list. It''s like saying "repeat this action until this condition is met".',
  'الحلقات تسمح لك بتكرار إجراء عدة مرات، مثل العد من 1 إلى 10 أو عرض جميع عناصر القائمة. إنه مثل قول "كرر هذا الإجراء حتى يتم استيفاء هذه الحالة".',
  '1. for = boucle avec compteur (nombre de répétitions connu)\n2. while = boucle conditionnelle (répète tant que condition vraie)\n3. do-while = exécute au moins une fois, puis vérifie la condition\n4. break = sortir de la boucle immédiatement\n5. continue = passer à l''itération suivante',
  '1. for = loop with counter (known number of repetitions)\n2. while = conditional loop (repeats while condition is true)\n3. do-while = executes at least once, then checks condition\n4. break = exit loop immediately\n5. continue = skip to next iteration',
  '1. for = حلقة مع عداد (عدد التكرارات معروف)\n2. while = حلقة شرطية (تكرر طالما الشرط صحيح)\n3. do-while = تنفذ مرة واحدة على الأقل، ثم تتحقق من الشرط\n4. break = الخروج من الحلقة فورًا\n5. continue = الانتقال إلى التكرار التالي',
  'Une boucle est comme un escalier : vous montez une marche (une itération), puis la suivante, jusqu''à arriver en haut (condition remplie). La boucle for est comme compter les marches (1, 2, 3...), la boucle while est comme monter jusqu''à ce que vous soyez fatigué.',
  'A loop is like stairs: you climb one step (one iteration), then the next, until you reach the top (condition met). The for loop is like counting steps (1, 2, 3...), the while loop is like climbing until you are tired.',
  'الحلقة مثل الدرج: تصعد درجة واحدة (تكرار واحد)، ثم التالية، حتى تصل إلى الأعلى (تم استيفاء الشرط). حلقة for مثل عد الدرجات (1، 2، 3...)، حلقة while مثل الصعود حتى تتعب.',
  'Exemple Java :\n\n// Boucle for : compter de 1 à 5\nfor (int i = 1; i <= 5; i++) {\n    System.out.println("Numéro : " + i);\n}\n\n// Boucle while : répéter tant que condition vraie\nint compteur = 0;\nwhile (compteur < 5) {\n    System.out.println("Compteur : " + compteur);\n    compteur++;\n}\n\n// Résultat : affiche 0, 1, 2, 3, 4',
  'Java example:\n\n// For loop: count from 1 to 5\nfor (int i = 1; i <= 5; i++) {\n    System.out.println("Number: " + i);\n}\n\n// While loop: repeat while condition is true\nint counter = 0;\nwhile (counter < 5) {\n    System.out.println("Counter: " + counter);\n    counter++;\n}\n\n// Output: displays 0, 1, 2, 3, 4',
  'مثال Java:\n\n// حلقة for: العد من 1 إلى 5\nfor (int i = 1; i <= 5; i++) {\n    System.out.println("الرقم: " + i);\n}\n\n// حلقة while: التكرار طالما الشرط صحيح\nint compteur = 0;\nwhile (compteur < 5) {\n    System.out.println("العداد: " + compteur);\n    compteur++;\n}\n\n// النتيجة: يعرض 0، 1، 2، 3، 4',
  4, 35, NOW(), NOW()
);

-- Exercice 1.4
INSERT INTO exercises (course_id, lesson_id, title_fr, title_en, title_ar,
                      description_fr, description_en, description_ar,
                      solution_fr, solution_en, solution_ar,
                      type, order_index, difficulty, created_at, updated_at)
VALUES (
  1, (SELECT id FROM lessons WHERE course_id = 1 AND order_index = 4),
  'Exercice : Table de multiplication',
  'Exercise: Multiplication Table',
  'تمرين: جدول الضرب',
  'Créez un programme qui affiche la table de multiplication de 7 (de 1 à 10) en utilisant une boucle for. Le résultat doit être :\n7 x 1 = 7\n7 x 2 = 14\n...\n7 x 10 = 70',
  'Create a program that displays the multiplication table of 7 (from 1 to 10) using a for loop. The output should be:\n7 x 1 = 7\n7 x 2 = 14\n...\n7 x 10 = 70',
  'أنشئ برنامجًا يعرض جدول ضرب 7 (من 1 إلى 10) باستخدام حلقة for. النتيجة يجب أن تكون:\n7 x 1 = 7\n7 x 2 = 14\n...\n7 x 10 = 70',
  'Solution Java :\n\nint nombre = 7;\n\nfor (int i = 1; i <= 10; i++) {\n    int resultat = nombre * i;\n    System.out.println(nombre + " x " + i + " = " + resultat);\n}',
  'Java Solution:\n\nint number = 7;\n\nfor (int i = 1; i <= 10; i++) {\n    int result = number * i;\n    System.out.println(number + " x " + i + " = " + result);\n}',
  'حل Java:\n\nint nombre = 7;\n\nfor (int i = 1; i <= 10; i++) {\n    int resultat = nombre * i;\n    System.out.println(nombre + " x " + i + " = " + resultat);\n}',
  'CODING', 4, 2, NOW(), NOW()
);

-- QCM pour leçon 1.4
INSERT INTO quiz_questions (exercise_id, question_fr, question_en, question_ar,
                           correct_answer_index, explanation_fr, explanation_en, explanation_ar)
VALUES 
(
  (SELECT id FROM exercises WHERE course_id = 1 AND lesson_id = (SELECT id FROM lessons WHERE course_id = 1 AND order_index = 4) AND order_index = 4),
  'Quelle boucle est la plus adaptée quand vous connaissez le nombre exact de répétitions ?',
  'Which loop is most suitable when you know the exact number of repetitions?',
  'أي حلقة هي الأنسب عندما تعرف العدد الدقيق للتكرارات؟',
  0,
  'La boucle for est idéale quand vous connaissez le nombre exact de répétitions, car elle a un compteur intégré (initialisation, condition, incrément).',
  'The for loop is ideal when you know the exact number of repetitions, because it has a built-in counter (initialization, condition, increment).',
  'حلقة for مثالية عندما تعرف العدد الدقيق للتكرارات، لأنها تحتوي على عداد مدمج (التهيئة، الشرط، الزيادة).'
),
(
  (SELECT id FROM exercises WHERE course_id = 1 AND lesson_id = (SELECT id FROM lessons WHERE course_id = 1 AND order_index = 4) AND order_index = 4),
  'Que fait l''instruction break dans une boucle ?',
  'What does the break instruction do in a loop?',
  'ماذا تفعل تعليمة break في حلقة؟',
  2,
  'L''instruction break sort immédiatement de la boucle, même si la condition de la boucle est encore vraie. C''est utile pour arrêter la boucle prématurément.',
  'The break instruction immediately exits the loop, even if the loop condition is still true. It is useful for stopping the loop prematurely.',
  'تعليمة break تخرج فورًا من الحلقة، حتى لو كان شرط الحلقة لا يزال صحيحًا. إنه مفيد لإيقاف الحلقة قبل الأوان.'
);

-- Leçon 1.5: Git et GitHub
INSERT INTO lessons (course_id, title_fr, title_en, title_ar, content_fr, content_en, content_ar,
                     key_points_fr, key_points_en, key_points_ar,
                     analogies_fr, analogies_en, analogies_ar,
                     examples_fr, examples_en, examples_ar,
                     order_index, estimated_duration, created_at, updated_at)
VALUES (
  1,
  'Git et GitHub : Gérer vos versions de code',
  'Git and GitHub: Managing Your Code Versions',
  'Git و GitHub: إدارة إصدارات الكود',
  'Git est comme un système de sauvegarde intelligent pour votre code. Chaque fois que vous faites une modification importante, vous créez un "commit" (une sauvegarde avec un message). Si vous faites une erreur, vous pouvez revenir en arrière. GitHub est comme un cloud pour votre code : vous pouvez sauvegarder votre code en ligne et collaborer avec d''autres développeurs.',
  'Git is like an intelligent backup system for your code. Every time you make an important change, you create a "commit" (a backup with a message). If you make a mistake, you can go back. GitHub is like a cloud for your code: you can back up your code online and collaborate with other developers.',
  'Git مثل نظام نسخ احتياطي ذكي لكودك. في كل مرة تقوم بتعديل مهم، تنشئ "commit" (نسخة احتياطية مع رسالة). إذا أخطأت، يمكنك العودة للخلف. GitHub مثل سحابة لكودك: يمكنك نسخ كودك احتياطيًا عبر الإنترنت والتعاون مع مطورين آخرين.',
  '1. git init = initialiser un dépôt Git dans un dossier\n2. git add = ajouter des fichiers à l''index (staging)\n3. git commit = sauvegarder les modifications avec un message\n4. git push = envoyer vos commits vers GitHub\n5. git pull = récupérer les modifications depuis GitHub\n6. git clone = copier un dépôt depuis GitHub',
  '1. git init = initialize a Git repository in a folder\n2. git add = add files to the index (staging)\n3. git commit = save changes with a message\n4. git push = send your commits to GitHub\n5. git pull = retrieve changes from GitHub\n6. git clone = copy a repository from GitHub',
  '1. git init = تهيئة مستودع Git في مجلد\n2. git add = إضافة ملفات إلى الفهرس (staging)\n3. git commit = حفظ التغييرات مع رسالة\n4. git push = إرسال الـ commits إلى GitHub\n5. git pull = جلب التغييرات من GitHub\n6. git clone = نسخ مستودع من GitHub',
  'Git est comme un système de versions de document Word : vous avez le document actuel, mais vous gardez aussi toutes les versions précédentes. Si vous voulez revenir à la version d''hier, vous pouvez. GitHub est comme Google Drive pour développeurs : vous stockez votre code en ligne et pouvez le partager.',
  'Git is like a Word document versioning system: you have the current document, but you also keep all previous versions. If you want to go back to yesterday''s version, you can. GitHub is like Google Drive for developers: you store your code online and can share it.',
  'Git مثل نظام إصدارات مستند Word: لديك المستند الحالي، لكنك تحتفظ أيضًا بجميع الإصدارات السابقة. إذا أردت العودة إلى إصدار الأمس، يمكنك. GitHub مثل Google Drive للمطورين: تخزن كودك عبر الإنترنت ويمكنك مشاركته.',
  'Commandes Git essentielles :\n\n# Initialiser un dépôt\ngit init\n\n# Ajouter tous les fichiers\ngit add .\n\n# Créer un commit\ngit commit -m "Premier commit : ajout du projet"\n\n# Lier à GitHub\ngit remote add origin https://github.com/user/repo.git\n\n# Envoyer vers GitHub\ngit push -u origin main',
  'Essential Git commands:\n\n# Initialize a repository\ngit init\n\n# Add all files\ngit add .\n\n# Create a commit\ngit commit -m "First commit: add project"\n\n# Link to GitHub\ngit remote add origin https://github.com/user/repo.git\n\n# Push to GitHub\ngit push -u origin main',
  'أوامر Git الأساسية:\n\n# تهيئة مستودع\ngit init\n\n# إضافة جميع الملفات\ngit add .\n\n# إنشاء commit\ngit commit -m "أول commit: إضافة المشروع"\n\n# ربط بـ GitHub\ngit remote add origin https://github.com/user/repo.git\n\n# إرسال إلى GitHub\ngit push -u origin main',
  5, 40, NOW(), NOW()
); ON CONFLICT (course_id, order_index) DO NOTHING;

-- Exercice 1.5
INSERT INTO exercises (course_id, lesson_id, title_fr, title_en, title_ar,
                      description_fr, description_en, description_ar,
                      solution_fr, solution_en, solution_ar,
                      type, order_index, difficulty, created_at, updated_at)
VALUES (
  1, (SELECT id FROM lessons WHERE course_id = 1 AND order_index = 5),
  'Exercice : Créer votre premier dépôt Git',
  'Exercise: Create Your First Git Repository',
  'تمرين: إنشاء مستودع Git الأول',
  'Créez un nouveau dossier "mon-premier-projet", initialisez un dépôt Git, créez un fichier README.md avec votre nom, ajoutez-le, faites un commit avec le message "Initial commit", puis créez un dépôt sur GitHub et poussez votre code.',
  'Create a new folder "my-first-project", initialize a Git repository, create a README.md file with your name, add it, make a commit with the message "Initial commit", then create a repository on GitHub and push your code.',
  'أنشئ مجلدًا جديدًا "mon-premier-projet"، ابدأ مستودع Git، أنشئ ملف README.md باسمك، أضفه، قم بعمل commit برسالة "Initial commit"، ثم أنشئ مستودعًا على GitHub وادفع كودك.',
  'Solution :\n\n# 1. Créer le dossier et entrer dedans\nmkdir mon-premier-projet\ncd mon-premier-projet\n\n# 2. Initialiser Git\ngit init\n\n# 3. Créer README.md\necho "# Mon Premier Projet" > README.md\necho "Par Ahmed" >> README.md\n\n# 4. Ajouter et commiter\ngit add README.md\ngit commit -m "Initial commit"\n\n# 5. Sur GitHub : créer un nouveau dépôt, puis :\ngit remote add origin https://github.com/votre-username/mon-premier-projet.git\ngit branch -M main\ngit push -u origin main',
  'Solution:\n\n# 1. Create folder and enter it\nmkdir my-first-project\ncd my-first-project\n\n# 2. Initialize Git\ngit init\n\n# 3. Create README.md\necho "# My First Project" > README.md\necho "By Ahmed" >> README.md\n\n# 4. Add and commit\ngit add README.md\ngit commit -m "Initial commit"\n\n# 5. On GitHub: create a new repository, then:\ngit remote add origin https://github.com/your-username/my-first-project.git\ngit branch -M main\ngit push -u origin main',
  'الحل:\n\n# 1. إنشاء المجلد والدخول إليه\nmkdir mon-premier-projet\ncd mon-premier-projet\n\n# 2. تهيئة Git\ngit init\n\n# 3. إنشاء README.md\necho "# مشروعي الأول" > README.md\necho "بواسطة أحمد" >> README.md\n\n# 4. إضافة و commit\ngit add README.md\ngit commit -m "Initial commit"\n\n# 5. على GitHub: أنشئ مستودعًا جديدًا، ثم:\ngit remote add origin https://github.com/votre-username/mon-premier-projet.git\ngit branch -M main\ngit push -u origin main',
  'CODING', 5, 3, NOW(), NOW()
);

-- QCM pour leçon 1.5
INSERT INTO quiz_questions (exercise_id, question_fr, question_en, question_ar,
                           correct_answer_index, explanation_fr, explanation_en, explanation_ar)
VALUES 
(
  (SELECT id FROM exercises WHERE course_id = 1 AND lesson_id = (SELECT id FROM lessons WHERE course_id = 1 AND order_index = 5) AND order_index = 5),
  'Quelle commande Git permet de sauvegarder vos modifications avec un message ?',
  'Which Git command allows you to save your changes with a message?',
  'أي أمر Git يسمح لك بحفظ تغييراتك مع رسالة؟',
  1,
  'git commit -m "message" permet de créer un commit (une sauvegarde) avec un message descriptif. C''est comme prendre une photo de l''état actuel de votre code avec une note expliquant ce qui a changé.',
  'git commit -m "message" allows you to create a commit (a backup) with a descriptive message. It''s like taking a snapshot of the current state of your code with a note explaining what changed.',
  'git commit -m "message" يسمح لك بإنشاء commit (نسخة احتياطية) مع رسالة وصفية. إنه مثل التقاط صورة للحالة الحالية لكودك مع ملاحظة تشرح ما تغير.'
),
(
  (SELECT id FROM exercises WHERE course_id = 1 AND lesson_id = (SELECT id FROM lessons WHERE course_id = 1 AND order_index = 5) AND order_index = 5),
  'Quelle est la différence entre git add et git commit ?',
  'What is the difference between git add and git commit?',
  'ما الفرق بين git add و git commit؟',
  2,
  'git add prépare les fichiers pour être sauvegardés (staging area), tandis que git commit crée réellement la sauvegarde avec un message. C''est comme mettre des objets dans un panier (add) puis payer à la caisse (commit).',
  'git add prepares files to be saved (staging area), while git commit actually creates the backup with a message. It''s like putting items in a shopping cart (add) then paying at checkout (commit).',
  'git add يعد الملفات ليتم حفظها (staging area)، بينما git commit ينشئ فعليًا النسخة الاحتياطية مع رسالة. إنه مثل وضع أشياء في سلة التسوق (add) ثم الدفع عند الخروج (commit).'
);

-- PROJET FINAL COURS 1: Calculatrice simple
INSERT INTO exercises (course_id, lesson_id, title_fr, title_en, title_ar,
                      description_fr, description_en, description_ar,
                      solution_fr, solution_en, solution_ar,
                      type, order_index, difficulty, created_at, updated_at)
VALUES (
  1, NULL,
  'PROJET FINAL : Calculatrice en ligne de commande',
  'FINAL PROJECT: Command Line Calculator',
  'المشروع النهائي: آلة حاسبة في سطر الأوامر',
  'Créez une calculatrice complète en Java qui :\n1. Affiche un menu avec les opérations (+, -, *, /)\n2. Demande à l''utilisateur de choisir une opération\n3. Demande deux nombres\n4. Effectue le calcul et affiche le résultat\n5. Propose de faire un autre calcul ou de quitter\n\nUtilisez : variables, conditions (if/else), boucles (while), et méthodes.',
  'Create a complete calculator in Java that:\n1. Displays a menu with operations (+, -, *, /)\n2. Asks the user to choose an operation\n3. Asks for two numbers\n4. Performs the calculation and displays the result\n5. Offers to do another calculation or exit\n\nUse: variables, conditions (if/else), loops (while), and methods.',
  'أنشئ آلة حاسبة كاملة في Java تقوم بـ:\n1. عرض قائمة بالعمليات (+, -, *, /)\n2. طلب اختيار عملية من المستخدم\n3. طلب رقمين\n4. تنفيذ الحساب وعرض النتيجة\n5. اقتراح إجراء حساب آخر أو الخروج\n\nاستخدم: متغيرات، شروط (if/else)، حلقات (while)، وطرق.',
  'Solution complète :\n\nimport java.util.Scanner;\n\npublic class Calculatrice {\n    public static void main(String[] args) {\n        Scanner scanner = new Scanner(System.in);\n        boolean continuer = true;\n        \n        while (continuer) {\n            // Afficher le menu\n            System.out.println("=== CALCULATRICE ===");\n            System.out.println("1. Addition (+)");\n            System.out.println("2. Soustraction (-)");\n            System.out.println("3. Multiplication (*)");\n            System.out.println("4. Division (/)");\n            System.out.println("5. Quitter");\n            System.out.print("Choix : ");\n            \n            int choix = scanner.nextInt();\n            \n            if (choix == 5) {\n                continuer = false;\n                System.out.println("Au revoir !");\n            } else if (choix >= 1 && choix <= 4) {\n                System.out.print("Premier nombre : ");\n                double a = scanner.nextDouble();\n                System.out.print("Deuxième nombre : ");\n                double b = scanner.nextDouble();\n                \n                double resultat = 0;\n                String operation = "";\n                \n                switch (choix) {\n                    case 1:\n                        resultat = a + b;\n                        operation = "+";\n                        break;\n                    case 2:\n                        resultat = a - b;\n                        operation = "-";\n                        break;\n                    case 3:\n                        resultat = a * b;\n                        operation = "*";\n                        break;\n                    case 4:\n                        if (b != 0) {\n                            resultat = a / b;\n                            operation = "/";\n                        } else {\n                            System.out.println("Erreur : division par zéro !");\n                            continue;\n                        }\n                        break;\n                }\n                \n                System.out.println(a + " " + operation + " " + b + " = " + resultat);\n            } else {\n                System.out.println("Choix invalide !");\n            }\n        }\n        \n        scanner.close();\n    }\n}',
  'Complete solution:\n\nimport java.util.Scanner;\n\npublic class Calculator {\n    public static void main(String[] args) {\n        Scanner scanner = new Scanner(System.in);\n        boolean continue = true;\n        \n        while (continue) {\n            // Display menu\n            System.out.println("=== CALCULATOR ===");\n            System.out.println("1. Addition (+)");\n            System.out.println("2. Subtraction (-)");\n            System.out.println("3. Multiplication (*)");\n            System.out.println("4. Division (/)");\n            System.out.println("5. Exit");\n            System.out.print("Choice: ");\n            \n            int choice = scanner.nextInt();\n            \n            if (choice == 5) {\n                continue = false;\n                System.out.println("Goodbye!");\n            } else if (choice >= 1 && choice <= 4) {\n                System.out.print("First number: ");\n                double a = scanner.nextDouble();\n                System.out.print("Second number: ");\n                double b = scanner.nextDouble();\n                \n                double result = 0;\n                String operation = "";\n                \n                switch (choice) {\n                    case 1:\n                        result = a + b;\n                        operation = "+";\n                        break;\n                    case 2:\n                        result = a - b;\n                        operation = "-";\n                        break;\n                    case 3:\n                        result = a * b;\n                        operation = "*";\n                        break;\n                    case 4:\n                        if (b != 0) {\n                            result = a / b;\n                            operation = "/";\n                        } else {\n                            System.out.println("Error: division by zero!");\n                            continue;\n                        }\n                        break;\n                }\n                \n                System.out.println(a + " " + operation + " " + b + " = " + result);\n            } else {\n                System.out.println("Invalid choice!");\n            }\n        }\n        \n        scanner.close();\n    }\n}',
  'الحل الكامل:\n\nimport java.util.Scanner;\n\npublic class Calculatrice {\n    public static void main(String[] args) {\n        Scanner scanner = new Scanner(System.in);\n        boolean continuer = true;\n        \n        while (continuer) {\n            // عرض القائمة\n            System.out.println("=== آلة حاسبة ===");\n            System.out.println("1. جمع (+)");\n            System.out.println("2. طرح (-)");\n            System.out.println("3. ضرب (*)");\n            System.out.println("4. قسمة (/)");\n            System.out.println("5. خروج");\n            System.out.print("الاختيار: ");\n            \n            int choix = scanner.nextInt();\n            \n            if (choix == 5) {\n                continuer = false;\n                System.out.println("وداعًا!");\n            } else if (choix >= 1 && choix <= 4) {\n                System.out.print("الرقم الأول: ");\n                double a = scanner.nextDouble();\n                System.out.print("الرقم الثاني: ");\n                double b = scanner.nextDouble();\n                \n                double resultat = 0;\n                String operation = "";\n                \n                switch (choix) {\n                    case 1:\n                        resultat = a + b;\n                        operation = "+";\n                        break;\n                    case 2:\n                        resultat = a - b;\n                        operation = "-";\n                        break;\n                    case 3:\n                        resultat = a * b;\n                        operation = "*";\n                        break;\n                    case 4:\n                        if (b != 0) {\n                            resultat = a / b;\n                            operation = "/";\n                        } else {\n                            System.out.println("خطأ: القسمة على صفر!");\n                            continue;\n                        }\n                        break;\n                }\n                \n                System.out.println(a + " " + operation + " " + b + " = " + resultat);\n            } else {\n                System.out.println("اختيار غير صحيح!");\n            }\n        }\n        \n        scanner.close();\n    }\n}',
  'PROJECT', 10, 4, NOW(), NOW()
);

-- Continuation avec les autres cours...
-- Pour gagner de l'espace, je vais créer un fichier séparé pour les cours restants
