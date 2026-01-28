-- ============================================
-- CONTENU COMPLET POUR TOUS LES COURS
-- Leçons, Exercices, QCM et Projets Finaux
-- ============================================

-- ============================================
-- COURS 2: Introduction au Développement Web - COMPLÉTION
-- ============================================

-- Leçon 2.2: HTML - Structure de base
INSERT INTO lessons (course_id, title_fr, title_en, title_ar, content_fr, content_en, content_ar,
                     key_points_fr, key_points_en, key_points_ar,
                     analogies_fr, analogies_en, analogies_ar,
                     examples_fr, examples_en, examples_ar,
                     order_index, estimated_duration, created_at, updated_at)
VALUES (
  2,
  'HTML : Structure et balises de base',
  'HTML: Structure and Basic Tags',
  'HTML: البنية والعلامات الأساسية',
  'HTML est comme le squelette d''une page web : il définit la structure et le contenu, mais pas l''apparence. Chaque balise HTML est comme un conteneur qui dit "ceci est un titre", "ceci est un paragraphe", "ceci est un lien". Le navigateur lit ces balises et affiche le contenu de manière structurée.',
  'HTML is like the skeleton of a web page: it defines the structure and content, but not the appearance. Each HTML tag is like a container that says "this is a title", "this is a paragraph", "this is a link". The browser reads these tags and displays the content in a structured way.',
  'HTML مثل هيكل صفحة الويب: يحدد البنية والمحتوى، لكن ليس المظهر. كل علامة HTML مثل حاوية تقول "هذا عنوان"، "هذا فقرة"، "هذا رابط". المتصفح يقرأ هذه العلامات ويعرض المحتوى بشكل منظم.',
  '1. HTML = HyperText Markup Language\n2. Balises = conteneurs avec <nom> et </nom>\n3. Structure de base : <html>, <head>, <body>\n4. Balises courantes : <h1> titre, <p> paragraphe, <a> lien, <img> image\n5. Attributs = propriétés des balises (ex: href, src)\n6. Indentation = organisation visuelle du code',
  '1. HTML = HyperText Markup Language\n2. Tags = containers with <name> and </name>\n3. Basic structure: <html>, <head>, <body>\n4. Common tags: <h1> heading, <p> paragraph, <a> link, <img> image\n5. Attributes = tag properties (e.g., href, src)\n6. Indentation = visual code organization',
  '1. HTML = لغة ترميز النص التشعبي\n2. العلامات = حاويات مع <اسم> و </اسم>\n3. البنية الأساسية: <html>، <head>، <body>\n4. علامات شائعة: <h1> عنوان، <p> فقرة، <a> رابط، <img> صورة\n5. السمات = خصائص العلامات (مثلاً: href، src)\n6. المسافة البادئة = تنظيم بصري للكود',
  'HTML est comme un plan de maison : <html> est la maison entière, <head> est le toit (métadonnées), <body> est les pièces (contenu visible). Chaque pièce a un rôle : <h1> est la porte d''entrée (titre principal), <p> sont les murs (paragraphes), <a> sont les portes (liens vers d''autres pièces).',
  'HTML is like a house plan: <html> is the entire house, <head> is the roof (metadata), <body> is the rooms (visible content). Each room has a role: <h1> is the front door (main title), <p> are the walls (paragraphs), <a> are doors (links to other rooms).',
  'HTML مثل خطة منزل: <html> هو المنزل كله، <head> هو السقف (البيانات الوصفية)، <body> هي الغرف (المحتوى المرئي). كل غرفة لها دور: <h1> هو الباب الأمامي (العنوان الرئيسي)، <p> هي الجدران (الفقرات)، <a> هي الأبواب (روابط إلى غرف أخرى).',
  'Exemple HTML de base :\n\n<!DOCTYPE html>\n<html>\n<head>\n    <title>Ma Première Page</title>\n</head>\n<body>\n    <h1>Bienvenue</h1>\n    <p>Ceci est mon premier paragraphe.</p>\n    <a href="https://example.com">Visiter le site</a>\n    <img src="image.jpg" alt="Description">\n</body>\n</html>',
  'Basic HTML example:\n\n<!DOCTYPE html>\n<html>\n<head>\n    <title>My First Page</title>\n</head>\n<body>\n    <h1>Welcome</h1>\n    <p>This is my first paragraph.</p>\n    <a href="https://example.com">Visit the site</a>\n    <img src="image.jpg" alt="Description">\n</body>\n</html>',
  'مثال HTML أساسي:\n\n<!DOCTYPE html>\n<html>\n<head>\n    <title>صفحتي الأولى</title>\n</head>\n<body>\n    <h1>مرحبًا</h1>\n    <p>هذه فقرتي الأولى.</p>\n    <a href="https://example.com">زيارة الموقع</a>\n    <img src="image.jpg" alt="الوصف">\n</body>\n</html>',
  2, 30, NOW(), NOW()
); ON CONFLICT (course_id, order_index) DO NOTHING;

-- Exercice 2.2
INSERT INTO exercises (course_id, lesson_id, title_fr, title_en, title_ar,
                      description_fr, description_en, description_ar,
                      solution_fr, solution_en, solution_ar,
                      type, order_index, difficulty, created_at, updated_at)
VALUES (
  2, (SELECT id FROM lessons WHERE course_id = 2 AND order_index = 2),
  'Exercice : Créer votre première page HTML',
  'Exercise: Create Your First HTML Page',
  'تمرين: إنشاء صفحة HTML الأولى',
  'Créez une page HTML complète avec :\n1. Un titre principal "L''Institut de l''informatique"\n2. Un sous-titre "Devenez développeur full stack"\n3. Deux paragraphes de présentation\n4. Un lien vers le site web\n5. Une image (utilisez un placeholder)\n\nStructurez bien votre code avec indentation.',
  'Create a complete HTML page with:\n1. A main title "Institut de l''informatique"\n2. A subtitle "Become a full stack developer"\n3. Two presentation paragraphs\n4. A link to the website\n5. An image (use a placeholder)\n\nStructure your code well with indentation.',
  'أنشئ صفحة HTML كاملة مع:\n1. عنوان رئيسي "معهد المعلوماتية"\n2. عنوان فرعي "كن مطورًا كاملاً"\n3. فقرتين تقديميتين\n4. رابط إلى الموقع\n5. صورة (استخدم placeholder)\n\nنظم كودك جيدًا مع المسافة البادئة.',
  'Solution :\n\n<!DOCTYPE html>\n<html>\n<head>\n    <title>Institut de l''informatique</title>\n</head>\n<body>\n    <h1>L''Institut de l''informatique</h1>\n    <h2>Devenez développeur full stack</h2>\n    <p>Bienvenue sur notre plateforme d''apprentissage.</p>\n    <p>Apprenez Java, Angular, Docker et plus encore.</p>\n    <a href="https://institut.example.com">Visiter le site</a>\n    <img src="https://via.placeholder.com/300" alt="Logo Institut">\n</body>\n</html>',
  'Solution:\n\n<!DOCTYPE html>\n<html>\n<head>\n    <title>Institut de l''informatique</title>\n</head>\n<body>\n    <h1>Institut de l''informatique</h1>\n    <h2>Become a full stack developer</h2>\n    <p>Welcome to our learning platform.</p>\n    <p>Learn Java, Angular, Docker and more.</p>\n    <a href="https://institut.example.com">Visit the site</a>\n    <img src="https://via.placeholder.com/300" alt="Institut Logo">\n</body>\n</html>',
  'الحل:\n\n<!DOCTYPE html>\n<html>\n<head>\n    <title>معهد المعلوماتية</title>\n</head>\n<body>\n    <h1>معهد المعلوماتية</h1>\n    <h2>كن مطورًا كاملاً</h2>\n    <p>مرحبًا بك في منصة التعلم الخاصة بنا.</p>\n    <p>تعلم Java و Angular و Docker والمزيد.</p>\n    <a href="https://institut.example.com">زيارة الموقع</a>\n    <img src="https://via.placeholder.com/300" alt="شعار المعهد">\n</body>\n</html>',
  'CODING', 2, 2, NOW(), NOW()
);

-- QCM pour leçon 2.2 (4 questions)
INSERT INTO quiz_questions (exercise_id, question_fr, question_en, question_ar,
                           correct_answer_index, explanation_fr, explanation_en, explanation_ar)
VALUES 
(
  (SELECT id FROM exercises WHERE course_id = 2 AND lesson_id = (SELECT id FROM lessons WHERE course_id = 2 AND order_index = 2) AND order_index = 2),
  'Quelle balise HTML est utilisée pour créer un titre principal ?',
  'Which HTML tag is used to create a main heading?',
  'أي علامة HTML تُستخدم لإنشاء عنوان رئيسي؟',
  0,
  'La balise <h1> est utilisée pour le titre principal. Il existe aussi <h2> à <h6> pour les sous-titres de différents niveaux.',
  'The <h1> tag is used for the main heading. There are also <h2> to <h6> for subtitles of different levels.',
  'العلامة <h1> تُستخدم للعنوان الرئيسي. يوجد أيضًا <h2> إلى <h6> للعناوين الفرعية بمستويات مختلفة.'
),
(
  (SELECT id FROM exercises WHERE course_id = 2 AND lesson_id = (SELECT id FROM lessons WHERE course_id = 2 AND order_index = 2) AND order_index = 2),
  'Quel attribut est utilisé pour définir l''URL d''un lien ?',
  'Which attribute is used to define the URL of a link?',
  'أي سمة تُستخدم لتعريف رابط URL؟',
  1,
  'L''attribut href (hypertext reference) définit l''URL vers laquelle le lien pointe. Exemple : <a href="https://example.com">Lien</a>',
  'The href (hypertext reference) attribute defines the URL the link points to. Example: <a href="https://example.com">Link</a>',
  'السمة href (مرجع النص التشعبي) تحدد رابط URL الذي يشير إليه الرابط. مثال: <a href="https://example.com">رابط</a>'
),
(
  (SELECT id FROM exercises WHERE course_id = 2 AND lesson_id = (SELECT id FROM lessons WHERE course_id = 2 AND order_index = 2) AND order_index = 2),
  'Quelle est la structure correcte d''une balise HTML ?',
  'What is the correct structure of an HTML tag?',
  'ما هي البنية الصحيحة لعلامة HTML؟',
  2,
  'Une balise HTML a une balise ouvrante <nom> et une balise fermante </nom>, avec le contenu entre les deux. Certaines balises sont auto-fermantes comme <img />.',
  'An HTML tag has an opening tag <name> and a closing tag </name>, with content between them. Some tags are self-closing like <img />.',
  'علامة HTML لها علامة فتح <اسم> وعلامة إغلاق </اسم>، مع المحتوى بينهما. بعض العلامات تُغلق تلقائيًا مثل <img />.'
),
(
  (SELECT id FROM exercises WHERE course_id = 2 AND lesson_id = (SELECT id FROM lessons WHERE course_id = 2 AND order_index = 2) AND order_index = 2),
  'Où place-t-on les métadonnées de la page (titre, encodage) ?',
  'Where do we place page metadata (title, encoding)?',
  'أين نضع بيانات الصفحة الوصفية (العنوان، الترميز)؟',
  0,
  'Les métadonnées se placent dans la section <head> de la page HTML. C''est là qu''on met le <title>, les liens CSS, les meta tags, etc.',
  'Metadata goes in the <head> section of the HTML page. This is where you put <title>, CSS links, meta tags, etc.',
  'البيانات الوصفية توضع في قسم <head> من صفحة HTML. هنا توضع <title> وروابط CSS وعلامات meta، إلخ.'
);

