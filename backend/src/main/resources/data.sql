-- Données d'exemple pour la plateforme

-- Rôles
INSERT INTO roles (name) VALUES ('ROLE_STUDENT'), ('ROLE_INSTRUCTOR'), ('ROLE_ADMIN')
ON CONFLICT DO NOTHING;

-- Créer une contrainte unique sur order_index si elle n'existe pas
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_constraint 
        WHERE conname = 'courses_order_index_unique'
    ) THEN
        ALTER TABLE courses ADD CONSTRAINT courses_order_index_unique UNIQUE (order_index);
    END IF;
END $$;

-- Insérer les cours uniquement s'ils n'existent pas déjà
INSERT INTO courses (
  title_fr, title_en, title_ar,
  description_fr, description_en, description_ar,
  level, order_index, created_at, updated_at
)
VALUES
-- 1. Fondamentaux du développement
(
  'Fondamentaux du développement',
  'Fundamentals of Software Development',
  'أساسيات تطوير البرمجيات',
  'Posez des bases solides pour devenir développeur full stack en 1 an : logique, algorithmes simples, pensée structurée, bonnes pratiques, Git/GitHub et organisation de votre apprentissage. À la fin de ce cours, vous saurez lire, comprendre et écrire des programmes simples en suivant une démarche pas à pas.',
  'Build strong foundations to become a full stack developer in 1 year: logic, simple algorithms, structured thinking, best practices, Git/GitHub and learning organization. By the end of this course, you will be able to read, understand and write simple programs step by step.',
  'ضع أساسًا قويًا لتصبح مطورًا كاملاً خلال سنة واحدة: المنطق، الخوارزميات البسيطة، طريقة التفكير المنظمة، أفضل الممارسات، Git/GitHub وتنظيم مسار تعلّمك. في نهاية هذا الكورس ستكون قادرًا على قراءة وكتابة برامج بسيطة خطوة بخطوة.',
  'BEGINNER', 1, NOW(), NOW()
),

-- 2. Introduction au développement web moderne
(
  'Introduction au Développement Web',
  'Introduction to Modern Web Development',
  'مقدمة في تطوير الويب الحديث',
  'Découvrez comment fonctionne le web (HTTP, navigateur, serveur) et les rôles du frontend et du backend. Ce cours utilise des analogies concrètes (restaurant, poste, GPS) pour expliquer les concepts, vous guide avec des exemples simples HTML/CSS/JS et vous prépare à la suite du parcours full stack.',
  'Discover how the web works (HTTP, browser, server) and the roles of frontend and backend. This course uses concrete analogies (restaurant, post office, GPS) to explain concepts, guides you with simple HTML/CSS/JS examples and prepares you for the rest of the full stack journey.',
  'اكتشف كيف يعمل الويب (HTTP، المتصفّح، الخادم) وما هو دور الواجهة الأمامية والواجهة الخلفية. هذا الكورس يستخدم تشبيهات ملموسة (مطعم، مكتب بريد، نظام GPS) لشرح المفاهيم، ويقدّم أمثلة بسيطة بـ HTML/CSS/JS ليهيئك لباقي مسار المطوّر الكامل.',
  'BEGINNER', 2, NOW(), NOW()
),

-- 3. Java et Spring Boot
(
  'Java et Spring Boot',
  'Java and Spring Boot',
  'Java و Spring Boot',
  'Apprenez Java étape par étape (syntaxe, objets, collections, erreurs) puis créez des APIs REST professionnelles avec Spring Boot, testées et prêtes à être consommées par un frontend. Le cours alterne explications par points, exemples guidés, exercices corrigés et mini‑projets pour ancrer les réflexes d''un backend moderne.',
  'Learn Java step by step (syntax, objects, collections, errors) then build professional REST APIs with Spring Boot, tested and ready to be consumed by a frontend. The course alternates bullet‑point explanations, guided examples, corrected exercises and mini‑projects to build strong modern backend habits.',
  'تتعلّم Java خطوة بخطوة (الصياغة، الكائنات، المجموعات، الأخطاء) ثم تبني واجهات REST احترافية بـ Spring Boot، مع اختبارات جاهزة للاستهلاك من واجهة أمامية. الكورس يمزج بين شروحات بنقاط، أمثلة مرفوقة بالشرح، تمارين مع حلول، ومشاريع صغيرة لتكوين عقلية مطوّر backend حديث.',
  'INTERMEDIATE', 3, NOW(), NOW()
),

