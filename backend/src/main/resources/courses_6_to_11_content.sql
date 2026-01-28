-- ============================================
-- CONTENU PÉDAGOGIQUE COURS 6-11
-- Leçons, Exercices, QCM et Projets Finaux
-- ============================================

-- ============================================
-- COURS 6: Docker et Containerisation
-- ============================================

-- Leçon 6.1: Introduction à Docker
INSERT INTO lessons (course_id, title_fr, title_en, title_ar, content_fr, content_en, content_ar,
                     key_points_fr, key_points_en, key_points_ar,
                     analogies_fr, analogies_en, analogies_ar,
                     examples_fr, examples_en, examples_ar,
                     order_index, estimated_duration, created_at, updated_at)
VALUES (
  6,
  'Introduction à Docker : Containerisation',
  'Introduction to Docker: Containerization',
  'مقدمة إلى Docker: الحاويات',
  'Docker est comme un système de boîtes standardisées pour transporter vos applications : au lieu d''emballer différemment selon le transporteur (Windows, Linux, Mac), vous mettez votre application dans une boîte Docker (conteneur) qui fonctionne partout de la même manière. Une image Docker est comme un moule : vous créez le moule une fois, puis vous créez autant de conteneurs (objets) que vous voulez.',
  'Docker is like a standardized box system for shipping your applications: instead of packaging differently depending on the carrier (Windows, Linux, Mac), you put your application in a Docker box (container) that works the same way everywhere. A Docker image is like a mold: you create the mold once, then you create as many containers (objects) as you want.',
  'Docker مثل نظام صناديق موحدة لشحن تطبيقاتك: بدلاً من التعبئة بشكل مختلف حسب الناقل (Windows، Linux، Mac)، تضع تطبيقك في صندوق Docker (حاوية) يعمل بنفس الطريقة في كل مكان. صورة Docker مثل قالب: تنشئ القالب مرة واحدة، ثم تنشئ أكبر عدد تريده من الحاويات (كائنات).',
  '1. Conteneur = environnement isolé qui contient l''application\n2. Image = modèle/plan pour créer des conteneurs\n3. Dockerfile = instructions pour construire une image\n4. docker build = créer une image\n5. docker run = lancer un conteneur\n6. docker-compose = orchestrer plusieurs conteneurs',
  '1. Container = isolated environment containing the application\n2. Image = template/plan to create containers\n3. Dockerfile = instructions to build an image\n4. docker build = create an image\n5. docker run = run a container\n6. docker-compose = orchestrate multiple containers',
  '1. الحاوية = بيئة معزولة تحتوي على التطبيق\n2. الصورة = قالب/خطة لإنشاء حاويات\n3. Dockerfile = تعليمات لبناء صورة\n4. docker build = إنشاء صورة\n5. docker run = تشغيل حاوية\n6. docker-compose = تنظيم عدة حاويات',
  'Docker est comme un système de livraison de repas : le restaurant (vous) prépare le plat (application) dans un conteneur standardisé (image Docker). Peu importe où le client habite (Windows, Linux, Mac), le plat arrive intact et prêt à être consommé (exécuté).',
  'Docker is like a meal delivery system: the restaurant (you) prepares the dish (application) in a standardized container (Docker image). No matter where the customer lives (Windows, Linux, Mac), the dish arrives intact and ready to be consumed (executed).',
  'Docker مثل نظام توصيل وجبات: المطعم (أنت) يعد الطبق (التطبيق) في حاوية موحدة (صورة Docker). بغض النظر عن مكان سكن العميل (Windows، Linux، Mac)، الطبق يصل سليمًا وجاهزًا للاستهلاك (التنفيذ).',
  'Commandes Docker essentielles :\n\ndocker build -t mon-app .          # Construire une image\ndocker run -d -p 8080:8080 mon-app  # Lancer un conteneur\ndocker ps                            # Lister les conteneurs actifs\ndocker stop <id>                     # Arrêter un conteneur\ndocker logs <id>                     # Voir les logs\ndocker exec -it <id> /bin/bash       # Entrer dans le conteneur',
  'Essential Docker commands:\n\ndocker build -t my-app .          # Build an image\ndocker run -d -p 8080:8080 my-app  # Run a container\ndocker ps                            # List active containers\ndocker stop <id>                     # Stop a container\ndocker logs <id>                     # View logs\ndocker exec -it <id> /bin/bash       # Enter container',
  'أوامر Docker الأساسية:\n\ndocker build -t mon-app .          # بناء صورة\ndocker run -d -p 8080:8080 mon-app  # تشغيل حاوية\ndocker ps                            # قائمة الحاويات النشطة\ndocker stop <id>                     # إيقاف حاوية\ndocker logs <id>                     # عرض السجلات\ndocker exec -it <id> /bin/bash       # الدخول إلى الحاوية',
  1, 40, NOW(), NOW()
); ON CONFLICT (course_id, order_index) DO NOTHING;

-- Exercice 6.1
INSERT INTO exercises (course_id, lesson_id, title_fr, title_en, title_ar,
                      description_fr, description_en, description_ar,
                      solution_fr, solution_en, solution_ar,
                      type, order_index, difficulty, created_at, updated_at)
VALUES (
  6, (SELECT id FROM lessons WHERE course_id = 6 AND order_index = 1),
  'Exercice : Créer votre premier conteneur Docker',
  'Exercise: Create Your First Docker Container',
  'تمرين: إنشاء حاوية Docker الأولى',
  'Créez un conteneur Docker qui :\n1. Utilise l''image nginx:alpine\n2. Expose le port 80 du conteneur sur le port 8080 de l''hôte\n3. S''exécute en arrière-plan (-d)\n4. Affichez les logs du conteneur\n5. Arrêtez le conteneur',
  'Create a Docker container that:\n1. Uses the nginx:alpine image\n2. Exposes container port 80 on host port 8080\n3. Runs in background (-d)\n4. Display container logs\n5. Stop the container',
  'أنشئ حاوية Docker التي:\n1. تستخدم صورة nginx:alpine\n2. تعرض منفذ 80 للحاوية على منفذ 8080 للخادم\n3. تعمل في الخلفية (-d)\n4. اعرض سجلات الحاوية\n5. أوقف الحاوية',
  'Solution :\n\n# Lancer le conteneur\ndocker run -d -p 8080:80 --name mon-nginx nginx:alpine\n\n# Voir les logs\ndocker logs mon-nginx\n\n# Lister les conteneurs\ndocker ps\n\n# Arrêter le conteneur\ndocker stop mon-nginx\n\n# Supprimer le conteneur\ndocker rm mon-nginx',
  'Solution:\n\n# Run container\ndocker run -d -p 8080:80 --name my-nginx nginx:alpine\n\n# View logs\ndocker logs my-nginx\n\n# List containers\ndocker ps\n\n# Stop container\ndocker stop my-nginx\n\n# Remove container\ndocker rm my-nginx',
  'الحل:\n\n# تشغيل الحاوية\ndocker run -d -p 8080:80 --name mon-nginx nginx:alpine\n\n# عرض السجلات\ndocker logs mon-nginx\n\n# قائمة الحاويات\ndocker ps\n\n# إيقاف الحاوية\ndocker stop mon-nginx\n\n# حذف الحاوية\ndocker rm mon-nginx',
  'CODING', 1, 2, NOW(), NOW()
);