-- Leçon 2.3: CSS - Mise en forme
INSERT INTO lessons (course_id, title_fr, title_en, title_ar, content_fr, content_en, content_ar,
                     key_points_fr, key_points_en, key_points_ar,
                     analogies_fr, analogies_en, analogies_ar,
                     examples_fr, examples_en, examples_ar,
                     order_index, estimated_duration, created_at, updated_at)
VALUES (
  2,
  'CSS : Mise en forme et styles',
  'CSS: Styling and Formatting',
  'CSS: التنسيق والأنماط',
  'CSS est comme la décoration d''une maison : HTML construit les murs (structure), CSS peint les murs, choisit les couleurs, arrange les meubles (apparence). CSS permet de dire "ce titre est rouge", "ce paragraphe a une marge de 20px", "cette section a un fond bleu".',
  'CSS is like house decoration: HTML builds the walls (structure), CSS paints the walls, chooses colors, arranges furniture (appearance). CSS allows you to say "this title is red", "this paragraph has a 20px margin", "this section has a blue background".',
  'CSS مثل ديكور المنزل: HTML يبني الجدران (البنية)، CSS يلون الجدران، يختار الألوان، يرتب الأثاث (المظهر). CSS يسمح لك بقول "هذا العنوان أحمر"، "هذه الفقرة لها هامش 20 بكسل"، "هذا القسم له خلفية زرقاء".',
  '1. CSS = Cascading Style Sheets\n2. Sélecteur = cible l''élément à styler\n3. Propriété = ce qu''on change (color, font-size, margin)\n4. Valeur = la nouvelle valeur (red, 16px, 20px)\n5. Syntaxe : sélecteur { propriété: valeur; }\n6. Trois façons d''ajouter CSS : inline, <style>, fichier .css',
  '1. CSS = Cascading Style Sheets\n2. Selector = targets the element to style\n3. Property = what we change (color, font-size, margin)\n4. Value = the new value (red, 16px, 20px)\n5. Syntax: selector { property: value; }\n6. Three ways to add CSS: inline, <style>, .css file',
  '1. CSS = صفحات الأنماط المتتالية\n2. المحدد = يستهدف العنصر المراد تنسيقه\n3. الخاصية = ما نغيره (color، font-size، margin)\n4. القيمة = القيمة الجديدة (red، 16px، 20px)\n5. الصياغة: selector { property: value; }\n6. ثلاث طرق لإضافة CSS: inline، <style>، ملف .css',
  'CSS est comme un styliste : HTML crée le mannequin (structure), CSS choisit les vêtements (couleurs), les accessoires (marges), le maquillage (polices). Chaque élément peut être habillé différemment selon les règles CSS.',
  'CSS is like a stylist: HTML creates the mannequin (structure), CSS chooses the clothes (colors), accessories (marges), makeup (fonts). Each element can be dressed differently according to CSS rules.',
  'CSS مثل مصمم أزياء: HTML ينشئ العارضة (البنية)، CSS يختار الملابس (الألوان)، الإكسسوارات (الهوامش)، المكياج (الخطوط). كل عنصر يمكن أن يُلبس بشكل مختلف حسب قواعد CSS.',
  'Exemple CSS :\n\n/* Style pour les titres */\nh1 {\n    color: blue;\n    font-size: 32px;\n    margin-bottom: 20px;\n}\n\n/* Style pour les paragraphes */\np {\n    color: #333;\n    line-height: 1.6;\n    padding: 10px;\n}\n\n/* Style pour une classe */\n.card {\n    background: white;\n    border-radius: 8px;\n    box-shadow: 0 2px 4px rgba(0,0,0,0.1);\n}',
  'CSS example:\n\n/* Style for headings */\nh1 {\n    color: blue;\n    font-size: 32px;\n    margin-bottom: 20px;\n}\n\n/* Style for paragraphs */\np {\n    color: #333;\n    line-height: 1.6;\n    padding: 10px;\n}\n\n/* Style for a class */\n.card {\n    background: white;\n    border-radius: 8px;\n    box-shadow: 0 2px 4px rgba(0,0,0,0.1);\n}',
  'مثال CSS:\n\n/* نمط للعناوين */\nh1 {\n    color: blue;\n    font-size: 32px;\n    margin-bottom: 20px;\n}\n\n/* نمط للفقرات */\np {\n    color: #333;\n    line-height: 1.6;\n    padding: 10px;\n}\n\n/* نمط لفئة */\n.card {\n    background: white;\n    border-radius: 8px;\n    box-shadow: 0 2px 4px rgba(0,0,0,0.1);\n}',
  3, 35, NOW(), NOW()
);

-- Exercice 2.3
INSERT INTO exercises (course_id, lesson_id, title_fr, title_en, title_ar,
                      description_fr, description_en, description_ar,
                      solution_fr, solution_en, solution_ar,
                      type, order_index, difficulty, created_at, updated_at)
VALUES (
  2, (SELECT id FROM lessons WHERE course_id = 2 AND order_index = 3),
  'Exercice : Styliser votre page HTML',
  'Exercise: Style Your HTML Page',
  'تمرين: تنسيق صفحة HTML',
  'Ajoutez du CSS à votre page HTML précédente pour :\n1. Centrer le titre principal\n2. Mettre le texte en couleur bleue\n3. Ajouter une marge de 20px autour des paragraphes\n4. Créer une classe "card" avec fond blanc, bordure arrondie et ombre\n5. Appliquer cette classe à une section',
  'Add CSS to your previous HTML page to:\n1. Center the main title\n2. Make text blue\n3. Add 20px margin around paragraphs\n4. Create a "card" class with white background, rounded border and shadow\n5. Apply this class to a section',
  'أضف CSS إلى صفحة HTML السابقة لـ:\n1. توسيط العنوان الرئيسي\n2. جعل النص أزرق\n3. إضافة هامش 20 بكسل حول الفقرات\n4. إنشاء فئة "card" بخلفية بيضاء، حد مستدير وظل\n5. تطبيق هذه الفئة على قسم',
  'Solution CSS :\n\n<style>\nh1 {\n    text-align: center;\n    color: blue;\n}\n\np {\n    color: blue;\n    margin: 20px;\n}\n\n.card {\n    background: white;\n    border-radius: 8px;\n    box-shadow: 0 2px 4px rgba(0,0,0,0.1);\n    padding: 20px;\n    margin: 20px;\n}\n</style>\n\n<!-- Dans le HTML -->\n<div class="card">\n    <h2>Section stylisée</h2>\n    <p>Contenu de la carte...</p>\n</div>',
  'CSS Solution:\n\n<style>\nh1 {\n    text-align: center;\n    color: blue;\n}\n\np {\n    color: blue;\n    margin: 20px;\n}\n\n.card {\n    background: white;\n    border-radius: 8px;\n    box-shadow: 0 2px 4px rgba(0,0,0,0.1);\n    padding: 20px;\n    margin: 20px;\n}\n</style>\n\n<!-- In HTML -->\n<div class="card">\n    <h2>Styled section</h2>\n    <p>Card content...</p>\n</div>',
  'حل CSS:\n\n<style>\nh1 {\n    text-align: center;\n    color: blue;\n}\n\np {\n    color: blue;\n    margin: 20px;\n}\n\n.card {\n    background: white;\n    border-radius: 8px;\n    box-shadow: 0 2px 4px rgba(0,0,0,0.1);\n    padding: 20px;\n    margin: 20px;\n}\n</style>\n\n<!-- في HTML -->\n<div class="card">\n    <h2>قسم منسق</h2>\n    <p>محتوى البطاقة...</p>\n</div>',
  'CODING', 3, 2, NOW(), NOW()
);

-- QCM pour leçon 2.3 (5 questions)
INSERT INTO quiz_questions (exercise_id, question_fr, question_en, question_ar,
                           correct_answer_index, explanation_fr, explanation_en, explanation_ar)