-- 4. Angular et TypeScript
(
  'Angular et TypeScript',
  'Angular and TypeScript',
  'Angular و TypeScript',
  'Créez des interfaces modernes, réactives et maintenables avec Angular et TypeScript : composants, services, routing, formulaires, appels API, gestion d''état. Chaque chapitre propose des analogies visuelles, des check‑lists de bonnes pratiques, des exercices pas à pas et des QCM pour vérifier votre compréhension.',
  'Build modern, reactive and maintainable interfaces with Angular and TypeScript: components, services, routing, forms, API calls, state management. Each chapter offers visual analogies, best‑practice checklists, step‑by‑step exercises and quizzes to validate your understanding.',
  'تقوم بإنشاء واجهات حديثة وتفاعلية وسهلة الصيانة باستخدام Angular و TypeScript: مكوّنات، خدمات، توجيه، نماذج، استدعاء واجهات برمجية، إدارة الحالة. كل فصل يحتوي على تشبيهات بصرية، قوائم تحقق لأفضل الممارسات، تمارين خطوة بخطوة واختبارات QCM للتأكد من فهمك.',
  'INTERMEDIATE', 4, NOW(), NOW()
),

-- 5. Bases de données et PostgreSQL
(
  'Bases de données avec PostgreSQL',
  'Databases with PostgreSQL',
  'قواعد البيانات مع PostgreSQL',
  'Apprenez à modéliser vos données (tables, relations, clés) et à écrire des requêtes SQL efficaces avec PostgreSQL. Vous verrez des exemples concrets liés à la plateforme (cours, leçons, progrès des élèves), des exercices guidés, des QCM et des corrigés pour maîtriser le langage SQL au service de vos applications.',
  'Learn how to model your data (tables, relations, keys) and write efficient SQL queries with PostgreSQL. You will work on concrete examples related to the platform (courses, lessons, student progress), guided exercises, quizzes and corrections to master SQL for your applications.',
  'تتعلّم كيف تصمّم بياناتك (جداول، علاقات، مفاتيح) وتكتب استعلامات SQL فعّالة باستخدام PostgreSQL. ستتعامل مع أمثلة حقيقية متعلقة بالمنصّة (كورسات، دروس، تقدّم الطلاب)، مع تمارين موجهة، واختبارات QCM وحلولها لإتقان SQL في تطبيقاتك.',
  'INTERMEDIATE', 5, NOW(), NOW()
),

-- 6. Docker et Containerisation
(
  'Docker et Containerisation',
  'Docker and Containerization',
  'Docker والحاويات',
  'Comprenez Docker par analogies simples (boîtes, images, conteneurs) puis apprenez à containeriser votre backend Spring Boot, votre frontend Angular et votre base PostgreSQL. Le cours vous guide par étapes : commandes essentielles, Dockerfile commentés, exercices pratiques et QCM orientés DevOps.',
  'Understand Docker through simple analogies (boxes, images, containers) then learn how to containerize your Spring Boot backend, Angular frontend and PostgreSQL database. The course guides you step by step: core commands, commented Dockerfiles, practical exercises and DevOps‑oriented quizzes.',
  'تفهم Docker من خلال تشبيهات بسيطة (صناديق، صور، حاويات) ثم تتعلّم كيف تحوّل backend بـ Spring Boot و frontend بـ Angular وقاعدة بيانات PostgreSQL إلى حاويات. الكورس يقودك خطوة بخطوة: أوامر أساسية، ملفات Dockerfile مع شرح، تمارين عملية واختبارات QCM موجهة نحو DevOps.',
  'INTERMEDIATE', 6, NOW(), NOW()
),

-- 7. Kubernetes
(
  'Kubernetes',
  'Kubernetes',
  'Kubernetes',
  'Apprenez à orchestrer vos conteneurs avec Kubernetes : pods, services, deployments, ingress. À partir d''exemples concrets de la plateforme, vous verrez comment passer d''un docker-compose local à un cluster prêt pour la production, avec exercices guidés et fiches de synthèse.',
  'Learn how to orchestrate your containers with Kubernetes: pods, services, deployments, ingress. Using concrete examples from the platform, you will see how to move from local docker-compose to a production‑ready cluster, with guided exercises and summary sheets.',
  'تتعلّم كيف تنظّم حاوياتك باستخدام Kubernetes: Pods، Services، Deployments، Ingress. بالاعتماد على أمثلة حقيقية من المنصّة، سترى كيف تنتقل من docker-compose محلي إلى عنقود جاهز للإنتاج، مع تمارين موجهة وملخصات في نهاية كل جزء.',
  'ADVANCED', 7, NOW(), NOW()
),