-- QCM pour leçon 6.1 (4 questions)
INSERT INTO quiz_questions (exercise_id, question_fr, question_en, question_ar,
                           correct_answer_index, explanation_fr, explanation_en, explanation_ar)
VALUES 
(
  (SELECT id FROM exercises WHERE course_id = 6 AND lesson_id = (SELECT id FROM lessons WHERE course_id = 6 AND order_index = 1) AND order_index = 1),
  'Quelle est la différence entre une image Docker et un conteneur ?',
  'What is the difference between a Docker image and a container?',
  'ما الفرق بين صورة Docker وحاوية؟',
  1,
  'Une image est un modèle statique (comme un plan), tandis qu''un conteneur est une instance en cours d''exécution de cette image (comme une maison construite à partir du plan). Vous pouvez créer plusieurs conteneurs à partir d''une seule image.',
  'An image is a static template (like a plan), while a container is a running instance of that image (like a house built from the plan). You can create multiple containers from a single image.',
  'الصورة هي قالب ثابت (مثل خطة)، بينما الحاوية هي مثيل يعمل من تلك الصورة (مثل منزل مبني من الخطة). يمكنك إنشاء عدة حاويات من صورة واحدة.'
),
(
  (SELECT id FROM exercises WHERE course_id = 6 AND lesson_id = (SELECT id FROM lessons WHERE course_id = 6 AND order_index = 1) AND order_index = 1),
  'Que fait l''option -p dans docker run ?',
  'What does the -p option do in docker run?',
  'ماذا تفعل الخيار -p في docker run؟',
  2,
  'L''option -p (port) mappe un port du conteneur vers un port de l''hôte. -p 8080:80 signifie que le port 80 du conteneur est accessible via le port 8080 de l''hôte.',
  'The -p (port) option maps a container port to a host port. -p 8080:80 means container port 80 is accessible via host port 8080.',
  'الخيار -p (port) يربط منفذ الحاوية بمنفذ الخادم. -p 8080:80 يعني أن منفذ 80 للحاوية يمكن الوصول إليه عبر منفذ 8080 للخادم.'
),
(
  (SELECT id FROM exercises WHERE course_id = 6 AND lesson_id = (SELECT id FROM lessons WHERE course_id = 6 AND order_index = 1) AND order_index = 1),
  'Quelle commande permet de voir les conteneurs en cours d''exécution ?',
  'Which command shows running containers?',
  'أي أمر يعرض الحاويات قيد التشغيل؟',
  0,
  'docker ps affiche tous les conteneurs en cours d''exécution. Pour voir tous les conteneurs (y compris arrêtés), utilisez docker ps -a.',
  'docker ps displays all running containers. To see all containers (including stopped), use docker ps -a.',
  'docker ps يعرض جميع الحاويات قيد التشغيل. لرؤية جميع الحاويات (بما في ذلك المتوقفة)، استخدم docker ps -a.'
),
(
  (SELECT id FROM exercises WHERE course_id = 6 AND lesson_id = (SELECT id FROM lessons WHERE course_id = 6 AND order_index = 1) AND order_index = 1),
  'Pourquoi utiliser Docker ?',
  'Why use Docker?',
  'لماذا نستخدم Docker؟',
  3,
  'Docker permet de : isoler les applications, garantir la même exécution sur tous les environnements, faciliter le déploiement, et améliorer la portabilité. "Ça fonctionne sur ma machine" n''est plus un problème !',
  'Docker allows: isolating applications, ensuring the same execution on all environments, facilitating deployment, and improving portability. "It works on my machine" is no longer a problem!',
  'Docker يسمح بـ: عزل التطبيقات، ضمان نفس التنفيذ على جميع البيئات، تسهيل النشر، وتحسين قابلية النقل. "يعمل على جهازي" لم يعد مشكلة!'
);

-- Leçon 6.2: Dockerfile
INSERT INTO lessons (course_id, title_fr, title_en, title_ar, content_fr, content_en, content_ar,
                     key_points_fr, key_points_en, key_points_ar,
                     analogies_fr, analogies_en, analogies_ar,
                     examples_fr, examples_en, examples_ar,
                     order_index, estimated_duration, created_at, updated_at)
VALUES (
  6,
  'Dockerfile : Créer vos propres images',
  'Dockerfile: Create Your Own Images',
  'Dockerfile: إنشاء صورك الخاصة',
  'Un Dockerfile est comme une recette de cuisine : vous listez les ingrédients (images de base), les étapes de préparation (commandes), et le résultat final (image Docker). Chaque ligne du Dockerfile est une instruction qui modifie l''image. Docker exécute ces instructions dans l''ordre pour construire votre image personnalisée.',
  'A Dockerfile is like a cooking recipe: you list the ingredients (base images), preparation steps (commands), and the final result (Docker image). Each line of the Dockerfile is an instruction that modifies the image. Docker executes these instructions in order to build your custom image.',
  'Dockerfile مثل وصفة طبخ: تسرد المكونات (الصور الأساسية)، خطوات التحضير (الأوامر)، والنتيجة النهائية (صورة Docker). كل سطر في Dockerfile هو تعليمة تعدل الصورة. Docker ينفذ هذه التعليمات بالترتيب لبناء صورتك المخصصة.',
  '1. FROM = image de base (ex: node:18, openjdk:17)\n2. WORKDIR = répertoire de travail\n3. COPY = copier des fichiers dans l''image\n4. RUN = exécuter une commande pendant la construction\n5. EXPOSE = documenter les ports utilisés\n6. CMD = commande par défaut au démarrage\n7. docker build -t nom:tag . = construire l''image',
  '1. FROM = base image (e.g., node:18, openjdk:17)\n2. WORKDIR = working directory\n3. COPY = copy files into image\n4. RUN = execute command during build\n5. EXPOSE = document used ports\n6. CMD = default command on startup\n7. docker build -t name:tag . = build image',
  '1. FROM = الصورة الأساسية (مثلاً: node:18، openjdk:17)\n2. WORKDIR = مجلد العمل\n3. COPY = نسخ ملفات إلى الصورة\n4. RUN = تنفيذ أمر أثناء البناء\n5. EXPOSE = توثيق المنافذ المستخدمة\n6. CMD = أمر افتراضي عند البدء\n7. docker build -t nom:tag . = بناء الصورة',
  2, 35, NOW(), NOW()
); ON CONFLICT (course_id, order_index) DO NOTHING;