VALUES 
(
  (SELECT id FROM exercises WHERE course_id = 2 AND lesson_id = (SELECT id FROM lessons WHERE course_id = 2 AND order_index = 3) AND order_index = 3),
  'Quelle est la syntaxe correcte pour définir la couleur du texte en CSS ?',
  'What is the correct syntax to define text color in CSS?',
  'ما هي الصياغة الصحيحة لتعريف لون النص في CSS؟',
  1,
  'La syntaxe correcte est : color: blue; (ou toute autre valeur de couleur). La propriété "color" définit la couleur du texte.',
  'The correct syntax is: color: blue; (or any other color value). The "color" property defines the text color.',
  'الصياغة الصحيحة هي: color: blue; (أو أي قيمة لون أخرى). الخاصية "color" تحدد لون النص.'
),
(
  (SELECT id FROM exercises WHERE course_id = 2 AND lesson_id = (SELECT id FROM lessons WHERE course_id = 2 AND order_index = 3) AND order_index = 3),
  'Comment cibler un élément avec la classe "header" en CSS ?',
  'How to target an element with class "header" in CSS?',
  'كيف تستهدف عنصرًا بالفئة "header" في CSS؟',
  2,
  'Pour cibler une classe, on utilise un point : .header { ... }. Le point indique qu''on cible une classe, pas un élément HTML.',
  'To target a class, use a dot: .header { ... }. The dot indicates we are targeting a class, not an HTML element.',
  'لاستهداف فئة، استخدم نقطة: .header { ... }. النقطة تشير إلى أننا نستهدف فئة، وليس عنصر HTML.'
),
(
  (SELECT id FROM exercises WHERE course_id = 2 AND lesson_id = (SELECT id FROM lessons WHERE course_id = 2 AND order_index = 3) AND order_index = 3),
  'Quelle propriété CSS permet d''ajouter de l''espace autour d''un élément ?',
  'Which CSS property allows adding space around an element?',
  'أي خاصية CSS تسمح بإضافة مساحة حول عنصر؟',
  0,
  'La propriété margin ajoute de l''espace à l''extérieur de l''élément, tandis que padding ajoute de l''espace à l''intérieur. margin: 20px; ajoute 20px d''espace autour.',
  'The margin property adds space outside the element, while padding adds space inside. margin: 20px; adds 20px of space around.',
  'خاصية margin تضيف مساحة خارج العنصر، بينما padding تضيف مساحة داخل. margin: 20px; تضيف 20 بكسل من المساحة حول.'
),
(
  (SELECT id FROM exercises WHERE course_id = 2 AND lesson_id = (SELECT id FROM lessons WHERE course_id = 2 AND order_index = 3) AND order_index = 3),
  'Quelle est la meilleure pratique pour organiser le CSS ?',
  'What is the best practice for organizing CSS?',
  'ما هي أفضل ممارسة لتنظيم CSS؟',
  3,
  'La meilleure pratique est d''utiliser un fichier CSS externe (.css) lié via <link> dans le <head>. Cela sépare le contenu (HTML) de la présentation (CSS) et facilite la maintenance.',
  'The best practice is to use an external CSS file (.css) linked via <link> in the <head>. This separates content (HTML) from presentation (CSS) and facilitates maintenance.',
  'أفضل ممارسة هي استخدام ملف CSS خارجي (.css) مرتبط عبر <link> في <head>. هذا يفصل المحتوى (HTML) عن العرض (CSS) ويسهل الصيانة.'
),
(
  (SELECT id FROM exercises WHERE course_id = 2 AND lesson_id = (SELECT id FROM lessons WHERE course_id = 2 AND order_index = 3) AND order_index = 3),
  'Que fait la propriété border-radius en CSS ?',
  'What does the border-radius property do in CSS?',
  'ماذا تفعل خاصية border-radius في CSS؟',
  1,
  'border-radius arrondit les coins d''un élément. border-radius: 8px; crée des coins arrondis de 8 pixels. C''est très utilisé pour les cartes et boutons modernes.',
  'border-radius rounds the corners of an element. border-radius: 8px; creates 8-pixel rounded corners. It is widely used for modern cards and buttons.',
  'border-radius تقوم بتدوير زوايا العنصر. border-radius: 8px; تنشئ زوايا مستديرة ب 8 بكسل. تُستخدم على نطاق واسع للبطاقات والأزرار الحديثة.'
);

-- Leçon 2.4: JavaScript - Interactivité de base
INSERT INTO lessons (course_id, title_fr, title_en, title_ar, content_fr, content_en, content_ar,
                     key_points_fr, key_points_en, key_points_ar,
                     analogies_fr, analogies_en, analogies_ar,
                     examples_fr, examples_en, examples_ar,
                     order_index, estimated_duration, created_at, updated_at)
VALUES (
  2,
  'JavaScript : Ajouter de l''interactivité',
  'JavaScript: Adding Interactivity',
  'JavaScript: إضافة التفاعلية',
  'JavaScript est comme l''électricité d''une maison : HTML construit la structure, CSS la décore, mais JavaScript ajoute les interrupteurs, les lumières qui s''allument, les portes qui s''ouvrent automatiquement. JavaScript permet de réagir aux actions de l''utilisateur (clics, saisie) et de modifier la page dynamiquement.',
  'JavaScript is like the electricity of a house: HTML builds the structure, CSS decorates it, but JavaScript adds switches, lights that turn on, doors that open automatically. JavaScript allows reacting to user actions (clicks, input) and modifying the page dynamically.',
  'JavaScript مثل كهرباء المنزل: HTML يبني البنية، CSS يزينها، لكن JavaScript يضيف المفاتيح، الأضواء التي تضيء، الأبواب التي تفتح تلقائيًا. JavaScript يسمح بالتفاعل مع إجراءات المستخدم (النقرات، الإدخال) وتعديل الصفحة ديناميكيًا.',
  '1. JavaScript = langage de programmation pour le web\n2. Variables : let, const, var\n3. Fonctions = blocs de code réutilisables\n4. Événements = réactions aux actions (click, submit)\n5. DOM = Document Object Model (représentation de la page)\n6. getElementById() = sélectionner un élément\n7. addEventListener() = écouter un événement',
  '1. JavaScript = programming language for the web\n2. Variables: let, const, var\n3. Functions = reusable code blocks\n4. Events = reactions to actions (click, submit)\n5. DOM = Document Object Model (page representation)\n6. getElementById() = select an element\n7. addEventListener() = listen to an event',
  '1. JavaScript = لغة برمجة للويب\n2. المتغيرات: let، const، var\n3. الدوال = كتل كود قابلة لإعادة الاستخدام\n4. الأحداث = ردود على الإجراءات (click، submit)\n5. DOM = نموذج كائن المستند (تمثيل الصفحة)\n6. getElementById() = تحديد عنصر\n7. addEventListener() = الاستماع لحدث',
  'JavaScript est comme un magicien : HTML montre les objets (éléments), CSS les habille joliment, mais JavaScript les fait bouger, changer, apparaître/disparaître. Quand vous cliquez sur un bouton, JavaScript peut changer le texte, afficher une alerte, ou modifier les couleurs.',
  'JavaScript is like a magician: HTML shows the objects (elements), CSS dresses them nicely, but JavaScript makes them move, change, appear/disappear. When you click a button, JavaScript can change the text, display an alert, or modify colors.',
  'JavaScript مثل ساحر: HTML يعرض الكائنات (العناصر)، CSS يلبسها بشكل جميل، لكن JavaScript يجعلها تتحرك، تتغير، تظهر/تختفي. عند النقر على زر، JavaScript يمكنه تغيير النص، عرض تنبيه، أو تعديل الألوان.',
  'Exemple JavaScript :\n\n// Sélectionner un élément\nconst bouton = document.getElementById("monBouton"); ON CONFLICT (course_id, order_index) DO NOTHING;\n\n// Ajouter un événement\nbouton.addEventListener("click", function() {\n    alert("Bouton cliqué !");\n    // Changer le texte\n    document.getElementById("message").textContent = "C''est cliqué !";\n});\n\n// Fonction pour changer la couleur\nfunction changerCouleur() {\n    const titre = document.querySelector("h1");\n    titre.style.color = "red";\n}',
  'JavaScript example:\n\n// Select an element\nconst button = document.getElementById("myButton");\n\n// Add an event\nbutton.addEventListener("click", function() {\n    alert("Button clicked!");\n    // Change text\n    document.getElementById("message").textContent = "It''s clicked!";\n});\n\n// Function to change color\nfunction changeColor() {\n    const title = document.querySelector("h1");\n    title.style.color = "red";\n}',
  'مثال JavaScript:\n\n// تحديد عنصر\nconst bouton = document.getElementById("monBouton");\n\n// إضافة حدث\nbouton.addEventListener("click", function() {\n    alert("تم النقر على الزر!");\n    // تغيير النص\n    document.getElementById("message").textContent = "تم النقر!";\n});\n\n// دالة لتغيير اللون\nfunction changerCouleur() {\n    const titre = document.querySelector("h1");\n    titre.style.color = "red";\n}',
  4, 40, NOW(), NOW()
);

-- Exercice 2.4
INSERT INTO exercises (course_id, lesson_id, title_fr, title_en, title_ar,
                      description_fr, description_en, description_ar,
                      solution_fr, solution_en, solution_ar,
                      type, order_index, difficulty, created_at, updated_at)