-- 8. AWS Cloud
(
  'AWS Cloud',
  'AWS Cloud',
  'سحابة AWS',
  'Découvrez les services clés d''AWS pour un développeur full stack (EC2, RDS, S3, EKS) et déployez progressivement votre application complète dans le cloud. Le cours propose un chemin guidé, des schémas explicatifs, des pas‑à‑pas détaillés et des QCM pour valider chaque brique.',
  'Discover the key AWS services for a full stack developer (EC2, RDS, S3, EKS) and progressively deploy your full application to the cloud. The course offers a guided path, explanatory diagrams, detailed step‑by‑step labs and quizzes to validate each building block.',
  'تكتشف أهم خدمات AWS لمطوّر full stack (EC2، RDS، S3، EKS) وتقوم بنشر تطبيقك الكامل تدريجيًا في السحابة. الكورس يعطيك مسارًا موجهًا، رسومات توضيحية، تجارب عملية خطوة بخطوة واختبارات QCM للتحقق من فهم كل جزء.',
  'ADVANCED', 8, NOW(), NOW()
),

-- 9. Terraform - Infrastructure as Code
(
  'Terraform - Infrastructure as Code',
  'Terraform - Infrastructure as Code',
  'Terraform - البنية التحتية كرمز',
  'Automatisez la création de votre infrastructure (réseau, bases, cluster Kubernetes) avec Terraform. Vous apprendrez la syntaxe HCL, la structuration de vos modules, la gestion des variables et des environnements à travers des exemples directement liés à la plateforme de l''Institut.',
  'Automate the creation of your infrastructure (network, databases, Kubernetes cluster) with Terraform. You will learn HCL syntax, module structuring, variable and environment management through examples directly connected to the Institut platform.',
  'تقوم بأتمتة إنشاء البنية التحتية الخاصة بك (الشبكة، قواعد البيانات، عنقود Kubernetes) باستخدام Terraform. ستتعلّم صيغة HCL، تنظيم الـ Modules، إدارة المتغيرات والبيئات من خلال أمثلة مرتبطة مباشرة بمنصّة المعهد.',
  'ADVANCED', 9, NOW(), NOW()
),

-- 10. CI/CD avec GitHub Actions
(
  'CI/CD avec GitHub Actions',
  'CI/CD with GitHub Actions',
  'CI/CD مع GitHub Actions',
  'Mettez en place une chaîne CI/CD complète pour tester, construire et déployer votre application full stack à chaque push. Vous partirez de workflows simples (build + tests) jusqu''au déploiement automatique sur Kubernetes, avec des QCM et exercices guidés pour chaque étape.',
  'Set up a complete CI/CD pipeline to test, build and deploy your full stack application on every push. You will start from simple workflows (build + tests) and go up to automatic deployment on Kubernetes, with quizzes and guided exercises at each step.',
  'تقوم ببناء سلسلة CI/CD كاملة لاختبار وبناء ونشر تطبيقك الكامل عند كل عملية دفع (push). ستنطلق من Workflows بسيطة (بناء + اختبارات) حتى الوصول إلى نشر تلقائي على Kubernetes، مع اختبارات QCM وتمارين موجهة في كل مرحلة.',
  'INTERMEDIATE', 10, NOW(), NOW()
),

-- 11. DevOps, GitOps et Monitoring
(
  'DevOps, GitOps et Monitoring',
  'DevOps, GitOps and Monitoring',
  'DevOps و GitOps والمراقبة',
  'Adoptez une culture DevOps complète : collaboration, automatisation, GitOps avec ArgoCD et supervision avec Prometheus. Ce cours relie toutes les briques vues dans l''année en un système cohérent, avec un projet final où vous pilotez votre plateforme comme un véritable ingénieur DevOps.',
  'Adopt a complete DevOps culture: collaboration, automation, GitOps with ArgoCD and monitoring with Prometheus. This course connects all the bricks studied during the year into a coherent system, with a final project where you operate your platform like a real DevOps engineer.',
  'تتبنّى ثقافة DevOps كاملة: تعاون، أتمتة، GitOps مع ArgoCD، ومراقبة باستخدام Prometheus. هذا الكورس يربط كل العناصر التي تعلمتها خلال السنة في نظام واحد متماسك، مع مشروع نهائي تدير فيه منصّتك كمَهندس DevOps حقيقي.',
  'ADVANCED', 11, NOW(), NOW()
)
ON CONFLICT (order_index) DO NOTHING;