-- Bloc de code pour leçon 6.2
INSERT INTO code_blocks (lesson_id, code, language, description_fr, description_en, description_ar, is_editable, is_runnable, order_index)
VALUES (
  (SELECT id FROM lessons WHERE course_id = 6 AND order_index = 2),
  '# Dockerfile pour application Spring Boot
FROM openjdk:17-jdk-slim AS build
WORKDIR /app

# Copier le fichier pom.xml et télécharger les dépendances
COPY pom.xml .
RUN mvn dependency:go-offline

# Copier le code source et compiler
COPY src ./src
RUN mvn clean package -DskipTests

# Image finale
FROM openjdk:17-jre-slim
WORKDIR /app
COPY --from=build /app/target/*.jar app.jar

EXPOSE 8080
CMD ["java", "-jar", "app.jar"]',
  'dockerfile',
  'Ce Dockerfile utilise un build multi-stage : d''abord compiler l''application, puis créer une image légère avec seulement le JAR. Cela réduit la taille de l''image finale.',
  'This Dockerfile uses multi-stage build: first compile the application, then create a light image with only the JAR. This reduces the final image size.',
  'هذا Dockerfile يستخدم بناء متعدد المراحل: أولاً تجميع التطبيق، ثم إنشاء صورة خفيفة مع JAR فقط. هذا يقلل حجم الصورة النهائية.',
  true,
  false,
  1
);

-- Exercice 6.2
INSERT INTO exercises (course_id, lesson_id, title_fr, title_en, title_ar,
                      description_fr, description_en, description_ar,
                      solution_fr, solution_en, solution_ar,
                      type, order_index, difficulty, created_at, updated_at)
VALUES (
  6, (SELECT id FROM lessons WHERE course_id = 6 AND order_index = 2),
  'Exercice : Créer un Dockerfile pour votre application',
  'Exercise: Create a Dockerfile for Your Application',
  'تمرين: إنشاء Dockerfile لتطبيقك',
  'Créez un Dockerfile pour containeriser votre application Spring Boot :\n1. Utilisez openjdk:17-jdk-slim comme image de base\n2. Copiez le pom.xml et installez les dépendances\n3. Copiez le code source et compilez\n4. Créez une image finale avec openjdk:17-jre-slim\n5. Exposez le port 8080\n6. Définissez la commande pour lancer l''application',
  'Create a Dockerfile to containerize your Spring Boot application:\n1. Use openjdk:17-jdk-slim as base image\n2. Copy pom.xml and install dependencies\n3. Copy source code and compile\n4. Create final image with openjdk:17-jre-slim\n5. Expose port 8080\n6. Define command to launch application',
  'أنشئ Dockerfile لتحويل تطبيق Spring Boot إلى حاوية:\n1. استخدم openjdk:17-jdk-slim كصورة أساسية\n2. انسخ pom.xml وثبت التبعيات\n3. انسخ كود المصدر واجمعه\n4. أنشئ صورة نهائية مع openjdk:17-jre-slim\n5. اعرض المنفذ 8080\n6. حدد الأمر لتشغيل التطبيق',
  'Solution : Voir le bloc de code ci-dessus. Commandes :\n\ndocker build -t institut-backend:latest .\ndocker run -d -p 8080:8080 institut-backend:latest',
  'Solution: See code block above. Commands:\n\ndocker build -t institut-backend:latest .\ndocker run -d -p 8080:8080 institut-backend:latest',
  'الحل: انظر كتلة الكود أعلاه. الأوامر:\n\ndocker build -t institut-backend:latest .\ndocker run -d -p 8080:8080 institut-backend:latest',
  'CODING', 2, 3, NOW(), NOW()
);

-- QCM pour leçon 6.2 (5 questions)
INSERT INTO quiz_questions (exercise_id, question_fr, question_en, question_ar,
                           correct_answer_index, explanation_fr, explanation_en, explanation_ar)
VALUES 
(
  (SELECT id FROM exercises WHERE course_id = 6 AND lesson_id = (SELECT id FROM lessons WHERE course_id = 6 AND order_index = 2) AND order_index = 2),
  'Quelle instruction Dockerfile définit l''image de base ?',
  'Which Dockerfile instruction defines the base image?',
  'أي تعليمة Dockerfile تحدد الصورة الأساسية؟',
  0,
  'FROM définit l''image de base à utiliser. C''est la première instruction d''un Dockerfile. Exemple : FROM node:18 utilise l''image Node.js version 18.',
  'FROM defines the base image to use. It is the first instruction in a Dockerfile. Example: FROM node:18 uses Node.js image version 18.',
  'FROM تحدد الصورة الأساسية للاستخدام. إنها أول تعليمة في Dockerfile. مثال: FROM node:18 تستخدم صورة Node.js الإصدار 18.'
),
(
  (SELECT id FROM exercises WHERE course_id = 6 AND lesson_id = (SELECT id FROM lessons WHERE course_id = 6 AND order_index = 2) AND order_index = 2),
  'Quelle est la différence entre COPY et ADD dans un Dockerfile ?',
  'What is the difference between COPY and ADD in a Dockerfile?',
  'ما الفرق بين COPY و ADD في Dockerfile؟',
  1,
  'COPY copie simplement des fichiers du contexte de build vers l''image. ADD fait la même chose mais peut aussi télécharger depuis une URL et décompresser des archives. COPY est généralement préféré pour sa simplicité.',
  'COPY simply copies files from build context to image. ADD does the same but can also download from URL and extract archives. COPY is generally preferred for simplicity.',
  'COPY تنسخ ببساطة الملفات من سياق البناء إلى الصورة. ADD تفعل نفس الشيء لكن يمكنها أيضًا التنزيل من URL وفك ضغط الأرشيفات. COPY مفضل عادة للبساطة.'
),
(
  (SELECT id FROM exercises WHERE course_id = 6 AND lesson_id = (SELECT id FROM lessons WHERE course_id = 6 AND order_index = 2) AND order_index = 2),
  'Quelle instruction définit la commande par défaut au démarrage du conteneur ?',
  'Which instruction defines the default command when container starts?',
  'أي تعليمة تحدد الأمر الافتراضي عند بدء الحاوية؟',
  2,
  'CMD définit la commande par défaut exécutée au démarrage du conteneur. Il peut y avoir une seule instruction CMD dans un Dockerfile. Exemple : CMD ["java", "-jar", "app.jar"].',
  'CMD defines the default command executed when the container starts. There can be only one CMD instruction in a Dockerfile. Example: CMD ["java", "-jar", "app.jar"].',
  'CMD تحدد الأمر الافتراضي المنفذ عند بدء الحاوية. يمكن أن تكون هناك تعليمة CMD واحدة فقط في Dockerfile. مثال: CMD ["java", "-jar", "app.jar"].'
),
(
  (SELECT id FROM exercises WHERE course_id = 6 AND lesson_id = (SELECT id FROM lessons WHERE course_id = 6 AND order_index = 2) AND order_index = 2),
  'Pourquoi utiliser un build multi-stage dans un Dockerfile ?',
  'Why use multi-stage build in a Dockerfile?',
  'لماذا نستخدم بناء متعدد المراحل في Dockerfile؟',
  3,
  'Un build multi-stage permet de créer une image finale plus légère en utilisant une image de base différente pour la compilation (plus lourde) et pour l''exécution (plus légère). Cela réduit la taille de l''image finale.',
  'Multi-stage build allows creating a lighter final image by using different base images for compilation (heavier) and execution (lighter). This reduces the final image size.',
  'البناء متعدد المراحل يسمح بإنشاء صورة نهائية أخف باستخدام صور أساسية مختلفة للتجميع (أثقل) والتنفيذ (أخف). هذا يقلل حجم الصورة النهائية.'
),
(
  (SELECT id FROM exercises WHERE course_id = 6 AND lesson_id = (SELECT id FROM lessons WHERE course_id = 6 AND order_index = 2) AND order_index = 2),
  'Que fait l''instruction EXPOSE dans un Dockerfile ?',
  'What does the EXPOSE instruction do in a Dockerfile?',
  'ماذا تفعل تعليمة EXPOSE في Dockerfile؟',
  1,
  'EXPOSE documente les ports que le conteneur écoute, mais ne les expose pas automatiquement. Vous devez toujours utiliser -p dans docker run pour mapper les ports. C''est une documentation pour les autres développeurs.',
  'EXPOSE documents the ports the container listens on, but does not automatically expose them. You must always use -p in docker run to map ports. It is documentation for other developers.',
  'EXPOSE توثق المنافذ التي تستمع إليها الحاوية، لكن لا تعرضها تلقائيًا. يجب عليك دائمًا استخدام -p في docker run لربط المنافذ. إنه توثيق للمطورين الآخرين.'
);

-- Leçon 6.3: Docker Compose
INSERT INTO lessons (course_id, title_fr, title_en, title_ar, content_fr, content_en, content_ar,
                     key_points_fr, key_points_en, key_points_ar,
                     analogies_fr, analogies_en, analogies_ar,
                     examples_fr, examples_en, examples_ar,
                     order_index, estimated_duration, created_at, updated_at)
VALUES (
  6,
  'Docker Compose : Orchestrer plusieurs conteneurs',
  'Docker Compose: Orchestrating Multiple Containers',
  'Docker Compose: تنظيم عدة حاويات',
  'Docker Compose est comme un chef d''orchestre : au lieu de lancer chaque instrument (conteneur) séparément, vous créez une partition (docker-compose.yml) qui définit tous les instruments et comment ils jouent ensemble. Un seul commande (docker-compose up) lance toute l''orchestre (tous les conteneurs) en harmonie.',
  'Docker Compose is like an orchestra conductor: instead of starting each instrument (container) separately, you create a score (docker-compose.yml) that defines all instruments and how they play together. A single command (docker-compose up) starts the entire orchestra (all containers) in harmony.',
  'Docker Compose مثل قائد أوركسترا: بدلاً من بدء كل آلة (حاوية) بشكل منفصل، تنشئ قسمًا موسيقيًا (docker-compose.yml) يحدد جميع الآلات وكيف تعزف معًا. أمر واحد (docker-compose up) يبدأ الأوركسترا بالكامل (جميع الحاويات) بتناغم.',
  '1. docker-compose.yml = fichier de configuration\n2. services = définition des conteneurs\n3. networks = réseaux pour connecter les conteneurs\n4. volumes = stockage persistant\n5. depends_on = ordre de démarrage\n6. docker-compose up = démarrer tous les services\n7. docker-compose down = arrêter tous les services',
  '1. docker-compose.yml = configuration file\n2. services = container definitions\n3. networks = networks to connect containers\n4. volumes = persistent storage\n5. depends_on = startup order\n6. docker-compose up = start all services\n7. docker-compose down = stop all services',
  '1. docker-compose.yml = ملف التكوين\n2. services = تعريفات الحاويات\n3. networks = شبكات لربط الحاويات\n4. volumes = تخزين دائم\n5. depends_on = ترتيب البدء\n6. docker-compose up = بدء جميع الخدمات\n7. docker-compose down = إيقاف جميع الخدمات',
  3, 30, NOW(), NOW()
); ON CONFLICT (course_id, order_index) DO NOTHING;

-- PROJET FINAL COURS 6: Containeriser l'application complète
INSERT INTO exercises (course_id, lesson_id, title_fr, title_en, title_ar,
                      description_fr, description_en, description_ar,
                      solution_fr, solution_en, solution_ar,
                      type, order_index, difficulty, created_at, updated_at)
VALUES (
  6, NULL,
  'PROJET FINAL : Application complète containerisée',
  'FINAL PROJECT: Fully Containerized Application',
  'المشروع النهائي: تطبيق كامل محتوى',
  'Containerisez l''application complète avec Docker Compose :\n1. Créez un Dockerfile pour le backend Spring Boot\n2. Créez un Dockerfile pour le frontend Angular\n3. Configurez PostgreSQL dans docker-compose.yml\n4. Configurez les réseaux et volumes\n5. Définissez les dépendances entre services\n6. Ajoutez Prometheus pour le monitoring\n7. Testez que tout fonctionne avec docker-compose up',
  'Containerize the complete application with Docker Compose:\n1. Create Dockerfile for Spring Boot backend\n2. Create Dockerfile for Angular frontend\n3. Configure PostgreSQL in docker-compose.yml\n4. Configure networks and volumes\n5. Define dependencies between services\n6. Add Prometheus for monitoring\n7. Test that everything works with docker-compose up',
  'احتوي التطبيق الكامل باستخدام Docker Compose:\n1. أنشئ Dockerfile لـ backend Spring Boot\n2. أنشئ Dockerfile لـ frontend Angular\n3. اضبط PostgreSQL في docker-compose.yml\n4. اضبط الشبكات والأحجام\n5. حدد التبعيات بين الخدمات\n6. أضف Prometheus للمراقبة\n7. اختبر أن كل شيء يعمل مع docker-compose up',
  'Solution : Voir le fichier docker-compose.yml à la racine du projet.\n\nStructure :\n- service postgres (base de données)\n- service backend (Spring Boot)\n- service frontend (Angular/Nginx)\n- service prometheus (monitoring)\n- network commun\n- volumes pour données persistantes',
  'Solution: See docker-compose.yml file at project root.\n\nStructure:\n- postgres service (database)\n- backend service (Spring Boot)\n- frontend service (Angular/Nginx)\n- prometheus service (monitoring)\n- common network\n- volumes for persistent data',
  'الحل: انظر ملف docker-compose.yml في جذر المشروع.\n\nالبنية:\n- خدمة postgres (قاعدة البيانات)\n- خدمة backend (Spring Boot)\n- خدمة frontend (Angular/Nginx)\n- خدمة prometheus (المراقبة)\n- شبكة مشتركة\n- أحجام للبيانات الدائمة',
  'PROJECT', 10, 4, NOW(), NOW()
);

-- ============================================
-- COURS 7: Kubernetes - CONTENU DE BASE
-- ============================================

-- Leçon 7.1: Concepts Kubernetes
INSERT INTO lessons (course_id, title_fr, title_en, title_ar, content_fr, content_en, content_ar,
                     key_points_fr, key_points_en, key_points_ar,
                     analogies_fr, analogies_en, analogies_ar,
                     examples_fr, examples_en, examples_ar,
                     order_index, estimated_duration, created_at, updated_at)
VALUES (
  7,
  'Kubernetes : Concepts de base',
  'Kubernetes: Basic Concepts',
  'Kubernetes: المفاهيم الأساسية',
  'Kubernetes est comme un gestionnaire d''hôtel : vous avez plusieurs chambres (nodes), des clients (pods) qui veulent des services, et Kubernetes s''assure que chaque client a une chambre, que les services sont disponibles, et que si une chambre a un problème, le client est déplacé automatiquement. C''est un orchestrateur qui gère vos conteneurs à grande échelle.',
  'Kubernetes is like a hotel manager: you have multiple rooms (nodes), guests (pods) who want services, and Kubernetes ensures each guest has a room, services are available, and if a room has a problem, the guest is automatically moved. It is an orchestrator that manages your containers at scale.',
  'Kubernetes مثل مدير فندق: لديك عدة غرف (nodes)، ضيوف (pods) يريدون خدمات، و Kubernetes يضمن أن كل ضيف لديه غرفة، الخدمات متاحة، وإذا كانت الغرفة بها مشكلة، الضيف يُنقل تلقائيًا. إنه منظم يدير حاوياتك على نطاق واسع.',
  '1. Cluster = groupe de machines (nodes)\n2. Node = machine dans le cluster\n3. Pod = plus petite unité (1 ou plusieurs conteneurs)\n4. Service = point d''accès stable aux pods\n5. Deployment = gestion des pods (création, mise à jour)\n6. Namespace = isolation logique\n7. kubectl = outil en ligne de commande',
  '1. Cluster = group of machines (nodes)\n2. Node = machine in cluster\n3. Pod = smallest unit (1 or multiple containers)\n4. Service = stable access point to pods\n5. Deployment = pod management (create, update)\n6. Namespace = logical isolation\n7. kubectl = command line tool',
  '1. العنقود = مجموعة من الآلات (nodes)\n2. Node = آلة في العنقود\n3. Pod = أصغر وحدة (1 أو عدة حاويات)\n4. Service = نقطة وصول مستقرة للـ pods\n5. Deployment = إدارة pods (إنشاء، تحديث)\n6. Namespace = عزل منطقي\n7. kubectl = أداة سطر الأوامر',
  1, 35, NOW(), NOW()
); ON CONFLICT (course_id, order_index) DO NOTHING;

-- Exercice 7.1
INSERT INTO exercises (course_id, lesson_id, title_fr, title_en, title_ar,
                      description_fr, description_en, description_ar,
                      solution_fr, solution_en, solution_ar,
                      type, order_index, difficulty, created_at, updated_at)
VALUES (
  7, (SELECT id FROM lessons WHERE course_id = 7 AND order_index = 1),
  'Exercice : Créer votre premier Pod',
  'Exercise: Create Your First Pod',
  'تمرين: إنشاء Pod الأول',
  'Créez un Pod Kubernetes qui :\n1. Utilise l''image nginx:alpine\n2. S''appelle "mon-nginx"\n3. Expose le port 80\n4. Créez-le avec kubectl\n5. Vérifiez son statut\n6. Supprimez-le',
  'Create a Kubernetes Pod that:\n1. Uses nginx:alpine image\n2. Is named "my-nginx"\n3. Exposes port 80\n4. Create it with kubectl\n5. Check its status\n6. Delete it',
  'أنشئ Pod Kubernetes الذي:\n1. يستخدم صورة nginx:alpine\n2. يُسمى "mon-nginx"\n3. يعرض المنفذ 80\n4. أنشئه بـ kubectl\n5. تحقق من حالته\n6. احذفه',
  'Solution :\n\n# Créer un Pod\necho ''apiVersion: v1\nkind: Pod\nmetadata:\n  name: mon-nginx\nspec:\n  containers:\n  - name: nginx\n    image: nginx:alpine\n    ports:\n    - containerPort: 80'' | kubectl apply -f -\n\n# Vérifier le statut\nkubectl get pods\nkubectl describe pod mon-nginx\n\n# Supprimer\nkubectl delete pod mon-nginx',
  'Solution:\n\n# Create Pod\necho ''apiVersion: v1\nkind: Pod\nmetadata:\n  name: my-nginx\nspec:\n  containers:\n  - name: nginx\n    image: nginx:alpine\n    ports:\n    - containerPort: 80'' | kubectl apply -f -\n\n# Check status\nkubectl get pods\nkubectl describe pod my-nginx\n\n# Delete\nkubectl delete pod my-nginx',
  'الحل:\n\n# إنشاء Pod\necho ''apiVersion: v1\nkind: Pod\nmetadata:\n  name: mon-nginx\nspec:\n  containers:\n  - name: nginx\n    image: nginx:alpine\n    ports:\n    - containerPort: 80'' | kubectl apply -f -\n\n# التحقق من الحالة\nkubectl get pods\nkubectl describe pod mon-nginx\n\n# حذف\nkubectl delete pod mon-nginx',
  'CODING', 1, 3, NOW(), NOW()
);

-- QCM pour leçon 7.1 (4 questions)
INSERT INTO quiz_questions (exercise_id, question_fr, question_en, question_ar,
                           correct_answer_index, explanation_fr, explanation_en, explanation_ar)
VALUES 
(
  (SELECT id FROM exercises WHERE course_id = 7 AND lesson_id = (SELECT id FROM lessons WHERE course_id = 7 AND order_index = 1) AND order_index = 1),
  'Qu''est-ce qu''un Pod dans Kubernetes ?',
  'What is a Pod in Kubernetes?',
  'ما هو Pod في Kubernetes؟',
  1,
  'Un Pod est la plus petite unité déployable dans Kubernetes. Il peut contenir un ou plusieurs conteneurs qui partagent les mêmes ressources réseau et de stockage. Les conteneurs dans un Pod sont toujours déployés ensemble.',
  'A Pod is the smallest deployable unit in Kubernetes. It can contain one or more containers that share the same network and storage resources. Containers in a Pod are always deployed together.',
  'Pod هو أصغر وحدة قابلة للنشر في Kubernetes. يمكن أن يحتوي على حاوية واحدة أو أكثر تتشارك نفس موارد الشبكة والتخزين. الحاويات في Pod تُنشر دائمًا معًا.'
),
(
  (SELECT id FROM exercises WHERE course_id = 7 AND lesson_id = (SELECT id FROM lessons WHERE course_id = 7 AND order_index = 1) AND order_index = 1),
  'Quel outil en ligne de commande est utilisé pour interagir avec Kubernetes ?',
  'Which command line tool is used to interact with Kubernetes?',
  'أي أداة سطر الأوامر تُستخدم للتفاعل مع Kubernetes؟',
  0,
  'kubectl est l''outil en ligne de commande officiel pour interagir avec un cluster Kubernetes. Il permet de créer, modifier, supprimer et inspecter les ressources Kubernetes.',
  'kubectl is the official command line tool for interacting with a Kubernetes cluster. It allows creating, modifying, deleting and inspecting Kubernetes resources.',
  'kubectl هي أداة سطر الأوامر الرسمية للتفاعل مع عنقود Kubernetes. تسمح بإنشاء وتعديل وحذف وفحص موارد Kubernetes.'
),
(
  (SELECT id FROM exercises WHERE course_id = 7 AND lesson_id = (SELECT id FROM lessons WHERE course_id = 7 AND order_index = 1) AND order_index = 1),
  'Qu''est-ce qu''un Namespace dans Kubernetes ?',
  'What is a Namespace in Kubernetes?',
  'ما هو Namespace في Kubernetes؟',
  2,
  'Un Namespace est une isolation logique dans un cluster Kubernetes. Il permet de séparer les ressources (pods, services, etc.) en groupes logiques, comme des dossiers dans un système de fichiers.',
  'A Namespace is logical isolation in a Kubernetes cluster. It allows separating resources (pods, services, etc.) into logical groups, like folders in a file system.',
  'Namespace هو عزل منطقي في عنقود Kubernetes. يسمح بفصل الموارد (pods، services، إلخ) إلى مجموعات منطقية، مثل المجلدات في نظام الملفات.'
),
(
  (SELECT id FROM exercises WHERE course_id = 7 AND lesson_id = (SELECT id FROM lessons WHERE course_id = 7 AND order_index = 1) AND order_index = 1),
  'Pourquoi utiliser Kubernetes plutôt que Docker seul ?',
  'Why use Kubernetes instead of Docker alone?',
  'لماذا نستخدم Kubernetes بدلاً من Docker وحده؟',
  3,
  'Kubernetes ajoute l''orchestration, le scaling automatique, la gestion de la haute disponibilité, le load balancing, et la gestion des mises à jour sans interruption. Docker seul gère les conteneurs, Kubernetes gère les conteneurs à grande échelle.',
  'Kubernetes adds orchestration, automatic scaling, high availability management, load balancing, and zero-downtime update management. Docker alone manages containers, Kubernetes manages containers at scale.',
  'Kubernetes يضيف التنظيم، التوسع التلقائي، إدارة التوفر العالي، موازنة الأحمال، وإدارة التحديثات بدون توقف. Docker وحده يدير الحاويات، Kubernetes يدير الحاويات على نطاق واسع.'
);

-- PROJET FINAL COURS 7: Déploiement sur Kubernetes
INSERT INTO exercises (course_id, lesson_id, title_fr, title_en, title_ar,
                      description_fr, description_en, description_ar,
                      solution_fr, solution_en, solution_ar,
                      type, order_index, difficulty, created_at, updated_at)
VALUES (
  7, NULL,
  'PROJET FINAL : Déployer l''application sur Kubernetes',
  'FINAL PROJECT: Deploy Application on Kubernetes',
  'المشروع النهائي: نشر التطبيق على Kubernetes',
  'Déployez l''application complète sur un cluster Kubernetes :\n1. Créez les manifests pour PostgreSQL (Deployment + Service)\n2. Créez les manifests pour le backend (Deployment + Service)\n3. Créez les manifests pour le frontend (Deployment + Service)\n4. Configurez les ConfigMaps et Secrets\n5. Créez un Ingress pour exposer l''application\n6. Testez le déploiement et le scaling',
  'Deploy the complete application on a Kubernetes cluster:\n1. Create manifests for PostgreSQL (Deployment + Service)\n2. Create manifests for backend (Deployment + Service)\n3. Create manifests for frontend (Deployment + Service)\n4. Configure ConfigMaps and Secrets\n5. Create an Ingress to expose the application\n6. Test deployment and scaling',
  'انشر التطبيق الكامل على عنقود Kubernetes:\n1. أنشئ الـ manifests لـ PostgreSQL (Deployment + Service)\n2. أنشئ الـ manifests للـ backend (Deployment + Service)\n3. أنشئ الـ manifests للـ frontend (Deployment + Service)\n4. اضبط ConfigMaps و Secrets\n5. أنشئ Ingress لعرض التطبيق\n6. اختبر النشر والتوسع',
  'Solution : Voir les fichiers dans le dossier k8s/ du projet.\n\nStructure :\n- namespace.yaml\n- postgres-deployment.yaml + postgres-service.yaml\n- backend-deployment.yaml + backend-service.yaml\n- frontend-deployment.yaml + frontend-service.yaml\n- secrets.yaml\n- configmaps.yaml\n- ingress.yaml\n\nCommandes :\nkubectl apply -f k8s/\nkubectl get pods -n institut',
  'Solution: See files in k8s/ folder of project.\n\nStructure:\n- namespace.yaml\n- postgres-deployment.yaml + postgres-service.yaml\n- backend-deployment.yaml + backend-service.yaml\n- frontend-deployment.yaml + frontend-service.yaml\n- secrets.yaml\n- configmaps.yaml\n- ingress.yaml\n\nCommands:\nkubectl apply -f k8s/\nkubectl get pods -n institut',
  'الحل: انظر الملفات في مجلد k8s/ للمشروع.\n\nالبنية:\n- namespace.yaml\n- postgres-deployment.yaml + postgres-service.yaml\n- backend-deployment.yaml + backend-service.yaml\n- frontend-deployment.yaml + frontend-service.yaml\n- secrets.yaml\n- configmaps.yaml\n- ingress.yaml\n\nالأوامر:\nkubectl apply -f k8s/\nkubectl get pods -n institut',
  'PROJECT', 10, 5, NOW(), NOW()
);

-- ============================================
-- COURS 8-11: CONTENU DE BASE
-- Note: Pour une implémentation complète, ajoutez 3-4 leçons supplémentaires
-- par cours avec exercices et QCM en suivant le même format
-- ============================================

-- COURS 8: AWS Cloud - Leçon 8.1
INSERT INTO lessons (course_id, title_fr, title_en, title_ar, content_fr, content_en, content_ar,
                     key_points_fr, key_points_en, key_points_ar,
                     analogies_fr, analogies_en, analogies_ar,
                     examples_fr, examples_en, examples_ar,
                     order_index, estimated_duration, created_at, updated_at)
VALUES (
  8,
  'Introduction à AWS : Services cloud essentiels',
  'Introduction to AWS: Essential Cloud Services',
  'مقدمة إلى AWS: خدمات السحابة الأساسية',
  'AWS est comme un centre de données géant que vous pouvez utiliser à distance : au lieu d''acheter et maintenir vos propres serveurs, vous louez des ressources dans le cloud d''Amazon. EC2 est comme louer un ordinateur, RDS est comme louer une base de données, S3 est comme louer un espace de stockage. Vous payez seulement ce que vous utilisez.',
  'AWS is like a giant data center you can use remotely: instead of buying and maintaining your own servers, you rent resources in Amazon''s cloud. EC2 is like renting a computer, RDS is like renting a database, S3 is like renting storage space. You only pay for what you use.',
  'AWS مثل مركز بيانات عملاق يمكنك استخدامه عن بُعد: بدلاً من شراء وصيانة خوادمك الخاصة، تستأجر موارد في سحابة Amazon. EC2 مثل استئجار كمبيوتر، RDS مثل استئجار قاعدة بيانات، S3 مثل استئجار مساحة تخزين. تدفع فقط لما تستخدمه.',
  '1. AWS = Amazon Web Services (plateforme cloud)\n2. EC2 = serveurs virtuels (instances)\n3. RDS = bases de données managées\n4. S3 = stockage d''objets\n5. EKS = Kubernetes managé\n6. IAM = gestion des accès et permissions\n7. Région = zone géographique des services',
  '1. AWS = Amazon Web Services (cloud platform)\n2. EC2 = virtual servers (instances)\n3. RDS = managed databases\n4. S3 = object storage\n5. EKS = managed Kubernetes\n6. IAM = access and permissions management\n7. Region = geographic zone of services',
  '1. AWS = خدمات ويب Amazon (منصة سحابية)\n2. EC2 = خوادم افتراضية (مثيلات)\n3. RDS = قواعد بيانات مُدارة\n4. S3 = تخزين كائنات\n5. EKS = Kubernetes مُدار\n6. IAM = إدارة الوصول والصلاحيات\n7. المنطقة = منطقة جغرافية للخدمات',
  1, 35, NOW(), NOW()
); ON CONFLICT (course_id, order_index) DO NOTHING;

-- PROJET FINAL COURS 8
INSERT INTO exercises (course_id, lesson_id, title_fr, title_en, title_ar,
                      description_fr, description_en, description_ar,
                      solution_fr, solution_en, solution_ar,
                      type, order_index, difficulty, created_at, updated_at)
VALUES (
  8, NULL,
  'PROJET FINAL : Déployer sur AWS',
  'FINAL PROJECT: Deploy on AWS',
  'المشروع النهائي: النشر على AWS',
  'Déployez l''application complète sur AWS :\n1. Créez un cluster EKS\n2. Configurez RDS PostgreSQL\n3. Déployez l''application sur EKS\n4. Configurez un Load Balancer\n5. Utilisez S3 pour les assets statiques\n6. Configurez IAM pour les permissions',
  'Deploy the complete application on AWS:\n1. Create an EKS cluster\n2. Configure RDS PostgreSQL\n3. Deploy application on EKS\n4. Configure a Load Balancer\n5. Use S3 for static assets\n6. Configure IAM for permissions',
  'انشر التطبيق الكامل على AWS:\n1. أنشئ عنقود EKS\n2. اضبط RDS PostgreSQL\n3. انشر التطبيق على EKS\n4. اضبط Load Balancer\n5. استخدم S3 للأصول الثابتة\n6. اضبط IAM للصلاحيات',
  'Solution : Utilisez Terraform (voir cours 9) ou la console AWS. Voir terraform/main.tf pour l''infrastructure complète.',
  'Solution: Use Terraform (see course 9) or AWS console. See terraform/main.tf for complete infrastructure.',
  'الحل: استخدم Terraform (انظر كورس 9) أو وحدة تحكم AWS. انظر terraform/main.tf للبنية التحتية الكاملة.',
  'PROJECT', 10, 5, NOW(), NOW()
);

-- COURS 9: Terraform - Leçon 9.1
INSERT INTO lessons (course_id, title_fr, title_en, title_ar, content_fr, content_en, content_ar,
                     key_points_fr, key_points_en, key_points_ar,
                     analogies_fr, analogies_en, analogies_ar,
                     examples_fr, examples_en, examples_ar,
                     order_index, estimated_duration, created_at, updated_at)
VALUES (
  9,
  'Terraform : Infrastructure as Code',
  'Terraform: Infrastructure as Code',
  'Terraform: البنية التحتية كرمز',
  'Terraform est comme un architecte qui écrit des plans détaillés : au lieu de construire manuellement votre infrastructure (cliquer dans la console AWS), vous écrivez un fichier de configuration (plan) et Terraform construit automatiquement tout ce qui est décrit. Si vous voulez changer quelque chose, vous modifiez le plan et Terraform applique les changements.',
  'Terraform is like an architect who writes detailed plans: instead of manually building your infrastructure (clicking in AWS console), you write a configuration file (plan) and Terraform automatically builds everything described. If you want to change something, you modify the plan and Terraform applies the changes.',
  'Terraform مثل مهندس معماري يكتب خططًا مفصلة: بدلاً من بناء البنية التحتية يدويًا (النقر في وحدة تحكم AWS)، تكتب ملف تكوين (خطة) و Terraform يبني تلقائيًا كل ما هو موصوف. إذا أردت تغيير شيء، تعدل الخطة و Terraform يطبق التغييرات.',
  '1. Infrastructure as Code = définir l''infra en fichiers\n2. HCL = HashiCorp Configuration Language\n3. provider = plugin pour un cloud (AWS, Azure, GCP)\n4. resource = composant infrastructure (EC2, RDS, etc.)\n5. terraform init = initialiser\n6. terraform plan = prévisualiser les changements\n7. terraform apply = créer l''infrastructure',
  '1. Infrastructure as Code = define infrastructure in files\n2. HCL = HashiCorp Configuration Language\n3. provider = plugin for a cloud (AWS, Azure, GCP)\n4. resource = infrastructure component (EC2, RDS, etc.)\n5. terraform init = initialize\n6. terraform plan = preview changes\n7. terraform apply = create infrastructure',
  '1. البنية التحتية كرمز = تعريف البنية التحتية في ملفات\n2. HCL = لغة تكوين HashiCorp\n3. provider = مكون إضافي لسحابة (AWS، Azure، GCP)\n4. resource = مكون بنية تحتية (EC2، RDS، إلخ)\n5. terraform init = تهيئة\n6. terraform plan = معاينة التغييرات\n7. terraform apply = إنشاء البنية التحتية',
  1, 40, NOW(), NOW()
); ON CONFLICT (course_id, order_index) DO NOTHING;

-- PROJET FINAL COURS 9
INSERT INTO exercises (course_id, lesson_id, title_fr, title_en, title_ar,
                      description_fr, description_en, description_ar,
                      solution_fr, solution_en, solution_ar,
                      type, order_index, difficulty, created_at, updated_at)
VALUES (
  9, NULL,
  'PROJET FINAL : Infrastructure complète avec Terraform',
  'FINAL PROJECT: Complete Infrastructure with Terraform',
  'المشروع النهائي: بنية تحتية كاملة مع Terraform',
  'Créez l''infrastructure AWS complète avec Terraform :\n1. VPC avec sous-réseaux publics et privés\n2. Cluster EKS\n3. Instance RDS PostgreSQL\n4. Security Groups\n5. IAM roles et policies\n6. Utilisez des variables et outputs\n7. Organisez en modules',
  'Create complete AWS infrastructure with Terraform:\n1. VPC with public and private subnets\n2. EKS cluster\n3. RDS PostgreSQL instance\n4. Security Groups\n5. IAM roles and policies\n6. Use variables and outputs\n7. Organize into modules',
  'أنشئ البنية التحتية AWS الكاملة مع Terraform:\n1. VPC مع شبكات فرعية عامة وخاصة\n2. عنقود EKS\n3. مثيل RDS PostgreSQL\n4. Security Groups\n5. أدوار وسياسات IAM\n6. استخدم المتغيرات والمخرجات\n7. نظم في modules',
  'Solution : Voir terraform/main.tf, variables.tf, outputs.tf dans le projet. L''infrastructure complète est déjà définie.',
  'Solution: See terraform/main.tf, variables.tf, outputs.tf in project. Complete infrastructure is already defined.',
  'الحل: انظر terraform/main.tf، variables.tf، outputs.tf في المشروع. البنية التحتية الكاملة محددة بالفعل.',
  'PROJECT', 10, 5, NOW(), NOW()
);

-- COURS 10: CI/CD - Leçon 10.1
INSERT INTO lessons (course_id, title_fr, title_en, title_ar, content_fr, content_en, content_ar,
                     key_points_fr, key_points_en, key_points_ar,
                     analogies_fr, analogies_en, analogies_ar,
                     examples_fr, examples_en, examples_ar,
                     order_index, estimated_duration, created_at, updated_at)
VALUES (
  10,
  'CI/CD : Intégration et déploiement continus',
  'CI/CD: Continuous Integration and Deployment',
  'CI/CD: التكامل والنشر المستمر',
  'CI/CD est comme une chaîne de production automatisée : chaque fois que vous poussez du code (push), la chaîne se déclenche automatiquement : elle teste votre code, le compile, crée une image Docker, et le déploie. C''est comme avoir un assistant qui fait tout le travail répétitif à votre place, garantissant que chaque déploiement est identique et fiable.',
  'CI/CD is like an automated production line: every time you push code, the line automatically triggers: it tests your code, compiles it, creates a Docker image, and deploys it. It''s like having an assistant who does all the repetitive work for you, ensuring each deployment is identical and reliable.',
  'CI/CD مثل خط إنتاج آلي: في كل مرة تدفع كودًا، الخط يبدأ تلقائيًا: يختبر كودك، يجمعه، ينشئ صورة Docker، وينشره. إنه مثل وجود مساعد يقوم بكل العمل المتكرر نيابة عنك، مما يضمن أن كل نشر متطابق وموثوق.',
  '1. CI = Continuous Integration (tests automatiques)\n2. CD = Continuous Deployment (déploiement automatique)\n3. Pipeline = série d''étapes automatisées\n4. GitHub Actions = service CI/CD intégré\n5. Workflow = fichier YAML définissant le pipeline\n6. Jobs = tâches parallèles\n7. Steps = étapes dans un job',
  '1. CI = Continuous Integration (automatic tests)\n2. CD = Continuous Deployment (automatic deployment)\n3. Pipeline = series of automated steps\n4. GitHub Actions = integrated CI/CD service\n5. Workflow = YAML file defining pipeline\n6. Jobs = parallel tasks\n7. Steps = steps in a job',
  '1. CI = التكامل المستمر (اختبارات تلقائية)\n2. CD = النشر المستمر (نشر تلقائي)\n3. Pipeline = سلسلة من الخطوات الآلية\n4. GitHub Actions = خدمة CI/CD مدمجة\n5. Workflow = ملف YAML يحدد الـ pipeline\n6. Jobs = مهام متوازية\n7. Steps = خطوات في job',
  1, 35, NOW(), NOW()
); ON CONFLICT (course_id, order_index) DO NOTHING;

-- PROJET FINAL COURS 10
INSERT INTO exercises (course_id, lesson_id, title_fr, title_en, title_ar,
                      description_fr, description_en, description_ar,
                      solution_fr, solution_en, solution_ar,
                      type, order_index, difficulty, created_at, updated_at)
VALUES (
  10, NULL,
  'PROJET FINAL : Pipeline CI/CD complet',
  'FINAL PROJECT: Complete CI/CD Pipeline',
  'المشروع النهائي: Pipeline CI/CD كامل',
  'Créez un pipeline CI/CD complet avec GitHub Actions :\n1. Workflow qui se déclenche sur push\n2. Job pour tester le backend (Maven)\n3. Job pour tester le frontend (npm)\n4. Job pour construire les images Docker\n5. Job pour pousser vers le registre\n6. Job pour déployer sur Kubernetes\n7. Utilisez des secrets pour les credentials',
  'Create a complete CI/CD pipeline with GitHub Actions:\n1. Workflow triggered on push\n2. Job to test backend (Maven)\n3. Job to test frontend (npm)\n4. Job to build Docker images\n5. Job to push to registry\n6. Job to deploy on Kubernetes\n7. Use secrets for credentials',
  'أنشئ pipeline CI/CD كامل مع GitHub Actions:\n1. Workflow يبدأ عند push\n2. Job لاختبار backend (Maven)\n3. Job لاختبار frontend (npm)\n4. Job لبناء صور Docker\n5. Job للدفع إلى السجل\n6. Job للنشر على Kubernetes\n7. استخدم secrets للبيانات الاعتمادية',
  'Solution : Voir .github/workflows/ci-cd.yml dans le projet. Le pipeline complet est déjà configuré.',
  'Solution: See .github/workflows/ci-cd.yml in project. Complete pipeline is already configured.',
  'الحل: انظر .github/workflows/ci-cd.yml في المشروع. الـ pipeline الكامل مضبوط بالفعل.',
  'PROJECT', 10, 5, NOW(), NOW()
);

-- COURS 11: DevOps - Leçon 11.1
INSERT INTO lessons (course_id, title_fr, title_en, title_ar, content_fr, content_en, content_ar,
                     key_points_fr, key_points_en, key_points_ar,
                     analogies_fr, analogies_en, analogies_ar,
                     examples_fr, examples_en, examples_ar,
                     order_index, estimated_duration, created_at, updated_at)
VALUES (
  11,
  'DevOps : Culture et pratiques',
  'DevOps: Culture and Practices',
  'DevOps: الثقافة والممارسات',
  'DevOps est comme un pont entre le développement et les opérations : au lieu d''avoir deux équipes séparées (développeurs qui créent, opérateurs qui déploient), DevOps crée une culture où tout le monde collabore. C''est comme avoir une équipe de cuisine où les cuisiniers (devs) et les serveurs (ops) travaillent ensemble pour servir le meilleur plat (application) aux clients.',
  'DevOps is like a bridge between development and operations: instead of having two separate teams (developers who create, operators who deploy), DevOps creates a culture where everyone collaborates. It''s like having a kitchen team where cooks (devs) and servers (ops) work together to serve the best dish (application) to customers.',
  'DevOps مثل جسر بين التطوير والعمليات: بدلاً من وجود فريقين منفصلين (مطورون يخلقون، مشغلون ينشرون)، DevOps تنشئ ثقافة حيث يتعاون الجميع. إنه مثل وجود فريق مطبخ حيث الطهاة (devs) والنوادل (ops) يعملون معًا لتقديم أفضل طبق (تطبيق) للعملاء.',
  '1. DevOps = Dev + Ops (collaboration)\n2. Automatisation = réduire les erreurs humaines\n3. Monitoring = surveiller en temps réel\n4. GitOps = infrastructure dans Git\n5. Culture de partage et communication\n6. Feedback rapide et amélioration continue\n7. Infrastructure as Code',
  '1. DevOps = Dev + Ops (collaboration)\n2. Automation = reduce human errors\n3. Monitoring = real-time surveillance\n4. GitOps = infrastructure in Git\n5. Culture of sharing and communication\n6. Fast feedback and continuous improvement\n7. Infrastructure as Code',
  '1. DevOps = Dev + Ops (تعاون)\n2. الأتمتة = تقليل الأخطاء البشرية\n3. المراقبة = مراقبة في الوقت الفعلي\n4. GitOps = البنية التحتية في Git\n5. ثقافة المشاركة والتواصل\n6. ردود فعل سريعة وتحسين مستمر\n7. البنية التحتية كرمز',
  1, 30, NOW(), NOW()
); ON CONFLICT (course_id, order_index) DO NOTHING;

-- PROJET FINAL COURS 11
INSERT INTO exercises (course_id, lesson_id, title_fr, title_en, title_ar,
                      description_fr, description_en, description_ar,
                      solution_fr, solution_en, solution_ar,
                      type, order_index, difficulty, created_at, updated_at)
VALUES (
  11, NULL,
  'PROJET FINAL : Plateforme DevOps complète',
  'FINAL PROJECT: Complete DevOps Platform',
  'المشروع النهائي: منصة DevOps كاملة',
  'Mettez en place une plateforme DevOps complète :\n1. Configurez ArgoCD pour GitOps\n2. Configurez Prometheus pour le monitoring\n3. Créez des dashboards Grafana\n4. Configurez des alertes\n5. Automatisez les backups\n6. Documentez tous les processus\n7. Créez un runbook pour les incidents',
  'Set up a complete DevOps platform:\n1. Configure ArgoCD for GitOps\n2. Configure Prometheus for monitoring\n3. Create Grafana dashboards\n4. Configure alerts\n5. Automate backups\n6. Document all processes\n7. Create a runbook for incidents',
  'قم بإعداد منصة DevOps كاملة:\n1. اضبط ArgoCD لـ GitOps\n2. اضبط Prometheus للمراقبة\n3. أنشئ لوحات Grafana\n4. اضبط التنبيهات\n5. أتمتة النسخ الاحتياطية\n6. وثق جميع العمليات\n7. أنشئ runbook للحوادث',
  'Solution : Voir les fichiers dans monitoring/ et argocd/ du projet. Configuration Prometheus et ArgoCD déjà préparée.',
  'Solution: See files in monitoring/ and argocd/ folders of project. Prometheus and ArgoCD configuration already prepared.',
  'الحل: انظر الملفات في monitoring/ و argocd/ للمشروع. تكوين Prometheus و ArgoCD جاهز بالفعل.',
  'PROJECT', 10, 5, NOW(), NOW()
);