VALUES (
  2, (SELECT id FROM lessons WHERE course_id = 2 AND order_index = 4),
  'Exercice : Créer un compteur interactif',
  'Exercise: Create an Interactive Counter',
  'تمرين: إنشاء عداد تفاعلي',
  'Créez une page avec :\n1. Un nombre affiché (initialement 0)\n2. Un bouton "+" qui incrémente\n3. Un bouton "-" qui décrémente\n4. Un bouton "Reset" qui remet à 0\n\nUtilisez JavaScript pour gérer les clics et mettre à jour l''affichage.',
  'Create a page with:\n1. A displayed number (initially 0)\n2. A "+" button that increments\n3. A "-" button that decrements\n4. A "Reset" button that resets to 0\n\nUse JavaScript to handle clicks and update the display.',
  'أنشئ صفحة مع:\n1. رقم معروض (0 في البداية)\n2. زر "+" يزيد\n3. زر "-" ينقص\n4. زر "Reset" يعيد إلى 0\n\nاستخدم JavaScript للتعامل مع النقرات وتحديث العرض.',
  'Solution HTML + JavaScript :\n\n<div>\n    <h2>Compteur: <span id="compteur">0</span></h2>\n    <button id="plus">+</button>\n    <button id="moins">-</button>\n    <button id="reset">Reset</button>\n</div>\n\n<script>\nlet compteur = 0;\nconst affichage = document.getElementById("compteur");\n\nfunction mettreAJour() {\n    affichage.textContent = compteur;\n}\n\ndocument.getElementById("plus").addEventListener("click", function() {\n    compteur++;\n    mettreAJour();\n});\n\ndocument.getElementById("moins").addEventListener("click", function() {\n    compteur--;\n    mettreAJour();\n});\n\ndocument.getElementById("reset").addEventListener("click", function() {\n    compteur = 0;\n    mettreAJour();\n});\n</script>',
  'HTML + JavaScript Solution:\n\n<div>\n    <h2>Counter: <span id="counter">0</span></h2>\n    <button id="plus">+</button>\n    <button id="minus">-</button>\n    <button id="reset">Reset</button>\n</div>\n\n<script>\nlet counter = 0;\nconst display = document.getElementById("counter");\n\nfunction update() {\n    display.textContent = counter;\n}\n\ndocument.getElementById("plus").addEventListener("click", function() {\n    counter++;\n    update();\n});\n\ndocument.getElementById("minus").addEventListener("click", function() {\n    counter--;\n    update();\n});\n\ndocument.getElementById("reset").addEventListener("click", function() {\n    counter = 0;\n    update();\n});\n</script>',
  'حل HTML + JavaScript:\n\n<div>\n    <h2>العداد: <span id="compteur">0</span></h2>\n    <button id="plus">+</button>\n    <button id="moins">-</button>\n    <button id="reset">إعادة تعيين</button>\n</div>\n\n<script>\nlet compteur = 0;\nconst affichage = document.getElementById("compteur");\n\nfunction mettreAJour() {\n    affichage.textContent = compteur;\n}\n\ndocument.getElementById("plus").addEventListener("click", function() {\n    compteur++;\n    mettreAJour();\n});\n\ndocument.getElementById("moins").addEventListener("click", function() {\n    compteur--;\n    mettreAJour();\n});\n\ndocument.getElementById("reset").addEventListener("click", function() {\n    compteur = 0;\n    mettreAJour();\n});\n</script>',
  'CODING', 4, 3, NOW(), NOW()
);

-- QCM pour leçon 2.4 (5 questions)
INSERT INTO quiz_questions (exercise_id, question_fr, question_en, question_ar,
                           correct_answer_index, explanation_fr, explanation_en, explanation_ar)
VALUES 
(
  (SELECT id FROM exercises WHERE course_id = 2 AND lesson_id = (SELECT id FROM lessons WHERE course_id = 2 AND order_index = 4) AND order_index = 4),
  'Quelle méthode JavaScript permet de sélectionner un élément par son ID ?',
  'Which JavaScript method allows selecting an element by its ID?',
  'أي طريقة JavaScript تسمح بتحديد عنصر حسب معرفه؟',
  0,
  'getElementById("id") sélectionne un élément unique par son attribut id. C''est la méthode la plus directe pour cibler un élément spécifique.',
  'getElementById("id") selects a unique element by its id attribute. It is the most direct method to target a specific element.',
  'getElementById("id") يحدد عنصرًا فريدًا حسب سمة id. إنها الطريقة الأكثر مباشرة لاستهداف عنصر محدد.'
),
(
  (SELECT id FROM exercises WHERE course_id = 2 AND lesson_id = (SELECT id FROM lessons WHERE course_id = 2 AND order_index = 4) AND order_index = 4),
  'Quelle méthode permet d''écouter un événement sur un élément ?',
  'Which method allows listening to an event on an element?',
  'أي طريقة تسمح بالاستماع لحدث على عنصر؟',
  1,
  'addEventListener("event", function) permet d''écouter un événement (comme "click", "submit") et d''exécuter une fonction quand l''événement se produit.',
  'addEventListener("event", function) allows listening to an event (like "click", "submit") and executing a function when the event occurs.',
  'addEventListener("event", function) تسمح بالاستماع لحدث (مثل "click"، "submit") وتنفيذ دالة عند حدوث الحدث.'
),
(
  (SELECT id FROM exercises WHERE course_id = 2 AND lesson_id = (SELECT id FROM lessons WHERE course_id = 2 AND order_index = 4) AND order_index = 4),
  'Qu''est-ce que le DOM en JavaScript ?',
  'What is the DOM in JavaScript?',
  'ما هو DOM في JavaScript؟',
  2,
  'Le DOM (Document Object Model) est la représentation de la page HTML sous forme d''objets JavaScript. Il permet à JavaScript d''accéder et de modifier les éléments de la page.',
  'The DOM (Document Object Model) is the representation of the HTML page as JavaScript objects. It allows JavaScript to access and modify page elements.',
  'DOM (نموذج كائن المستند) هو تمثيل صفحة HTML ككائنات JavaScript. يسمح لـ JavaScript بالوصول إلى عناصر الصفحة وتعديلها.'
),
(
  (SELECT id FROM exercises WHERE course_id = 2 AND lesson_id = (SELECT id FROM lessons WHERE course_id = 2 AND order_index = 4) AND order_index = 4),
  'Comment déclarer une variable constante en JavaScript moderne ?',
  'How to declare a constant variable in modern JavaScript?',
  'كيف تعلن متغيرًا ثابتًا في JavaScript الحديث؟',
  3,
  'const permet de déclarer une variable constante qui ne peut pas être réassignée. C''est la méthode recommandée pour les valeurs qui ne changent pas.',
  'const allows declaring a constant variable that cannot be reassigned. It is the recommended method for values that do not change.',
  'const تسمح بإعلان متغير ثابت لا يمكن إعادة تعيينه. إنها الطريقة الموصى بها للقيم التي لا تتغير.'
),
(
  (SELECT id FROM exercises WHERE course_id = 2 AND lesson_id = (SELECT id FROM lessons WHERE course_id = 2 AND order_index = 4) AND order_index = 4),
  'Que fait l''opérateur ++ en JavaScript ?',
  'What does the ++ operator do in JavaScript?',
  'ماذا يفعل العامل ++ في JavaScript؟',
  0,
  'L''opérateur ++ incrémente (augmente de 1) une variable. compteur++ est équivalent à compteur = compteur + 1. Il existe aussi -- pour décrémenter.',
  'The ++ operator increments (increases by 1) a variable. counter++ is equivalent to counter = counter + 1. There is also -- to decrement.',
  'العامل ++ يزيد (يزيد بمقدار 1) متغير. compteur++ يعادل compteur = compteur + 1. يوجد أيضًا -- للتقليل.'
);

-- PROJET FINAL COURS 2: Site web personnel
INSERT INTO exercises (course_id, lesson_id, title_fr, title_en, title_ar,
                      description_fr, description_en, description_ar,
                      solution_fr, solution_en, solution_ar,
                      type, order_index, difficulty, created_at, updated_at)
VALUES (
  2, NULL,
  'PROJET FINAL : Site web personnel interactif',
  'FINAL PROJECT: Interactive Personal Website',
  'المشروع النهائي: موقع ويب شخصي تفاعلي',
  'Créez un site web personnel complet avec :\n1. Page d''accueil avec présentation\n2. Section "À propos" avec votre parcours\n3. Section "Compétences" avec des cartes stylisées\n4. Section "Contact" avec formulaire\n5. Navigation entre sections\n6. Animations CSS au survol\n7. JavaScript pour validation du formulaire\n8. Design responsive et moderne\n\nUtilisez HTML, CSS et JavaScript pur.',
  'Create a complete personal website with:\n1. Home page with introduction\n2. "About" section with your journey\n3. "Skills" section with styled cards\n4. "Contact" section with form\n5. Navigation between sections\n6. CSS hover animations\n7. JavaScript for form validation\n8. Responsive and modern design\n\nUse pure HTML, CSS and JavaScript.',
  'أنشئ موقع ويب شخصي كامل مع:\n1. صفحة رئيسية مع مقدمة\n2. قسم "حول" مع رحلتك\n3. قسم "المهارات" مع بطاقات منسقة\n4. قسم "اتصل" مع نموذج\n5. تنقل بين الأقسام\n6. رسوم متحركة CSS عند التمرير\n7. JavaScript للتحقق من النموذج\n8. تصميم متجاوب وحديث\n\nاستخدم HTML و CSS و JavaScript خالص.',
  'Structure recommandée :\n\n1. HTML :\n   - <header> avec navigation\n   - <section id="accueil">\n   - <section id="apropos">\n   - <section id="competences">\n   - <section id="contact"> avec <form>\n   - <footer>\n\n2. CSS :\n   - Variables CSS pour les couleurs\n   - Flexbox/Grid pour la mise en page\n   - Media queries pour le responsive\n   - Animations et transitions\n\n3. JavaScript :\n   - Navigation smooth scroll\n   - Validation formulaire\n   - Affichage dynamique\n\nVoir les fichiers du projet frontend pour des exemples complets.',
  'Recommended structure:\n\n1. HTML:\n   - <header> with navigation\n   - <section id="home">\n   - <section id="about">\n   - <section id="skills">\n   - <section id="contact"> with <form>\n   - <footer>\n\n2. CSS:\n   - CSS variables for colors\n   - Flexbox/Grid for layout\n   - Media queries for responsive\n   - Animations and transitions\n\n3. JavaScript:\n   - Smooth scroll navigation\n   - Form validation\n   - Dynamic display\n\nSee frontend project files for complete examples.',
  'البنية الموصى بها:\n\n1. HTML:\n   - <header> مع التنقل\n   - <section id="accueil">\n   - <section id="apropos">\n   - <section id="competences">\n   - <section id="contact"> مع <form>\n   - <footer>\n\n2. CSS:\n   - متغيرات CSS للألوان\n   - Flexbox/Grid للتخطيط\n   - استعلامات الوسائط للمتجاوبة\n   - الرسوم المتحركة والانتقالات\n\n3. JavaScript:\n   - تنقل تمرير سلس\n   - التحقق من النموذج\n   - عرض ديناميكي\n\nانظر ملفات مشروع frontend لأمثلة كاملة.',
  'PROJECT', 10, 4, NOW(), NOW()
);

-- ============================================
-- COURS 4: Angular et TypeScript - COMPLÉTION
-- ============================================

-- Leçon 4.3: Services Angular
INSERT INTO lessons (course_id, title_fr, title_en, title_ar, content_fr, content_en, content_ar,
                     key_points_fr, key_points_en, key_points_ar,
                     analogies_fr, analogies_en, analogies_ar,
                     examples_fr, examples_en, examples_ar,
                     order_index, estimated_duration, created_at, updated_at)
VALUES (
  4,
  'Services Angular : Partager la logique métier',
  'Angular Services: Sharing Business Logic',
  'خدمات Angular: مشاركة منطق الأعمال',
  'Un service Angular est comme un assistant personnel : il contient la logique métier réutilisable que plusieurs composants peuvent utiliser. Au lieu de dupliquer le code dans chaque composant, vous créez un service une fois et tous les composants peuvent l''utiliser. C''est comme avoir un secrétaire commun à plusieurs bureaux.',
  'An Angular service is like a personal assistant: it contains reusable business logic that multiple components can use. Instead of duplicating code in each component, you create a service once and all components can use it. It''s like having a shared secretary for multiple offices.',
  'خدمة Angular مثل مساعد شخصي: تحتوي على منطق أعمال قابل لإعادة الاستخدام يمكن لعدة مكونات استخدامه. بدلاً من تكرار الكود في كل مكون، تنشئ خدمة مرة واحدة ويمكن لجميع المكونات استخدامها. إنه مثل وجود سكرتير مشترك لعدة مكاتب.',
  '1. Service = classe avec @Injectable()\n2. providedIn: ''root'' = service disponible partout\n3. Injection = utiliser le service dans un composant\n4. constructor(private service: ServiceName) = injection\n5. Services pour : API calls, logique métier, état partagé\n6. HttpClient = service Angular pour les requêtes HTTP',
  '1. Service = class with @Injectable()\n2. providedIn: ''root'' = service available everywhere\n3. Injection = use service in component\n4. constructor(private service: ServiceName) = injection\n5. Services for: API calls, business logic, shared state\n6. HttpClient = Angular service for HTTP requests',
  '1. الخدمة = فئة مع @Injectable()\n2. providedIn: ''root'' = الخدمة متاحة في كل مكان\n3. الحقن = استخدام الخدمة في مكون\n4. constructor(private service: ServiceName) = الحقن\n5. الخدمات لـ: استدعاءات API، منطق الأعمال، حالة مشتركة\n6. HttpClient = خدمة Angular لطلبات HTTP',
  3, 40, NOW(), NOW()
); ON CONFLICT (course_id, order_index) DO NOTHING;

-- Exercice 4.3
INSERT INTO exercises (course_id, lesson_id, title_fr, title_en, title_ar,
                      description_fr, description_en, description_ar,
                      solution_fr, solution_en, solution_ar,
                      type, order_index, difficulty, created_at, updated_at)
VALUES (
  4, (SELECT id FROM lessons WHERE course_id = 4 AND order_index = 3),
  'Exercice : Créer un service de cours',
  'Exercise: Create a Course Service',
  'تمرين: إنشاء خدمة كورسات',
  'Créez un service CourseService qui :\n1. Utilise HttpClient pour récupérer les cours depuis l''API\n2. A une méthode getAllCourses() qui retourne Observable<Course[]>\n3. A une méthode getCourseById(id) qui retourne Observable<Course>\n4. Injectez ce service dans CourseListComponent\n5. Utilisez le service pour afficher les cours',
  'Create a CourseService that:\n1. Uses HttpClient to fetch courses from the API\n2. Has a getAllCourses() method that returns Observable<Course[]>\n3. Has a getCourseById(id) method that returns Observable<Course>\n4. Inject this service into CourseListComponent\n5. Use the service to display courses',
  'أنشئ خدمة CourseService التي:\n1. تستخدم HttpClient لجلب الكورسات من API\n2. لديها طريقة getAllCourses() ترجع Observable<Course[]>\n3. لديها طريقة getCourseById(id) ترجع Observable<Course>\n4. احقن هذه الخدمة في CourseListComponent\n5. استخدم الخدمة لعرض الكورسات',
  'Solution :\n\n// course.service.ts\nimport { Injectable } from ''@angular/core'';\nimport { HttpClient } from ''@angular/common/http'';\nimport { Observable } from ''rxjs'';\n\n@Injectable({\n  providedIn: ''root''\n})\nexport class CourseService {\n  private apiUrl = ''http://localhost:8080/api'';\n  \n  constructor(private http: HttpClient) { }\n  \n  getAllCourses(): Observable<Course[]> {\n    return this.http.get<Course[]>(`${this.apiUrl}/courses`);\n  }\n  \n  getCourseById(id: number): Observable<Course> {\n    return this.http.get<Course>(`${this.apiUrl}/courses/${id}`);\n  }\n}\n\n// course-list.component.ts\nconstructor(private courseService: CourseService) { }\n\nngOnInit() {\n  this.courseService.getAllCourses().subscribe(courses => {\n    this.courses = courses;\n  });\n}',
  'Solution:\n\n// course.service.ts\nimport { Injectable } from ''@angular/core'';\nimport { HttpClient } from ''@angular/common/http'';\nimport { Observable } from ''rxjs'';\n\n@Injectable({\n  providedIn: ''root''\n})\nexport class CourseService {\n  private apiUrl = ''http://localhost:8080/api'';\n  \n  constructor(private http: HttpClient) { }\n  \n  getAllCourses(): Observable<Course[]> {\n    return this.http.get<Course[]>(`${this.apiUrl}/courses`);\n  }\n  \n  getCourseById(id: number): Observable<Course> {\n    return this.http.get<Course>(`${this.apiUrl}/courses/${id}`);\n  }\n}\n\n// course-list.component.ts\nconstructor(private courseService: CourseService) { }\n\nngOnInit() {\n  this.courseService.getAllCourses().subscribe(courses => {\n    this.courses = courses;\n  });\n}',
  'الحل:\n\n// course.service.ts\nimport { Injectable } from ''@angular/core'';\nimport { HttpClient } from ''@angular/common/http'';\nimport { Observable } from ''rxjs'';\n\n@Injectable({\n  providedIn: ''root''\n})\nexport class CourseService {\n  private apiUrl = ''http://localhost:8080/api'';\n  \n  constructor(private http: HttpClient) { }\n  \n  getAllCourses(): Observable<Course[]> {\n    return this.http.get<Course[]>(`${this.apiUrl}/courses`);\n  }\n  \n  getCourseById(id: number): Observable<Course> {\n    return this.http.get<Course>(`${this.apiUrl}/courses/${id}`);\n  }\n}\n\n// course-list.component.ts\nconstructor(private courseService: CourseService) { }\n\nngOnInit() {\n  this.courseService.getAllCourses().subscribe(courses => {\n    this.courses = courses;\n  });\n}',
  'CODING', 3, 3, NOW(), NOW()
);

-- QCM pour leçon 4.3 (4 questions)
INSERT INTO quiz_questions (exercise_id, question_fr, question_en, question_ar,
                           correct_answer_index, explanation_fr, explanation_en, explanation_ar)
VALUES 
(
  (SELECT id FROM exercises WHERE course_id = 4 AND lesson_id = (SELECT id FROM lessons WHERE course_id = 4 AND order_index = 3) AND order_index = 3),
  'Quel décorateur est utilisé pour créer un service Angular ?',
  'Which decorator is used to create an Angular service?',
  'أي مزخرف يُستخدم لإنشاء خدمة Angular؟',
  1,
  '@Injectable() est le décorateur qui transforme une classe en service Angular. Il permet à Angular de l''injecter dans d''autres composants ou services.',
  '@Injectable() is the decorator that turns a class into an Angular service. It allows Angular to inject it into other components or services.',
  '@Injectable() هو المزخرف الذي يحول فئة إلى خدمة Angular. يسمح لـ Angular بحقنها في مكونات أو خدمات أخرى.'
),
(
  (SELECT id FROM exercises WHERE course_id = 4 AND lesson_id = (SELECT id FROM lessons WHERE course_id = 4 AND order_index = 3) AND order_index = 3),
  'Comment injecter un service dans un composant ?',
  'How to inject a service into a component?',
  'كيف تحقن خدمة في مكون؟',
  0,
  'On injecte un service via le constructeur : constructor(private serviceName: ServiceName). Le mot-clé private crée automatiquement une propriété de classe.',
  'We inject a service via the constructor: constructor(private serviceName: ServiceName). The private keyword automatically creates a class property.',
  'نحقن خدمة عبر المُنشئ: constructor(private serviceName: ServiceName). كلمة private تنشئ تلقائيًا خاصية فئة.'
),
(
  (SELECT id FROM exercises WHERE course_id = 4 AND lesson_id = (SELECT id FROM lessons WHERE course_id = 4 AND order_index = 3) AND order_index = 3),
  'Quel service Angular est utilisé pour faire des requêtes HTTP ?',
  'Which Angular service is used to make HTTP requests?',
  'أي خدمة Angular تُستخدم لعمل طلبات HTTP؟',
  2,
  'HttpClient est le service Angular pour effectuer des requêtes HTTP (GET, POST, PUT, DELETE). Il retourne des Observables et doit être importé depuis @angular/common/http.',
  'HttpClient is the Angular service for making HTTP requests (GET, POST, PUT, DELETE). It returns Observables and must be imported from @angular/common/http.',
  'HttpClient هي خدمة Angular لعمل طلبات HTTP (GET، POST، PUT، DELETE). ترجع Observables ويجب استيرادها من @angular/common/http.'
),
(
  (SELECT id FROM exercises WHERE course_id = 4 AND lesson_id = (SELECT id FROM lessons WHERE course_id = 4 AND order_index = 3) AND order_index = 3),
  'Que signifie providedIn: ''root'' dans un service ?',
  'What does providedIn: ''root'' mean in a service?',
  'ماذا يعني providedIn: ''root'' في خدمة؟',
  3,
  'providedIn: ''root'' signifie que le service est disponible dans toute l''application (singleton). C''est la méthode recommandée pour les services partagés.',
  'providedIn: ''root'' means the service is available throughout the application (singleton). It is the recommended method for shared services.',
  'providedIn: ''root'' يعني أن الخدمة متاحة في جميع أنحاء التطبيق (singleton). إنها الطريقة الموصى بها للخدمات المشتركة.'
);

-- Leçon 4.4: Routing Angular
INSERT INTO lessons (course_id, title_fr, title_en, title_ar, content_fr, content_en, content_ar,
                     key_points_fr, key_points_en, key_points_ar,
                     analogies_fr, analogies_en, analogies_ar,
                     examples_fr, examples_en, examples_ar,
                     order_index, estimated_duration, created_at, updated_at)
VALUES (
  4,
  'Routing Angular : Navigation entre pages',
  'Angular Routing: Navigation Between Pages',
  'توجيه Angular: التنقل بين الصفحات',
  'Le routing Angular est comme un système de navigation GPS : vous définissez des routes (chemins) et quand l''utilisateur clique sur un lien ou tape une URL, Angular charge le bon composant (la bonne page). C''est comme avoir plusieurs pages dans un livre : chaque route est une page différente.',
  'Angular routing is like a GPS navigation system: you define routes (paths) and when the user clicks a link or types a URL, Angular loads the right component (the right page). It''s like having multiple pages in a book: each route is a different page.',
  'توجيه Angular مثل نظام ملاحة GPS: تحدد المسارات (المسالك) وعندما ينقر المستخدم على رابط أو يكتب URL، Angular يحمل المكون الصحيح (الصفحة الصحيحة). إنه مثل وجود عدة صفحات في كتاب: كل مسار صفحة مختلفة.',
  '1. Routes = chemins URL vers des composants\n2. RouterModule = module pour le routing\n3. RouterOutlet = où afficher le composant routé\n4. routerLink = directive pour créer des liens\n5. ActivatedRoute = accéder aux paramètres de route\n6. navigate() = méthode pour naviguer programmatiquement',
  '1. Routes = URL paths to components\n2. RouterModule = module for routing\n3. RouterOutlet = where to display routed component\n4. routerLink = directive to create links\n5. ActivatedRoute = access route parameters\n6. navigate() = method to navigate programmatically',
  '1. المسارات = مسالك URL إلى المكونات\n2. RouterModule = وحدة للتوجيه\n3. RouterOutlet = أين تعرض المكون الموجه\n4. routerLink = توجيه لإنشاء روابط\n5. ActivatedRoute = الوصول إلى معاملات المسار\n6. navigate() = طريقة للتنقل برمجيًا',
  4, 35, NOW(), NOW()
); ON CONFLICT (course_id, order_index) DO NOTHING;

-- PROJET FINAL COURS 4: Application Angular complète
INSERT INTO exercises (course_id, lesson_id, title_fr, title_en, title_ar,
                      description_fr, description_en, description_ar,
                      solution_fr, solution_en, solution_ar,
                      type, order_index, difficulty, created_at, updated_at)
VALUES (
  4, NULL,
  'PROJET FINAL : Application Angular de gestion de cours',
  'FINAL PROJECT: Angular Course Management Application',
  'المشروع النهائي: تطبيق Angular لإدارة الكورسات',
  'Créez une application Angular complète avec :\n1. Page d''accueil avec présentation\n2. Liste des cours avec cartes\n3. Détails d''un cours avec leçons\n4. Visualisation d''une leçon complète\n5. Service pour appeler l''API backend\n6. Routing entre les pages\n7. Support multilingue (FR, EN, AR)\n8. Design moderne et responsive\n\nUtilisez tous les concepts vus : composants, services, routing, HttpClient.',
  'Create a complete Angular application with:\n1. Home page with introduction\n2. Course list with cards\n3. Course details with lessons\n4. Complete lesson view\n5. Service to call backend API\n6. Routing between pages\n7. Multilingual support (FR, EN, AR)\n8. Modern and responsive design\n\nUse all concepts seen: components, services, routing, HttpClient.',
  'أنشئ تطبيق Angular كامل مع:\n1. صفحة رئيسية مع مقدمة\n2. قائمة الكورسات مع بطاقات\n3. تفاصيل كورس مع دروس\n4. عرض درس كامل\n5. خدمة لاستدعاء API الخلفي\n6. توجيه بين الصفحات\n7. دعم متعدد اللغات (FR، EN، AR)\n8. تصميم حديث ومتجاوب\n\nاستخدم جميع المفاهيم: المكونات، الخدمات، التوجيه، HttpClient.',
  'Structure recommandée :\n\n1. Composants :\n   - HomeComponent\n   - CourseListComponent\n   - CourseDetailComponent\n   - LessonViewComponent\n   - HeaderComponent, FooterComponent\n\n2. Services :\n   - CourseService (API calls)\n   - LessonService (API calls)\n   - LanguageService (i18n)\n\n3. Routing :\n   - / → HomeComponent\n   - /courses → CourseListComponent\n   - /courses/:id → CourseDetailComponent\n   - /lessons/:id → LessonViewComponent\n\nVoir le code source du projet frontend pour l''implémentation complète.',
  'Recommended structure:\n\n1. Components:\n   - HomeComponent\n   - CourseListComponent\n   - CourseDetailComponent\n   - LessonViewComponent\n   - HeaderComponent, FooterComponent\n\n2. Services:\n   - CourseService (API calls)\n   - LessonService (API calls)\n   - LanguageService (i18n)\n\n3. Routing:\n   - / → HomeComponent\n   - /courses → CourseListComponent\n   - /courses/:id → CourseDetailComponent\n   - /lessons/:id → LessonViewComponent\n\nSee frontend project source code for complete implementation.',
  'البنية الموصى بها:\n\n1. المكونات:\n   - HomeComponent\n   - CourseListComponent\n   - CourseDetailComponent\n   - LessonViewComponent\n   - HeaderComponent، FooterComponent\n\n2. الخدمات:\n   - CourseService (استدعاءات API)\n   - LessonService (استدعاءات API)\n   - LanguageService (i18n)\n\n3. التوجيه:\n   - / → HomeComponent\n   - /courses → CourseListComponent\n   - /courses/:id → CourseDetailComponent\n   - /lessons/:id → LessonViewComponent\n\nانظر كود المصدر لمشروع frontend للتنفيذ الكامل.',
  'PROJECT', 20, 5, NOW(), NOW()
);

-- ============================================
-- COURS 5: Bases de données PostgreSQL - COMPLÉTION
-- ============================================

-- Leçon 5.2: Requêtes SELECT
INSERT INTO lessons (course_id, title_fr, title_en, title_ar, content_fr, content_en, content_ar,
                     key_points_fr, key_points_en, key_points_ar,
                     analogies_fr, analogies_en, analogies_ar,
                     examples_fr, examples_en, examples_ar,
                     order_index, estimated_duration, created_at, updated_at)
VALUES (
  5,
  'Requêtes SELECT : Lire les données',
  'SELECT Queries: Reading Data',
  'استعلامات SELECT: قراءة البيانات',
  'SELECT est comme poser une question à la base de données : "Montre-moi tous les cours" ou "Montre-moi les étudiants de plus de 20 ans". La base de données cherche dans les tables et vous retourne les résultats. C''est comme chercher dans un annuaire : vous spécifiez ce que vous voulez trouver.',
  'SELECT is like asking a question to the database: "Show me all courses" or "Show me students over 20 years old". The database searches the tables and returns the results. It''s like searching in a directory: you specify what you want to find.',
  'SELECT مثل طرح سؤال على قاعدة البيانات: "أرني جميع الكورسات" أو "أرني الطلاب فوق 20 سنة". قاعدة البيانات تبحث في الجداول وترجع النتائج. إنه مثل البحث في دليل: تحدد ما تريد العثور عليه.',
  '1. SELECT = choisir les colonnes à afficher\n2. FROM = table à interroger\n3. WHERE = conditions de filtrage\n4. ORDER BY = trier les résultats\n5. LIMIT = limiter le nombre de résultats\n6. DISTINCT = éliminer les doublons\n7. AS = alias pour renommer colonnes',
  '1. SELECT = choose columns to display\n2. FROM = table to query\n3. WHERE = filtering conditions\n4. ORDER BY = sort results\n5. LIMIT = limit number of results\n6. DISTINCT = eliminate duplicates\n7. AS = alias to rename columns',
  '1. SELECT = اختر الأعمدة للعرض\n2. FROM = الجدول للاستعلام\n3. WHERE = شروط التصفية\n4. ORDER BY = ترتيب النتائج\n5. LIMIT = تحديد عدد النتائج\n6. DISTINCT = إزالة التكرارات\n7. AS = اسم مستعار لإعادة تسمية الأعمدة',
  2, 30, NOW(), NOW()
); ON CONFLICT (course_id, order_index) DO NOTHING;

-- Exercice 5.2
INSERT INTO exercises (course_id, lesson_id, title_fr, title_en, title_ar,
                      description_fr, description_en, description_ar,
                      solution_fr, solution_en, solution_ar,
                      type, order_index, difficulty, created_at, updated_at)
VALUES (
  5, (SELECT id FROM lessons WHERE course_id = 5 AND order_index = 2),
  'Exercice : Requêtes SELECT complexes',
  'Exercise: Complex SELECT Queries',
  'تمرين: استعلامات SELECT معقدة',
  'Écrivez des requêtes SQL pour :\n1. Sélectionner tous les cours de niveau BEGINNER\n2. Sélectionner les cours triés par order_index\n3. Sélectionner les 5 premiers cours\n4. Sélectionner les cours dont le titre contient "Java"\n5. Compter le nombre total de cours',
  'Write SQL queries to:\n1. Select all courses with BEGINNER level\n2. Select courses sorted by order_index\n3. Select the first 5 courses\n4. Select courses whose title contains "Java"\n5. Count the total number of courses',
  'اكتب استعلامات SQL لـ:\n1. تحديد جميع الكورسات بمستوى BEGINNER\n2. تحديد الكورسات مرتبة حسب order_index\n3. تحديد أول 5 كورسات\n4. تحديد الكورسات التي يحتوي عنوانها على "Java"\n5. عد العدد الإجمالي للكورسات',
  'Solutions SQL :\n\n1. SELECT * FROM courses WHERE level = ''BEGINNER'';\n\n2. SELECT * FROM courses ORDER BY order_index ASC;\n\n3. SELECT * FROM courses ORDER BY order_index ASC LIMIT 5;\n\n4. SELECT * FROM courses WHERE title_fr LIKE ''%Java%'' OR title_en LIKE ''%Java%'';\n\n5. SELECT COUNT(*) AS total_courses FROM courses;',
  'SQL Solutions:\n\n1. SELECT * FROM courses WHERE level = ''BEGINNER'';\n\n2. SELECT * FROM courses ORDER BY order_index ASC;\n\n3. SELECT * FROM courses ORDER BY order_index ASC LIMIT 5;\n\n4. SELECT * FROM courses WHERE title_fr LIKE ''%Java%'' OR title_en LIKE ''%Java%'';\n\n5. SELECT COUNT(*) AS total_courses FROM courses;',
  'حلول SQL:\n\n1. SELECT * FROM courses WHERE level = ''BEGINNER'';\n\n2. SELECT * FROM courses ORDER BY order_index ASC;\n\n3. SELECT * FROM courses ORDER BY order_index ASC LIMIT 5;\n\n4. SELECT * FROM courses WHERE title_fr LIKE ''%Java%'' OR title_en LIKE ''%Java%'';\n\n5. SELECT COUNT(*) AS total_courses FROM courses;',
  'CODING', 2, 3, NOW(), NOW()
);

-- QCM pour leçon 5.2 (5 questions)
INSERT INTO quiz_questions (exercise_id, question_fr, question_en, question_ar,
                           correct_answer_index, explanation_fr, explanation_en, explanation_ar)
VALUES 
(
  (SELECT id FROM exercises WHERE course_id = 5 AND lesson_id = (SELECT id FROM lessons WHERE course_id = 5 AND order_index = 2) AND order_index = 2),
  'Quelle clause SQL permet de filtrer les résultats ?',
  'Which SQL clause allows filtering results?',
  'أي بند SQL يسمح بتصفية النتائج؟',
  1,
  'La clause WHERE permet de filtrer les résultats selon des conditions. Exemple : WHERE age > 18 affiche seulement les enregistrements où age est supérieur à 18.',
  'The WHERE clause allows filtering results according to conditions. Example: WHERE age > 18 displays only records where age is greater than 18.',
  'بند WHERE يسمح بتصفية النتائج حسب الشروط. مثال: WHERE age > 18 يعرض فقط السجلات حيث age أكبر من 18.'
),
(
  (SELECT id FROM exercises WHERE course_id = 5 AND lesson_id = (SELECT id FROM lessons WHERE course_id = 5 AND order_index = 2) AND order_index = 2),
  'Comment trier les résultats par ordre croissant ?',
  'How to sort results in ascending order?',
  'كيف ترتب النتائج بترتيب تصاعدي؟',
  2,
  'ORDER BY colonne ASC trie les résultats par ordre croissant. ASC est optionnel (ordre par défaut). Pour décroissant, utilisez DESC.',
  'ORDER BY column ASC sorts results in ascending order. ASC is optional (default order). For descending, use DESC.',
  'ORDER BY column ASC يرتب النتائج بترتيب تصاعدي. ASC اختياري (الترتيب الافتراضي). للتنازلي، استخدم DESC.'
),
(
  (SELECT id FROM exercises WHERE course_id = 5 AND lesson_id = (SELECT id FROM lessons WHERE course_id = 5 AND order_index = 2) AND order_index = 2),
  'Quel opérateur SQL permet de rechercher un motif dans une chaîne ?',
  'Which SQL operator allows searching for a pattern in a string?',
  'أي عامل SQL يسمح بالبحث عن نمط في سلسلة؟',
  3,
  'L''opérateur LIKE permet de rechercher un motif. % représente n''importe quels caractères. Exemple : WHERE nom LIKE ''%Ahmed%'' trouve tous les noms contenant "Ahmed".',
  'The LIKE operator allows searching for a pattern. % represents any characters. Example: WHERE name LIKE ''%Ahmed%'' finds all names containing "Ahmed".',
  'العامل LIKE يسمح بالبحث عن نمط. % يمثل أي أحرف. مثال: WHERE nom LIKE ''%Ahmed%'' يجد جميع الأسماء التي تحتوي على "Ahmed".'
),
(
  (SELECT id FROM exercises WHERE course_id = 5 AND lesson_id = (SELECT id FROM lessons WHERE course_id = 5 AND order_index = 2) AND order_index = 2),
  'Que fait la fonction COUNT(*) en SQL ?',
  'What does the COUNT(*) function do in SQL?',
  'ماذا تفعل دالة COUNT(*) في SQL؟',
  0,
  'COUNT(*) compte le nombre total de lignes dans le résultat. C''est très utile pour connaître le nombre d''enregistrements qui correspondent à une condition.',
  'COUNT(*) counts the total number of rows in the result. It is very useful to know the number of records that match a condition.',
  'COUNT(*) تعد العدد الإجمالي للصفوف في النتيجة. إنه مفيد جدًا لمعرفة عدد السجلات التي تطابق شرطًا.'
),
(
  (SELECT id FROM exercises WHERE course_id = 5 AND lesson_id = (SELECT id FROM lessons WHERE course_id = 5 AND order_index = 2) AND order_index = 2),
  'Comment limiter le nombre de résultats retournés ?',
  'How to limit the number of results returned?',
  'كيف تحد من عدد النتائج المرجعة؟',
  1,
  'La clause LIMIT permet de limiter le nombre de résultats. LIMIT 10 retourne seulement les 10 premiers résultats. Très utile pour la pagination.',
  'The LIMIT clause allows limiting the number of results. LIMIT 10 returns only the first 10 results. Very useful for pagination.',
  'بند LIMIT يسمح بتحديد عدد النتائج. LIMIT 10 ترجع فقط أول 10 نتائج. مفيد جدًا للترقيم.'
);

-- Leçon 5.3: Relations et JOIN
INSERT INTO lessons (course_id, title_fr, title_en, title_ar, content_fr, content_en, content_ar,
                     key_points_fr, key_points_en, key_points_ar,
                     analogies_fr, analogies_en, analogies_ar,
                     examples_fr, examples_en, examples_ar,
                     order_index, estimated_duration, created_at, updated_at)
VALUES (
  5,
  'Relations et JOIN : Connecter les tables',
  'Relations and JOIN: Connecting Tables',
  'العلاقات و JOIN: ربط الجداول',
  'Les JOIN sont comme des ponts entre des tables : si vous avez une table "Cours" et une table "Leçons", un JOIN vous permet de voir les leçons de chaque cours ensemble. C''est comme avoir deux classeurs (tables) et les ouvrir côte à côte pour voir les informations liées.',
  'JOINs are like bridges between tables: if you have a "Courses" table and a "Lessons" table, a JOIN allows you to see the lessons of each course together. It''s like having two filing cabinets (tables) and opening them side by side to see related information.',
  'JOINs مثل جسور بين الجداول: إذا كان لديك جدول "الكورسات" وجدول "الدروس"، JOIN يسمح لك برؤية دروس كل كورس معًا. إنه مثل وجود خزانتي ملفات (جداول) وفتحهما جنبًا إلى جنب لرؤية المعلومات المرتبطة.',
  '1. Clé étrangère = lien entre deux tables\n2. INNER JOIN = seulement les correspondances\n3. LEFT JOIN = tous les éléments de la table gauche\n4. RIGHT JOIN = tous les éléments de la table droite\n5. ON = condition de jointure\n6. Alias = nom court pour les tables (c, l)',
  '1. Foreign key = link between two tables\n2. INNER JOIN = only matches\n3. LEFT JOIN = all elements from left table\n4. RIGHT JOIN = all elements from right table\n5. ON = join condition\n6. Alias = short name for tables (c, l)',
  '1. المفتاح الخارجي = رابط بين جدولين\n2. INNER JOIN = فقط التطابقات\n3. LEFT JOIN = جميع عناصر الجدول الأيسر\n4. RIGHT JOIN = جميع عناصر الجدول الأيمن\n5. ON = شرط الربط\n6. الاسم المستعار = اسم قصير للجداول (c، l)',
  3, 40, NOW(), NOW()
); ON CONFLICT (course_id, order_index) DO NOTHING;

-- Exercice 5.3
INSERT INTO exercises (course_id, lesson_id, title_fr, title_en, title_ar,
                      description_fr, description_en, description_ar,
                      solution_fr, solution_en, solution_ar,
                      type, order_index, difficulty, created_at, updated_at)
VALUES (
  5, (SELECT id FROM lessons WHERE course_id = 5 AND order_index = 3),
  'Exercice : Requêtes avec JOIN',
  'Exercise: Queries with JOIN',
  'تمرين: استعلامات مع JOIN',
  'Écrivez des requêtes SQL avec JOIN pour :\n1. Afficher tous les cours avec leurs leçons\n2. Afficher les leçons d''un cours spécifique (id=1)\n3. Compter le nombre de leçons par cours\n4. Afficher les cours qui ont au moins 3 leçons',
  'Write SQL queries with JOIN to:\n1. Display all courses with their lessons\n2. Display lessons of a specific course (id=1)\n3. Count the number of lessons per course\n4. Display courses that have at least 3 lessons',
  'اكتب استعلامات SQL مع JOIN لـ:\n1. عرض جميع الكورسات مع دروسها\n2. عرض دروس كورس محدد (id=1)\n3. عد عدد الدروس لكل كورس\n4. عرض الكورسات التي لديها 3 دروس على الأقل',
  'Solutions SQL :\n\n1. SELECT c.title_fr, l.title_fr \n   FROM courses c\n   INNER JOIN lessons l ON c.id = l.course_id;\n\n2. SELECT l.* \n   FROM lessons l\n   INNER JOIN courses c ON l.course_id = c.id\n   WHERE c.id = 1;\n\n3. SELECT c.title_fr, COUNT(l.id) AS nb_lecons\n   FROM courses c\n   LEFT JOIN lessons l ON c.id = l.course_id\n   GROUP BY c.id, c.title_fr;\n\n4. SELECT c.title_fr, COUNT(l.id) AS nb_lecons\n   FROM courses c\n   INNER JOIN lessons l ON c.id = l.course_id\n   GROUP BY c.id, c.title_fr\n   HAVING COUNT(l.id) >= 3;',
  'SQL Solutions:\n\n1. SELECT c.title_fr, l.title_fr \n   FROM courses c\n   INNER JOIN lessons l ON c.id = l.course_id;\n\n2. SELECT l.* \n   FROM lessons l\n   INNER JOIN courses c ON l.course_id = c.id\n   WHERE c.id = 1;\n\n3. SELECT c.title_fr, COUNT(l.id) AS nb_lessons\n   FROM courses c\n   LEFT JOIN lessons l ON c.id = l.course_id\n   GROUP BY c.id, c.title_fr;\n\n4. SELECT c.title_fr, COUNT(l.id) AS nb_lessons\n   FROM courses c\n   INNER JOIN lessons l ON c.id = l.course_id\n   GROUP BY c.id, c.title_fr\n   HAVING COUNT(l.id) >= 3;',
  'حلول SQL:\n\n1. SELECT c.title_fr, l.title_fr \n   FROM courses c\n   INNER JOIN lessons l ON c.id = l.course_id;\n\n2. SELECT l.* \n   FROM lessons l\n   INNER JOIN courses c ON l.course_id = c.id\n   WHERE c.id = 1;\n\n3. SELECT c.title_fr, COUNT(l.id) AS nb_lecons\n   FROM courses c\n   LEFT JOIN lessons l ON c.id = l.course_id\n   GROUP BY c.id, c.title_fr;\n\n4. SELECT c.title_fr, COUNT(l.id) AS nb_lecons\n   FROM courses c\n   INNER JOIN lessons l ON c.id = l.course_id\n   GROUP BY c.id, c.title_fr\n   HAVING COUNT(l.id) >= 3;',
  'CODING', 3, 4, NOW(), NOW()
);

-- QCM pour leçon 5.3 (4 questions)
INSERT INTO quiz_questions (exercise_id, question_fr, question_en, question_ar,
                           correct_answer_index, explanation_fr, explanation_en, explanation_ar)
VALUES 
(
  (SELECT id FROM exercises WHERE course_id = 5 AND lesson_id = (SELECT id FROM lessons WHERE course_id = 5 AND order_index = 3) AND order_index = 3),
  'Quelle est la différence entre INNER JOIN et LEFT JOIN ?',
  'What is the difference between INNER JOIN and LEFT JOIN?',
  'ما الفرق بين INNER JOIN و LEFT JOIN؟',
  2,
  'INNER JOIN retourne seulement les lignes qui ont une correspondance dans les deux tables. LEFT JOIN retourne toutes les lignes de la table de gauche, même s''il n''y a pas de correspondance dans la table de droite.',
  'INNER JOIN returns only rows that have a match in both tables. LEFT JOIN returns all rows from the left table, even if there is no match in the right table.',
  'INNER JOIN ترجع فقط الصفوف التي لها تطابق في كلا الجدولين. LEFT JOIN ترجع جميع الصفوف من الجدول الأيسر، حتى لو لم يكن هناك تطابق في الجدول الأيمن.'
),
(
  (SELECT id FROM exercises WHERE course_id = 5 AND lesson_id = (SELECT id FROM lessons WHERE course_id = 5 AND order_index = 3) AND order_index = 3),
  'À quoi sert la clause ON dans un JOIN ?',
  'What is the ON clause used for in a JOIN?',
  'ما فائدة بند ON في JOIN؟',
  1,
  'La clause ON définit la condition de jointure, c''est-à-dire comment les deux tables sont liées. Exemple : ON courses.id = lessons.course_id lie les cours à leurs leçons.',
  'The ON clause defines the join condition, i.e., how the two tables are linked. Example: ON courses.id = lessons.course_id links courses to their lessons.',
  'بند ON يحدد شرط الربط، أي كيف يتم ربط الجدولين. مثال: ON courses.id = lessons.course_id يربط الكورسات بدروسها.'
),
(
  (SELECT id FROM exercises WHERE course_id = 5 AND lesson_id = (SELECT id FROM lessons WHERE course_id = 5 AND order_index = 3) AND order_index = 3),
  'Qu''est-ce qu''une clé étrangère ?',
  'What is a foreign key?',
  'ما هو المفتاح الخارجي؟',
  0,
  'Une clé étrangère est une colonne qui référence la clé primaire d''une autre table. Elle crée un lien entre deux tables. Exemple : course_id dans la table lessons référence id dans la table courses.',
  'A foreign key is a column that references the primary key of another table. It creates a link between two tables. Example: course_id in the lessons table references id in the courses table.',
  'المفتاح الخارجي هو عمود يشير إلى المفتاح الأساسي لجدول آخر. ينشئ رابطًا بين جدولين. مثال: course_id في جدول lessons يشير إلى id في جدول courses.'
),
(
  (SELECT id FROM exercises WHERE course_id = 5 AND lesson_id = (SELECT id FROM lessons WHERE course_id = 5 AND order_index = 3) AND order_index = 3),
  'Quelle clause permet de filtrer après un GROUP BY ?',
  'Which clause allows filtering after a GROUP BY?',
  'أي بند يسمح بالتصفية بعد GROUP BY؟',
  3,
  'La clause HAVING permet de filtrer les résultats après un GROUP BY, contrairement à WHERE qui filtre avant le regroupement. HAVING COUNT(*) > 5 affiche seulement les groupes avec plus de 5 éléments.',
  'The HAVING clause allows filtering results after a GROUP BY, unlike WHERE which filters before grouping. HAVING COUNT(*) > 5 displays only groups with more than 5 elements.',
  'بند HAVING يسمح بتصفية النتائج بعد GROUP BY، على عكس WHERE الذي يصفّي قبل التجميع. HAVING COUNT(*) > 5 يعرض فقط المجموعات التي لديها أكثر من 5 عناصر.'
);

-- PROJET FINAL COURS 5: Base de données complète pour la plateforme
INSERT INTO exercises (course_id, lesson_id, title_fr, title_en, title_ar,
                      description_fr, description_en, description_ar,
                      solution_fr, solution_en, solution_ar,
                      type, order_index, difficulty, created_at, updated_at)
VALUES (
  5, NULL,
  'PROJET FINAL : Modélisation et requêtes complexes',
  'FINAL PROJECT: Complex Modeling and Queries',
  'المشروع النهائي: النمذجة والاستعلامات المعقدة',
  'Créez un schéma de base de données complet pour la plateforme avec :\n1. Tables : users, courses, lessons, exercises, quiz_questions, user_progress\n2. Relations avec clés étrangères\n3. Index pour optimiser les performances\n4. Requêtes complexes :\n   - Progression d''un utilisateur\n   - Statistiques par cours\n   - Top 10 des exercices les plus difficiles\n   - Utilisateurs ayant complété tous les cours\n5. Vues (views) pour simplifier les requêtes fréquentes',
  'Create a complete database schema for the platform with:\n1. Tables: users, courses, lessons, exercises, quiz_questions, user_progress\n2. Relations with foreign keys\n3. Indexes to optimize performance\n4. Complex queries:\n   - User progress\n   - Statistics per course\n   - Top 10 most difficult exercises\n   - Users who completed all courses\n5. Views to simplify frequent queries',
  'أنشئ مخطط قاعدة بيانات كامل للمنصة مع:\n1. جداول: users، courses، lessons، exercises، quiz_questions، user_progress\n2. علاقات مع مفاتيح خارجية\n3. فهارس لتحسين الأداء\n4. استعلامات معقدة:\n   - تقدم المستخدم\n   - إحصائيات لكل كورس\n   - أفضل 10 تمارين الأصعب\n   - المستخدمون الذين أكملوا جميع الكورسات\n5. عروض (views) لتبسيط الاستعلامات المتكررة',
  'Solution : Voir le schéma complet dans les modèles JPA du projet backend.\n\nExemple de requête complexe :\n\n-- Progression d''un utilisateur\nSELECT \n    c.title_fr,\n    COUNT(DISTINCT l.id) AS total_lecons,\n    COUNT(DISTINCT up.lesson_id) AS lecons_completes,\n    ROUND(COUNT(DISTINCT up.lesson_id) * 100.0 / COUNT(DISTINCT l.id), 2) AS pourcentage\nFROM courses c\nLEFT JOIN lessons l ON c.id = l.course_id\nLEFT JOIN user_progress up ON l.id = up.lesson_id AND up.user_id = 1\nWHERE up.status = ''COMPLETED'' OR up.status IS NULL\nGROUP BY c.id, c.title_fr;',
  'Solution: See complete schema in JPA models of backend project.\n\nExample of complex query:\n\n-- User progress\nSELECT \n    c.title_fr,\n    COUNT(DISTINCT l.id) AS total_lessons,\n    COUNT(DISTINCT up.lesson_id) AS completed_lessons,\n    ROUND(COUNT(DISTINCT up.lesson_id) * 100.0 / COUNT(DISTINCT l.id), 2) AS percentage\nFROM courses c\nLEFT JOIN lessons l ON c.id = l.course_id\nLEFT JOIN user_progress up ON l.id = up.lesson_id AND up.user_id = 1\nWHERE up.status = ''COMPLETED'' OR up.status IS NULL\nGROUP BY c.id, c.title_fr;',
  'الحل: انظر المخطط الكامل في نماذج JPA لمشروع backend.\n\nمثال على استعلام معقد:\n\n-- تقدم المستخدم\nSELECT \n    c.title_fr,\n    COUNT(DISTINCT l.id) AS total_lecons,\n    COUNT(DISTINCT up.lesson_id) AS lecons_completes,\n    ROUND(COUNT(DISTINCT up.lesson_id) * 100.0 / COUNT(DISTINCT l.id), 2) AS pourcentage\nFROM courses c\nLEFT JOIN lessons l ON c.id = l.course_id\nLEFT JOIN user_progress up ON l.id = up.lesson_id AND up.user_id = 1\nWHERE up.status = ''COMPLETED'' OR up.status IS NULL\nGROUP BY c.id, c.title_fr;',
  'PROJECT', 10, 5, NOW(), NOW()
);

-- ============================================
-- Note: Le contenu pour les cours 6-11 sera ajouté dans un fichier séparé
-- pour maintenir la lisibilité. Ce fichier contient déjà :
-- - Cours 2 complet (4 leçons + projet)
-- - Cours 4 partiel (3 leçons + projet)
-- - Cours 5 partiel (3 leçons + projet)
-- ============================================

