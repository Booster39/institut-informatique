# Deviens developpeur de sites et d'applications en 1 an

![Logo Institut de l'informatique](../frontend/src/assets/institut-logo.png)

## Module 7 (30 cours) - Projet complet et optimisation : architecture, performance, bonnes pratiques (version enseignant)

### Résumé
Ce module enseignant reprend le contenu du module étudiant avec réponses et explications détaillées.

Ce module ultime vous transforme en développeur professionnel en maîtrisant l'architecture logicielle avancée, l'optimisation des performances, et les meilleures pratiques de développement. Vous apprendrez à concevoir des systèmes maintenables, à optimiser les performances critiques, et à appliquer des méthodologies de développement professionnel. En refactorisant complètement votre application "Tâches" selon les principes SOLID, les patterns de conception, et les meilleures pratiques Python, vous créerez un projet de qualité production-ready. Ce module fait la synthèse de toute votre formation et vous prépare à devenir un développeur autonome et efficace.

### Rappel du projet fil rouge (on conserve "Tâches")
Tu vas repartir de l'application complète du Module 6 (infrastructure de production) et la transformer en projet professionnel :
1. Refactorer l'architecture selon les principes SOLID et les patterns de conception
2. Optimiser les performances avec profiling et concurrence
3. Implémenter les bonnes pratiques (tests, documentation, CI/CD avancé)
4. Mettre en place la gestion de projet et les revues de code
5. Préparer l'application pour la maintenance à long terme
6. Ajouter des fonctionnalités avancées (realtime, cache distribué, etc.)

### Hypothèses
- **Python avancé** : Maîtrise des concepts objets, décorateurs, générateurs
- **Architecture** : Compréhension des patterns MVC, API REST, microservices
- **Performance** : Notions de complexité algorithmique et optimisation
- **Tests** : Expérience avec pytest et tests unitaires/intégration
- **Git/GitHub** : Gestion de version avancée et collaboration
- **SQL** : Maîtrise des requêtes complexes et optimisation

### Rythme
- **4 cours par semaine** : Rythme intensif pour maîtriser les concepts avancés
- **30 cours pour ce module** : Environ 7 semaines et demie de perfectionnement professionnel
- **Chaque cours dure 1 heure** : Théorie sur les architectures avancées, démonstration d'optimisations, ateliers de refactoring, sessions de code review, et projet de synthèse

---

## Planning (30 cours)
| Cours | Thème principal | Objectif du cours |
|---:|---|---|
| 1 | Principes SOLID | Architecture logicielle et principes de conception |
| 2 | Patterns de conception | Implémentation des design patterns en Python |
| 3 | Clean Architecture | Séparation des couches et dépendances |
| 4 | Domain-Driven Design | Modélisation métier et bounded contexts |
| 5 | Architecture hexagonale | Ports & Adapters pattern |
| 6 | Profiling Python | Analyse des performances et identification des goulots |
| 7 | Optimisation algorithmique | Complexité et algorithmes efficaces |
| 8 | Concurrence et parallélisation | Asyncio, threading, multiprocessing |
| 9 | Cache avancé | Redis, cache distribué, stratégies de cache |
| 10 | Optimisation base de données | Index, requêtes, connection pooling |
| 11 | Tests avancés | TDD, tests de performance, mutation testing |
| 12 | Property-based testing | Génération automatique de tests |
| 13 | Tests d'intégration | Tests end-to-end et contract testing |
| 14 | Documentation avancée | Docstrings, Sphinx, API docs |
| 15 | Type hints et mypy | Typing statique en Python |
| 16 | Code quality | Linters, formatters, pre-commit hooks |
| 17 | CI/CD avancé | Quality gates, déploiement canary, feature flags |
| 18 | Code review | Bonnes pratiques et outils de review |
| 19 | Refactoring patterns | Techniques de refactoring sécurisé |
| 20 | Gestion de dette technique | Identification et réduction de la dette |
| 21 | Monitoring applicatif | Métriques métier et observabilité |
| 22 | Feature flags | Déploiement progressif et A/B testing |
| 23 | Gestion d'erreurs | Error handling et resilience patterns |
| 24 | Sécurité applicative | OWASP, sécurisation des APIs |
| 25 | Performance monitoring | APM et tracing distribué |
| 26 | Scalabilité horizontale | Microservices et event-driven architecture |
| 27 | Gestion de projet | Agile, estimation, planning poker |
| 28 | Revue finale du code | Audit complet et optimisation |
| 29 | Préparation production | Hardening et déploiement final |
| 30 | Soutenance module 7 | Démo du projet final et Q&A expert |

---

## Cours 1 - Principes SOLID
**Objectifs**
- Comprendre les 5 principes SOLID
- Appliquer SRP, OCP, LSP, ISP, DIP
- Refactorer du code legacy

**Leçon (30 min - détaillée)**
SOLID représente les principes fondamentaux de la conception orientée objet.

**Single Responsibility Principle (SRP)**
Une classe ne doit avoir qu'une seule raison de changer.

```python
# ❌ Mauvaise conception
class TaskManager:
    def create_task(self, data):
        # Validation
        # Sauvegarde DB
        # Envoi email
        # Log
        pass

# ✅ Bonne conception
class TaskValidator:
    def validate(self, data): pass

class TaskRepository:
    def save(self, task): pass

class EmailService:
    def send_notification(self, task): pass

class TaskLogger:
    def log_creation(self, task): pass

class TaskService:
    def __init__(self, validator, repository, email, logger):
        self.validator = validator
        self.repository = repository
        self.email = email
        self.logger = logger
    
    def create_task(self, data):
        self.validator.validate(data)
        task = self.repository.save(data)
        self.email.send_notification(task)
        self.logger.log_creation(task)
        return task
```

**Open/Closed Principle (OCP)**
Les entités doivent être ouvertes à l'extension, fermées à la modification.

```python
# ❌ Code non extensible
class TaskFilter:
    def filter(self, tasks, filter_type):
        if filter_type == 'completed':
            return [t for t in tasks if t.completed]
        elif filter_type == 'pending':
            return [t for t in tasks if not t.completed]
        elif filter_type == 'high_priority':
            return [t for t in tasks if t.priority == 'high']

# ✅ Code extensible
from abc import ABC, abstractmethod

class TaskFilter(ABC):
    @abstractmethod
    def matches(self, task):
        pass

class CompletedTaskFilter(TaskFilter):
    def matches(self, task):
        return task.completed

class PendingTaskFilter(TaskFilter):
    def matches(self, task):
        return not task.completed

class HighPriorityFilter(TaskFilter):
    def matches(self, task):
        return task.priority == 'high'

class TaskFilterService:
    def filter(self, tasks, filters):
        result = tasks
        for f in filters:
            result = [t for t in result if f.matches(t)]
        return result
```

**Liskov Substitution Principle (LSP)**
Les sous-classes doivent pouvoir remplacer leurs classes parentes.

```python
# ❌ Violation LSP
class Rectangle:
    def __init__(self, width, height):
        self.width = width
        self.height = height
    
    def set_width(self, width):
        self.width = width
    
    def set_height(self, height):
        self.height = height
    
    @property
    def area(self):
        return self.width * self.height

class Square(Rectangle):
    def set_width(self, width):
        self.width = width
        self.height = width  # Force le carré
    
    def set_height(self, height):
        self.width = height   # Force le carré
        self.height = height

# Test qui échoue
def test_rectangle_area(rect):
    rect.set_width(4)
    rect.set_height(5)
    assert rect.area == 20  # Échoue pour Square !

# ✅ Respect LSP
class Shape(ABC):
    @property
    @abstractmethod
    def area(self):
        pass

class Rectangle(Shape):
    def __init__(self, width, height):
        self.width = width
        self.height = height
    
    @property
    def area(self):
        return self.width * self.height

class Square(Shape):
    def __init__(self, side):
        self.side = side
    
    @property
    def area(self):
        return self.side * self.side
```

**Interface Segregation Principle (ISP)**
Les clients ne doivent pas dépendre d'interfaces qu'ils n'utilisent pas.

```python
# ❌ Interface trop large
class TaskService:
    def create_task(self, data): pass
    def update_task(self, id, data): pass
    def delete_task(self, id): pass
    def get_task(self, id): pass
    def list_tasks(self): pass
    def assign_task(self, task_id, user_id): pass
    def complete_task(self, id): pass
    def export_tasks(self, format): pass
    def import_tasks(self, data): pass

# ✅ Interfaces spécialisées
class TaskWriter(ABC):
    @abstractmethod
    def create_task(self, data): pass
    @abstractmethod
    def update_task(self, id, data): pass
    @abstractmethod
    def delete_task(self, id): pass

class TaskReader(ABC):
    @abstractmethod
    def get_task(self, id): pass
    @abstractmethod
    def list_tasks(self): pass

class TaskManager(ABC):
    @abstractmethod
    def assign_task(self, task_id, user_id): pass
    @abstractmethod
    def complete_task(self, id): pass

class TaskImporter(ABC):
    @abstractmethod
    def import_tasks(self, data): pass

class TaskExporter(ABC):
    @abstractmethod
    def export_tasks(self, format): pass
```

**Dependency Inversion Principle (DIP)**
Les modules de haut niveau ne doivent pas dépendre des modules de bas niveau.

```python
# ❌ Haute dépendance
class TaskService:
    def __init__(self):
        self.db = PostgreSQLConnection()  # Concret
    
    def get_tasks(self):
        return self.db.query("SELECT * FROM tasks")

# ✅ Inversion de dépendance
class DatabaseConnection(ABC):
    @abstractmethod
    def query(self, sql): pass

class PostgreSQLConnection(DatabaseConnection):
    def query(self, sql): pass

class TaskService:
    def __init__(self, db: DatabaseConnection):  # Abstraction
        self.db = db
    
    def get_tasks(self):
        return self.db.query("SELECT * FROM tasks")

# Injection de dépendance
def create_task_service():
    db = PostgreSQLConnection()
    return TaskService(db)
```

**Démonstration pratique (15 min)**
Refactorisation d'une classe legacy pour respecter les principes SOLID.

**Exercices guidés (10 min)**
1. Identifier les violations SOLID dans du code existant
2. Refactorer une classe pour respecter SRP
3. Implémenter OCP avec des stratégies polymorphiques

**QCM d'auto-évaluation (3 min)**
1. Que signifie SRP ?
2. Quel principe permet l'extension sans modification ?
3. Pourquoi ISP est important ?

**Devoir**
Refactorer une partie de l'application "Tâches" selon les principes SOLID.

---

## Cours 2 - Patterns de conception
**Objectifs**
- Maîtriser les patterns GoF en Python
- Implémenter Factory, Singleton, Observer, Strategy
- Choisir le bon pattern selon le contexte

**Leçon (30 min - détaillée)**
Les design patterns sont des solutions éprouvées aux problèmes récurrents.

**Creational Patterns - Patterns de création**

*Factory Method*
```python
from abc import ABC, abstractmethod

# ❌ Sans Factory
class Task:
    def __init__(self, task_type):
        if task_type == 'basic':
            self.priority = 'medium'
            self.due_date = None
        elif task_type == 'urgent':
            self.priority = 'high'
            self.due_date = datetime.now() + timedelta(hours=24)

# ✅ Avec Factory Method
class Task(ABC):
    def __init__(self, title, description):
        self.title = title
        self.description = description
        self.created_at = datetime.now()
    
    @abstractmethod
    def get_default_priority(self):
        pass

class BasicTask(Task):
    def get_default_priority(self):
        return 'medium'

class UrgentTask(Task):
    def get_default_priority(self):
        return 'high'
    
    def __init__(self, title, description):
        super().__init__(title, description)
        self.due_date = datetime.now() + timedelta(hours=24)

class TaskFactory:
    @staticmethod
    def create_task(task_type, title, description):
        if task_type == 'basic':
            return BasicTask(title, description)
        elif task_type == 'urgent':
            return UrgentTask(title, description)
        else:
            raise ValueError(f"Unknown task type: {task_type}")

# Utilisation
task = TaskFactory.create_task('urgent', 'Fix bug', 'Critical bug in production')
```

*Singleton*
```python
class DatabaseConnection:
    _instance = None
    
    def __new__(cls):
        if cls._instance is None:
            cls._instance = super().__new__(cls)
        return cls._instance
    
    def __init__(self):
        if not hasattr(self, 'initialized'):
            self.initialized = True
            self.connection = None
            self.connect()
    
    def connect(self):
        # Logique de connexion
        pass

# Utilisation thread-safe en Python
import threading

class ThreadSafeSingleton:
    _instance = None
    _lock = threading.Lock()
    
    def __new__(cls):
        if cls._instance is None:
            with cls._lock:
                if cls._instance is None:
                    cls._instance = super().__new__(cls)
        return cls._instance
```

**Structural Patterns - Patterns structurels**

*Adapter*
```python
# Interface cible
class NotificationService(ABC):
    @abstractmethod
    def send(self, message, recipient): pass

# Service existant incompatible
class LegacyEmailService:
    def send_email(self, to, subject, body):
        # Logique d'envoi
        pass

# Adapter
class EmailNotificationAdapter(NotificationService):
    def __init__(self, email_service: LegacyEmailService):
        self.email_service = email_service
    
    def send(self, message, recipient):
        self.email_service.send_email(recipient, "Notification", message)

# Utilisation
legacy_email = LegacyEmailService()
notification_service = EmailNotificationAdapter(legacy_email)
notification_service.send("Hello!", "user@example.com")
```

*Decorator*
```python
from functools import wraps

# Interface de base
class TaskRepository(ABC):
    @abstractmethod
    def save(self, task): pass
    @abstractmethod
    def get(self, task_id): pass

# Implémentation de base
class PostgreSQLTaskRepository(TaskRepository):
    def save(self, task): pass
    def get(self, task_id): pass

# Décorateur de cache
class CachedTaskRepository(TaskRepository):
    def __init__(self, repository: TaskRepository, cache):
        self.repository = repository
        self.cache = cache
    
    def save(self, task):
        result = self.repository.save(task)
        self.cache.invalidate(f"task:{task.id}")
        return result
    
    def get(self, task_id):
        cache_key = f"task:{task_id}"
        cached = self.cache.get(cache_key)
        if cached:
            return cached
        
        task = self.repository.get(task_id)
        self.cache.set(cache_key, task, ttl=300)
        return task

# Décorateur de logging
class LoggedTaskRepository(TaskRepository):
    def __init__(self, repository: TaskRepository, logger):
        self.repository = repository
        self.logger = logger
    
    def save(self, task):
        self.logger.info(f"Saving task {task.id}")
        try:
            result = self.repository.save(task)
            self.logger.info(f"Task {task.id} saved successfully")
            return result
        except Exception as e:
            self.logger.error(f"Failed to save task {task.id}: {e}")
            raise
    
    def get(self, task_id):
        self.logger.debug(f"Getting task {task_id}")
        return self.repository.get(task_id)

# Utilisation
base_repo = PostgreSQLTaskRepository()
cached_repo = CachedTaskRepository(base_repo, redis_cache)
logged_repo = LoggedTaskRepository(cached_repo, logger)
```

**Behavioral Patterns - Patterns comportementaux**

*Observer*
```python
from abc import ABC, abstractmethod
from typing import List

class Observer(ABC):
    @abstractmethod
    def update(self, subject): pass

class Subject(ABC):
    def __init__(self):
        self._observers: List[Observer] = []
    
    def attach(self, observer: Observer):
        self._observers.append(observer)
    
    def detach(self, observer: Observer):
        self._observers.remove(observer)
    
    def notify(self):
        for observer in self._observers:
            observer.update(self)

class Task(Subject):
    def __init__(self, title):
        super().__init__()
        self.title = title
        self.completed = False
    
    def complete(self):
        self.completed = True
        self.notify()

class TaskCompletionNotifier(Observer):
    def update(self, subject: Task):
        if subject.completed:
            print(f"Task '{subject.title}' has been completed!")

class TaskAuditLogger(Observer):
    def update(self, subject: Task):
        print(f"Audit: Task '{subject.title}' status changed")

# Utilisation
task = Task("Implement login")
task.attach(TaskCompletionNotifier())
task.attach(TaskAuditLogger())

task.complete()  # Notifie tous les observers
```

*Strategy*
```python
from abc import ABC, abstractmethod

class ExportStrategy(ABC):
    @abstractmethod
    def export(self, tasks): pass

class JSONExportStrategy(ExportStrategy):
    def export(self, tasks):
        import json
        return json.dumps([task.__dict__ for task in tasks])

class CSVExportStrategy(ExportStrategy):
    def export(self, tasks):
        import csv
        from io import StringIO
        
        output = StringIO()
        writer = csv.DictWriter(output, fieldnames=['id', 'title', 'completed'])
        writer.writeheader()
        for task in tasks:
            writer.writerow({
                'id': task.id,
                'title': task.title,
                'completed': task.completed
            })
        return output.getvalue()

class PDFExportStrategy(ExportStrategy):
    def export(self, tasks):
        # Utiliser reportlab ou similaire
        pass

class TaskExporter:
    def __init__(self, strategy: ExportStrategy):
        self.strategy = strategy
    
    def export(self, tasks):
        return self.strategy.export(tasks)
    
    def set_strategy(self, strategy: ExportStrategy):
        self.strategy = strategy

# Utilisation
exporter = TaskExporter(JSONExportStrategy())
json_data = exporter.export(tasks)

exporter.set_strategy(CSVExportStrategy())
csv_data = exporter.export(tasks)
```

**Démonstration pratique (15 min)**
Implémentation de plusieurs patterns dans l'application "Tâches".

**Exercices guidés (10 min)**
1. Implémenter un Factory pour créer différents types de tâches
2. Ajouter un système d'observeurs pour les notifications
3. Créer des stratégies d'export pour les tâches

**QCM d'auto-évaluation (3 min)**
1. Quel pattern pour créer des objets sans spécifier la classe ?
2. Quel pattern pour étendre le comportement sans modifier la classe ?
3. Quel pattern pour notifier plusieurs objets ?

**Devoir**
Appliquer 3 patterns de conception différents dans l'application "Tâches".

---

## Cours 3 - Clean Architecture
**Objectifs**
- Comprendre la Clean Architecture de Uncle Bob
- Séparer les couches (Entities, Use Cases, Interface Adapters, Frameworks)
- Inverser les dépendances

**Leçon (30 min - détaillée)**
La Clean Architecture organise le code en couches concentriques avec des dépendances vers l'intérieur.

**Les couches de Clean Architecture**

```
Frameworks & Drivers    (couche externe - dépendances concrètes)
    ↓
Interface Adapters      (Controllers, Gateways, Presenters)
    ↓  
Use Cases              (Application Business Rules)
    ↓
Entities               (Enterprise Business Rules)
```

**Entities - Règles métier enterprise**
```python
# entities/task.py
from dataclasses import dataclass
from typing import Optional
from datetime import datetime

@dataclass
class Task:
    id: Optional[int]
    title: str
    description: str
    completed: bool = False
    priority: str = 'medium'
    created_at: datetime = None
    updated_at: datetime = None
    
    def __post_init__(self):
        if self.created_at is None:
            self.created_at = datetime.now()
        if self.updated_at is None:
            self.updated_at = datetime.now()
    
    def mark_completed(self):
        self.completed = True
        self.updated_at = datetime.now()
    
    def is_overdue(self) -> bool:
        # Logique métier pour déterminer si la tâche est en retard
        return False  # Implémentation simplifiée
    
    def can_be_assigned_to(self, user) -> bool:
        # Règles métier pour l'assignation
        return True

@dataclass
class User:
    id: Optional[int]
    username: str
    email: str
    role: str = 'user'
    
    def has_permission(self, permission: str) -> bool:
        # Logique d'autorisation
        if self.role == 'admin':
            return True
        return permission in ['read_tasks', 'create_tasks']
```

**Use Cases - Règles métier applicatives**
```python
# use_cases/task_use_cases.py
from abc import ABC, abstractmethod
from typing import List, Optional
from entities.task import Task, User

class TaskRepository(ABC):
    @abstractmethod
    def save(self, task: Task) -> Task: pass
    
    @abstractmethod
    def get_by_id(self, task_id: int) -> Optional[Task]: pass
    
    @abstractmethod
    def get_all(self) -> List[Task]: pass
    
    @abstractmethod
    def delete(self, task_id: int) -> bool: pass

class CreateTaskUseCase:
    def __init__(self, task_repository: TaskRepository):
        self.task_repository = task_repository
    
    def execute(self, title: str, description: str, user: User) -> Task:
        if not user.has_permission('create_tasks'):
            raise PermissionError("User cannot create tasks")
        
        if not title or len(title.strip()) < 3:
            raise ValueError("Task title must be at least 3 characters")
        
        task = Task(
            id=None,
            title=title.strip(),
            description=description.strip()
        )
        
        return self.task_repository.save(task)

class CompleteTaskUseCase:
    def __init__(self, task_repository: TaskRepository):
        self.task_repository = task_repository
    
    def execute(self, task_id: int, user: User) -> Task:
        task = self.task_repository.get_by_id(task_id)
        if not task:
            raise ValueError(f"Task {task_id} not found")
        
        if not user.has_permission('complete_tasks'):
            raise PermissionError("User cannot complete tasks")
        
        task.mark_completed()
        return self.task_repository.save(task)

class GetTasksUseCase:
    def __init__(self, task_repository: TaskRepository):
        self.task_repository = task_repository
    
    def execute(self, user: User, completed: Optional[bool] = None) -> List[Task]:
        if not user.has_permission('read_tasks'):
            raise PermissionError("User cannot read tasks")
        
        tasks = self.task_repository.get_all()
        
        if completed is not None:
            tasks = [t for t in tasks if t.completed == completed]
        
        return tasks
```

**Interface Adapters - Adaptateurs d'interface**
```python
# interface_adapters/task_controller.py
from flask import Blueprint, request, jsonify
from use_cases.task_use_cases import (
    CreateTaskUseCase, CompleteTaskUseCase, GetTasksUseCase
)

class TaskController:
    def __init__(self, 
                 create_use_case: CreateTaskUseCase,
                 complete_use_case: CompleteTaskUseCase,
                 get_use_case: GetTasksUseCase):
        self.create_use_case = create_use_case
        self.complete_use_case = complete_use_case
        self.get_use_case = get_use_case
    
    def create_task(self):
        data = request.get_json()
        
        # Extraction de l'utilisateur depuis le contexte (JWT, session, etc.)
        user = self._get_current_user()
        
        try:
            task = self.create_use_case.execute(
                data['title'], 
                data['description'], 
                user
            )
            return jsonify({
                'id': task.id,
                'title': task.title,
                'description': task.description,
                'completed': task.completed
            }), 201
        except ValueError as e:
            return jsonify({'error': str(e)}), 400
        except PermissionError as e:
            return jsonify({'error': str(e)}), 403
    
    def complete_task(self, task_id):
        user = self._get_current_user()
        
        try:
            task = self.complete_use_case.execute(task_id, user)
            return jsonify({'message': 'Task completed'}), 200
        except ValueError as e:
            return jsonify({'error': str(e)}), 404
        except PermissionError as e:
            return jsonify({'error': str(e)}), 403
    
    def get_tasks(self):
        user = self._get_current_user()
        completed = request.args.get('completed', type=bool)
        
        try:
            tasks = self.get_use_case.execute(user, completed)
            return jsonify([{
                'id': t.id,
                'title': t.title,
                'completed': t.completed
            } for t in tasks]), 200
        except PermissionError as e:
            return jsonify({'error': str(e)}), 403
    
    def _get_current_user(self):
        # Logique pour récupérer l'utilisateur courant
        # Depuis JWT token, session, etc.
        pass

# Présenter (conversion des entités en formats de présentation)
class TaskPresenter:
    @staticmethod
    def present_task(task: Task) -> dict:
        return {
            'id': task.id,
            'title': task.title,
            'description': task.description,
            'completed': task.completed,
            'priority': task.priority,
            'created_at': task.created_at.isoformat(),
            'updated_at': task.updated_at.isoformat()
        }
    
    @staticmethod
    def present_task_list(tasks: List[Task]) -> List[dict]:
        return [TaskPresenter.present_task(task) for task in tasks]
```

**Frameworks & Drivers - Couche externe**
```python
# frameworks_drivers/sqlalchemy_task_repository.py
from sqlalchemy.orm import Session
from entities.task import Task
from use_cases.task_use_cases import TaskRepository

class SQLAlchemyTaskRepository(TaskRepository):
    def __init__(self, session: Session):
        self.session = session
    
    def save(self, task: Task) -> Task:
        # Conversion entité -> modèle DB
        db_task = TaskModel(
            title=task.title,
            description=task.description,
            completed=task.completed,
            priority=task.priority,
            created_at=task.created_at,
            updated_at=task.updated_at
        )
        
        self.session.add(db_task)
        self.session.commit()
        self.session.refresh(db_task)
        
        # Conversion modèle DB -> entité
        return Task(
            id=db_task.id,
            title=db_task.title,
            description=db_task.description,
            completed=db_task.completed,
            priority=db_task.priority,
            created_at=db_task.created_at,
            updated_at=db_task.updated_at
        )
    
    def get_by_id(self, task_id: int) -> Optional[Task]:
        db_task = self.session.query(TaskModel).filter(TaskModel.id == task_id).first()
        if not db_task:
            return None
        
        return Task(
            id=db_task.id,
            title=db_task.title,
            description=db_task.description,
            completed=db_task.completed,
            priority=db_task.priority,
            created_at=db_task.created_at,
            updated_at=db_task.updated_at
        )
    
    def get_all(self) -> List[Task]:
        db_tasks = self.session.query(TaskModel).all()
        return [self._db_to_entity(db_task) for db_task in db_tasks]
    
    def delete(self, task_id: int) -> bool:
        result = self.session.query(TaskModel).filter(TaskModel.id == task_id).delete()
        self.session.commit()
        return result > 0
    
    def _db_to_entity(self, db_task) -> Task:
        return Task(
            id=db_task.id,
            title=db_task.title,
            description=db_task.description,
            completed=db_task.completed,
            priority=db_task.priority,
            created_at=db_task.created_at,
            updated_at=db_task.updated_at
        )

# Configuration de l'injection de dépendances
def create_task_controller(session: Session):
    repository = SQLAlchemyTaskRepository(session)
    
    create_use_case = CreateTaskUseCase(repository)
    complete_use_case = CompleteTaskUseCase(repository)
    get_use_case = GetTasksUseCase(repository)
    
    return TaskController(create_use_case, complete_use_case, get_use_case)
```

**Démonstration pratique (15 min)**
Refactorisation de l'application selon la Clean Architecture.

**Exercices guidés (10 min)**
1. Définir les entités métier de l'application
2. Créer les use cases pour les opérations principales
3. Implémenter les interface adapters

**QCM d'auto-évaluation (3 min)**
1. Quelle couche contient les règles métier enterprise ?
2. Les dépendances vont vers l'extérieur ou l'intérieur ?
3. Quel est le rôle des interface adapters ?

**Devoir**
Refactorer une partie de l'application selon la Clean Architecture.

---

## Cours 4 - Domain-Driven Design
**Objectifs**
- Comprendre les concepts DDD (Domain, Bounded Context, Ubiquitous Language)
- Modéliser le domaine métier
- Implémenter Aggregates et Value Objects

**Leçon (30 min - détaillée)**
DDD (Domain-Driven Design) est une approche pour développer des logiciels complexes en se concentrant sur le domaine métier.

**Concepts fondamentaux DDD**

*Ubiquitous Language*
Le langage commun entre développeurs et experts métier.

```python
# ❌ Termes techniques dans le domaine métier
class Task:
    def assign_to_user(self, user_id): pass

# ✅ Langage ubiquitaire
class Task:
    def assign_to_member(self, team_member): pass
```

*Bounded Context*
Limites dans lesquelles un modèle est valide et cohérent.

```
Contexte "Gestion des Tâches"
- Task, Project, TeamMember
- Règles: assignation, priorité, deadline

Contexte "Planification"
- Sprint, Story, Estimation
- Règles: vélocité, capacity planning

Contexte "Facturation"
- Invoice, TimeEntry, Rate
- Règles: tarification, paiement
```

*Entities vs Value Objects*

```python
# Entity - identité unique, mutable
@dataclass
class Task:
    id: TaskId  # Identité unique
    title: str
    description: str
    status: TaskStatus
    assignee: Optional[TeamMember]
    
    def assign_to(self, member: TeamMember):
        if self.status == TaskStatus.COMPLETED:
            raise ValueError("Cannot assign completed task")
        self.assignee = member

# Value Object - immutable, égalité par valeur
@dataclass(frozen=True)
class TaskId:
    value: str
    
    @staticmethod
    def generate():
        return TaskId(str(uuid.uuid4()))
    
    def __str__(self):
        return self.value

@dataclass(frozen=True)
class TaskStatus:
    value: str
    
    COMPLETED = TaskStatus("completed")
    IN_PROGRESS = TaskStatus("in_progress")
    TODO = TaskStatus("todo")
    
    @classmethod
    def from_string(cls, value: str):
        for status in [cls.COMPLETED, cls.IN_PROGRESS, cls.TODO]:
            if status.value == value:
                return status
        raise ValueError(f"Invalid status: {value}")

@dataclass(frozen=True)
class Email:
    value: str
    
    def __post_init__(self):
        if '@' not in self.value:
            raise ValueError("Invalid email format")
    
    @property
    def domain(self):
        return self.value.split('@')[1]

@dataclass(frozen=True)
class TeamMember:
    id: TeamMemberId
    name: str
    email: Email
    role: str
    
    def can_be_assigned_tasks(self) -> bool:
        return self.role in ['developer', 'manager']
```

*Aggregates*
Groupe d'entités traité comme une unité cohérente.

```python
# Aggregate Root
@dataclass
class Project:
    id: ProjectId
    name: str
    description: str
    tasks: List[Task] = field(default_factory=list)
    team_members: List[TeamMember] = field(default_factory=list)
    
    def add_task(self, title: str, description: str) -> Task:
        if len(self.tasks) >= 50:  # Règle métier d'aggregate
            raise ValueError("Project cannot have more than 50 tasks")
        
        task = Task(
            id=TaskId.generate(),
            title=title,
            description=description,
            status=TaskStatus.TODO
        )
        self.tasks.append(task)
        return task
    
    def assign_task(self, task_id: TaskId, member: TeamMember):
        task = self._find_task(task_id)
        if not member in self.team_members:
            raise ValueError("Member not in project team")
        task.assign_to(member)
    
    def _find_task(self, task_id: TaskId) -> Task:
        for task in self.tasks:
            if task.id == task_id:
                return task
        raise ValueError(f"Task {task_id} not found in project")

# Repository pour l'aggregate
class ProjectRepository(ABC):
    @abstractmethod
    def save(self, project: Project): pass
    
    @abstractmethod
    def get_by_id(self, project_id: ProjectId) -> Optional[Project]: pass
    
    @abstractmethod
    def get_all(self) -> List[Project]: pass

# Use Case utilisant l'aggregate
class CreateProjectUseCase:
    def __init__(self, project_repo: ProjectRepository):
        self.project_repo = project_repo
    
    def execute(self, name: str, description: str) -> Project:
        # Validation métier
        if len(name.strip()) < 3:
            raise ValueError("Project name too short")
        
        project = Project(
            id=ProjectId.generate(),
            name=name.strip(),
            description=description.strip()
        )
        
        return self.project_repo.save(project)
```

*Domain Events*
Événements métier importants.

```python
from dataclasses import dataclass
from typing import List
from datetime import datetime

@dataclass(frozen=True)
class DomainEvent:
    occurred_at: datetime = field(default_factory=datetime.now)

@dataclass(frozen=True)
class TaskCompleted(DomainEvent):
    task_id: TaskId
    completed_by: TeamMemberId
    project_id: ProjectId

@dataclass(frozen=True)
class TaskAssigned(DomainEvent):
    task_id: TaskId
    assigned_to: TeamMemberId
    project_id: ProjectId

class DomainEventPublisher:
    def __init__(self):
        self._subscribers: List[callable] = []
    
    def subscribe(self, handler: callable):
        self._subscribers.append(handler)
    
    def publish(self, event: DomainEvent):
        for handler in self._subscribers:
            try:
                handler(event)
            except Exception as e:
                # Log l'erreur mais continue
                print(f"Error handling event {event}: {e}")

# Utilisation dans l'entity
class Task:
    def __init__(self, event_publisher: DomainEventPublisher):
        self.event_publisher = event_publisher
    
    def mark_completed(self, completed_by: TeamMemberId):
        if self.status == TaskStatus.COMPLETED:
            return
        
        self.status = TaskStatus.COMPLETED
        self.completed_at = datetime.now()
        
        # Publier l'événement
        event = TaskCompleted(
            task_id=self.id,
            completed_by=completed_by,
            project_id=self.project_id
        )
        self.event_publisher.publish(event)

# Handler d'événement
class TaskCompletionHandler:
    def __init__(self, notification_service):
        self.notification_service = notification_service
    
    def handle_task_completed(self, event: TaskCompleted):
        # Envoyer notification
        self.notification_service.send_completion_notification(event.task_id)
    
    def handle_task_assigned(self, event: TaskAssigned):
        # Envoyer notification d'assignation
        self.notification_service.send_assignment_notification(
            event.task_id, event.assigned_to
        )

# Configuration
event_publisher = DomainEventPublisher()
handler = TaskCompletionHandler(notification_service)
event_publisher.subscribe(handler.handle_task_completed)
event_publisher.subscribe(handler.handle_task_assigned)
```

**Démonstration pratique (15 min)**
Modélisation DDD d'un bounded context de l'application.

**Exercices guidés (10 min)**
1. Identifier les bounded contexts de l'application
2. Définir les value objects et entities
3. Créer un aggregate pour gérer la cohérence

**QCM d'auto-évaluation (3 min)**
1. Quelle est la différence entre Entity et Value Object ?
2. Quel est le rôle d'un Aggregate Root ?
3. Pourquoi utiliser des Domain Events ?

**Devoir**
Appliquer DDD à une partie de l'application "Tâches".

---

## Cours 5 - Architecture hexagonale
**Objectifs**
- Comprendre l'architecture hexagonale (Ports & Adapters)
- Séparer les préoccupations techniques et métier
- Inverser les dépendances

**Leçon (30 min - détaillée)**
L'architecture hexagonale isole la logique métier des détails techniques.

**Structure hexagonale**

```
┌─────────────────────────────────────┐
│           APPLICATION              │
│                                     │
│  ┌─────────────────────────────┐    │
│  │        BUSINESS LOGIC       │    │
│  │      (Domain Services)      │    │
│  └─────────────────────────────┘    │
│                                     │
│  ┌─────────────────────────────┐    │
│  │         DOMAIN MODEL        │    │
│  │     (Entities, Value Obj)   │    │
│  └─────────────────────────────┘    │
└─────────────────────────────────────┘
               │         │
        ┌──────▼─────────▼──────┐
        │                       │
        │       PORTS           │
        │   (Interfaces)        │
        └──────▲─────────▲──────┘
               │         │
        ┌──────┴─────────┴──────┐
        │                       │
        │      ADAPTERS         │
        │  (Implementations)    │
        └───────────────────────┘
```

**Ports - Interfaces métier**
```python
# ports/task_ports.py
from abc import ABC, abstractmethod
from typing import List, Optional
from domain.task import Task, TaskId

class TaskRepositoryPort(ABC):
    """Port pour l'accès aux données des tâches"""
    
    @abstractmethod
    async def save(self, task: Task) -> Task:
        pass
    
    @abstractmethod
    async def get_by_id(self, task_id: TaskId) -> Optional[Task]:
        pass
    
    @abstractmethod
    async def get_all(self) -> List[Task]:
        pass
    
    @abstractmethod
    async def delete(self, task_id: TaskId) -> bool:
        pass
    
    @abstractmethod
    async def get_by_assignee(self, assignee_id: str) -> List[Task]:
        pass

class NotificationPort(ABC):
    """Port pour les notifications"""
    
    @abstractmethod
    async def send_task_assigned(self, task: Task, assignee_email: str):
        pass
    
    @abstractmethod
    async def send_task_completed(self, task: Task, assignee_email: str):
        pass

class IdGeneratorPort(ABC):
    """Port pour la génération d'IDs"""
    
    @abstractmethod
    def generate_task_id(self) -> TaskId:
        pass

class TimeProviderPort(ABC):
    """Port pour les opérations temporelles"""
    
    @abstractmethod
    def now(self) -> datetime:
        pass
    
    @abstractmethod
    def is_overdue(self, due_date: datetime) -> bool:
        pass
```

**Adapters - Implémentations concrètes**
```python
# adapters/sqlalchemy_task_repository.py
from sqlalchemy.ext.asyncio import AsyncSession
from ports.task_ports import TaskRepositoryPort
from domain.task import Task, TaskId

class SQLAlchemyTaskRepository(TaskRepositoryPort):
    def __init__(self, session: AsyncSession):
        self.session = session
    
    async def save(self, task: Task) -> Task:
        # Conversion et sauvegarde
        db_task = TaskModel.from_domain(task)
        self.session.add(db_task)
        await self.session.commit()
        await self.session.refresh(db_task)
        return db_task.to_domain()
    
    async def get_by_id(self, task_id: TaskId) -> Optional[Task]:
        result = await self.session.execute(
            select(TaskModel).where(TaskModel.id == task_id.value)
        )
        db_task = result.scalar_one_or_none()
        return db_task.to_domain() if db_task else None
    
    async def get_all(self) -> List[Task]:
        result = await self.session.execute(select(TaskModel))
        return [db_task.to_domain() for db_task in result.scalars()]
    
    async def delete(self, task_id: TaskId) -> bool:
        result = await self.session.execute(
            delete(TaskModel).where(TaskModel.id == task_id.value)
        )
        await self.session.commit()
        return result.rowcount > 0
    
    async def get_by_assignee(self, assignee_id: str) -> List[Task]:
        result = await self.session.execute(
            select(TaskModel).where(TaskModel.assignee_id == assignee_id)
        )
        return [db_task.to_domain() for db_task in result.scalars()]

# adapters/redis_cache_adapter.py
import redis.asyncio as redis
from ports.cache_ports import CachePort

class RedisCacheAdapter(CachePort):
    def __init__(self, redis_client: redis.Redis):
        self.redis = redis_client
    
    async def get(self, key: str) -> Optional[str]:
        return await self.redis.get(key)
    
    async def set(self, key: str, value: str, ttl: int = None):
        await self.redis.set(key, value, ex=ttl)
    
    async def delete(self, key: str):
        await self.redis.delete(key)
    
    async def exists(self, key: str) -> bool:
        return await self.redis.exists(key) > 0

# adapters/smtp_notification_adapter.py
import aiosmtplib
from email.message import EmailMessage
from ports.notification_ports import NotificationPort

class SMTPNotificationAdapter(NotificationPort):
    def __init__(self, smtp_server: str, smtp_port: int, username: str, password: str):
        self.smtp_server = smtp_server
        self.smtp_port = smtp_port
        self.username = username
        self.password = password
    
    async def send_task_assigned(self, task: Task, assignee_email: str):
        msg = EmailMessage()
        msg.set_content(f"You have been assigned to task: {task.title}")
        msg['Subject'] = f"Task Assigned: {task.title}"
        msg['From'] = self.username
        msg['To'] = assignee_email
        
        async with aiosmtplib.SMTP(hostname=self.smtp_server, port=self.smtp_port) as smtp:
            await smtp.login(self.username, self.password)
            await smtp.send_message(msg)
    
    async def send_task_completed(self, task: Task, assignee_email: str):
        # Implémentation similaire
        pass
```

**Application Services - Orchestration**
```python
# application/task_service.py
from ports.task_ports import TaskRepositoryPort, NotificationPort, IdGeneratorPort, TimeProviderPort
from domain.task import Task, TaskId
from typing import List, Optional

class TaskApplicationService:
    def __init__(self,
                 task_repository: TaskRepositoryPort,
                 notification_service: NotificationPort,
                 id_generator: IdGeneratorPort,
                 time_provider: TimeProviderPort):
        self.task_repository = task_repository
        self.notification_service = notification_service
        self.id_generator = id_generator
        self.time_provider = time_provider
    
    async def create_task(self, title: str, description: str, assignee_email: Optional[str] = None) -> Task:
        # Validation métier
        if len(title.strip()) < 3:
            raise ValueError("Task title must be at least 3 characters")
        
        # Génération d'ID
        task_id = self.id_generator.generate_task_id()
        
        # Création de la tâche
        task = Task(
            id=task_id,
            title=title.strip(),
            description=description.strip(),
            created_at=self.time_provider.now()
        )
        
        # Sauvegarde
        saved_task = await self.task_repository.save(task)
        
        # Notification si assignée
        if assignee_email:
            await self.notification_service.send_task_assigned(saved_task, assignee_email)
        
        return saved_task
    
    async def complete_task(self, task_id: TaskId) -> Task:
        # Récupération
        task = await self.task_repository.get_by_id(task_id)
        if not task:
            raise ValueError(f"Task {task_id} not found")
        
        # Complétion
        task.complete(self.time_provider.now())
        
        # Sauvegarde
        updated_task = await self.task_repository.save(task)
        
        # Notification
        if task.assignee_email:
            await self.notification_service.send_task_completed(updated_task, task.assignee_email)
        
        return updated_task
    
    async def get_user_tasks(self, user_email: str) -> List[Task]:
        return await self.task_repository.get_by_assignee(user_email)
```

**Configuration et injection de dépendances**
```python
# config/dependency_injection.py
from adapters.sqlalchemy_task_repository import SQLAlchemyTaskRepository
from adapters.redis_cache_adapter import RedisCacheAdapter
from adapters.smtp_notification_adapter import SMTPNotificationAdapter
from adapters.uuid_generator_adapter import UUIDGeneratorAdapter
from adapters.system_time_provider import SystemTimeProvider
from application.task_service import TaskApplicationService
import redis.asyncio as redis
import aiosmtplib

async def create_task_service() -> TaskApplicationService:
    # Configuration de la base de données
    session = create_async_session()  # Fonction utilitaire
    
    # Configuration Redis
    redis_client = redis.Redis(host='localhost', port=6379, decode_responses=True)
    
    # Configuration SMTP
    smtp_config = {
        'server': 'smtp.gmail.com',
        'port': 587,
        'username': os.getenv('SMTP_USERNAME'),
        'password': os.getenv('SMTP_PASSWORD')
    }
    
    # Création des adapters
    task_repository = SQLAlchemyTaskRepository(session)
    cache = RedisCacheAdapter(redis_client)
    notification_service = SMTPNotificationAdapter(**smtp_config)
    id_generator = UUIDGeneratorAdapter()
    time_provider = SystemTimeProvider()
    
    # Création du service applicatif
    return TaskApplicationService(
        task_repository=task_repository,
        notification_service=notification_service,
        id_generator=id_generator,
        time_provider=time_provider
    )
```

**Démonstration pratique (15 min)**
Implémentation d'une architecture hexagonale pour un service.

**Exercices guidés (10 min)**
1. Définir les ports pour un service métier
2. Implémenter des adapters pour les ports
3. Créer un service applicatif utilisant les ports

**QCM d'auto-évaluation (3 min)**
1. Quelle est la différence entre port et adapter ?
2. Pourquoi l'architecture hexagonale ?
3. Comment tester facilement avec cette architecture ?

**Devoir**
Refactorer un service de l'application selon l'architecture hexagonale.

---

## Cours 6 - Profiling Python
**Objectifs**
- Maîtriser cProfile et line_profiler pour l'analyse des performances
- Identifier les goulots d'étranglement
- Optimiser le code identifié

**Leçon (30 min - détaillée)**
Le profiling permet d'analyser les performances réelles du code.

**cProfile - Profiling déterministe**
```python
import cProfile
import pstats
from io import StringIO

def profile_function(func):
    """Décorateur pour profiler une fonction"""
    def wrapper(*args, **kwargs):
        profiler = cProfile.Profile()
        profiler.enable()
        
        try:
            result = func(*args, **kwargs)
            return result
        finally:
            profiler.disable()
            s = StringIO()
            ps = pstats.Stats(profiler, stream=s).sort_stats('cumulative')
            ps.print_stats()
            print(s.getvalue())
    
    return wrapper

# Utilisation
@profile_function
def slow_function():
    # Code à profiler
    pass

# Profiling manuel
def analyze_performance():
    profiler = cProfile.Profile()
    profiler.enable()
    
    # Code à analyser
    result = expensive_operation()
    
    profiler.disable()
    
    # Analyse des résultats
    stats = pstats.Stats(profiler)
    stats.sort_stats('cumulative').print_stats(20)  # Top 20 fonctions
    
    # Sauvegarde pour analyse détaillée
    stats.dump_stats('profile_results.prof')

# Analyse avec pstats
def analyze_saved_profile():
    stats = pstats.Stats('profile_results.prof')
    
    # Statistiques par fonction
    stats.sort_stats('time').print_stats(10)
    
    # Statistiques cumulatives
    stats.sort_stats('cumulative').print_stats(10)
    
    # Statistiques par module
    stats.print_stats('your_module')
```

**line_profiler - Profiling ligne par ligne**
```python
from line_profiler import LineProfiler

def profile_lines(func):
    """Décorateur pour profiler ligne par ligne"""
    def wrapper(*args, **kwargs):
        profiler = LineProfiler()
        profiler.add_function(func)
        profiler.enable()
        
        try:
            result = func(*args, **kwargs)
            return result
        finally:
            profiler.disable()
            profiler.print_stats()
    
    return wrapper

@profile_lines
def process_tasks(tasks):
    results = []
    for task in tasks:  # Ligne potentiellement lente
        processed = task.title.upper()  # Traitement simple
        results.append(processed)
    return results

# Profiling manuel
def detailed_profiling():
    tasks = [Task(id=i, title=f"Task {i}") for i in range(1000)]
    
    profiler = LineProfiler()
    profiler.add_function(process_tasks)
    profiler.run('result = process_tasks(tasks)')
    profiler.print_stats()
```

**memory_profiler - Analyse mémoire**
```python
from memory_profiler import profile, memory_usage

@profile
def memory_intensive_function():
    """Fonction analysée pour l'usage mémoire"""
    data = []
    for i in range(100000):
        data.append(f"item_{i}" * 100)  # Création de gros objets
    return data

def monitor_memory_usage():
    """Surveillance de l'usage mémoire"""
    mem_usage = memory_usage((memory_intensive_function,))
    print(f"Peak memory usage: {max(mem_usage)} MB")
    
    # Usage mémoire détaillé
    mem_usage = memory_usage((memory_intensive_function,), interval=0.1)
    for i, usage in enumerate(mem_usage):
        print(f"Time {i*0.1:.1f}s: {usage:.2f} MB")
```

**Profiling en production**
```python
# profiling_middleware.py
import cProfile
import threading
import time
from functools import wraps

class ProductionProfiler:
    def __init__(self, sample_rate=0.01):  # 1% des requêtes
        self.sample_rate = sample_rate
        self.profiles = {}
        self.lock = threading.Lock()
    
    def should_profile(self):
        import random
        return random.random() < self.sample_rate
    
    def profile_request(self, func):
        @wraps(func)
        def wrapper(*args, **kwargs):
            if not self.should_profile():
                return func(*args, **kwargs)
            
            profiler = cProfile.Profile()
            profiler.enable()
            
            try:
                result = func(*args, **kwargs)
                return result
            finally:
                profiler.disable()
                
                # Stockage du profil
                with self.lock:
                    profile_id = f"{func.__name__}_{int(time.time())}"
                    self.profiles[profile_id] = profiler
                
                # Nettoyage périodique (garder seulement les 100 derniers)
                if len(self.profiles) > 100:
                    oldest = min(self.profiles.keys())
                    del self.profiles[oldest]
        
        return wrapper
    
    def get_profiles_summary(self):
        """Résumé des profils collectés"""
        summaries = []
        for profile_id, profiler in self.profiles.items():
            stats = pstats.Stats(profiler)
            # Extraire les stats importantes
            summaries.append({
                'id': profile_id,
                'total_calls': stats.total_calls,
                'total_time': stats.total_tt
            })
        return summaries

# Intégration Flask
profiler = ProductionProfiler()

@app.route('/api/tasks')
@profiler.profile_request
def get_tasks():
    # Logique normale
    pass

# Endpoint pour consulter les profils
@app.route('/debug/profiles')
def get_profiles():
    if not app.debug:
        return jsonify({'error': 'Debug only'}), 403
    
    return jsonify(profiler.get_profiles_summary())
```

**Analyse des résultats de profiling**
```python
# profiling_analysis.py
import pstats
from collections import defaultdict

def analyze_profile_stats(stats_file):
    """Analyse détaillée des statistiques de profiling"""
    stats = pstats.Stats(stats_file)
    
    # Conversion en dictionnaire pour analyse
    profile_data = {}
    for func, (cc, nc, tt, ct, callers) in stats.stats.items():
        profile_data[func] = {
            'calls': nc,
            'total_time': tt,
            'cumulative_time': ct,
            'callers': dict(callers)
        }
    
    # Identification des goulots d'étranglement
    bottlenecks = []
    
    # Fonctions avec le plus de temps cumulatif
    sorted_by_time = sorted(profile_data.items(), 
                          key=lambda x: x[1]['cumulative_time'], 
                          reverse=True)
    
    for func, data in sorted_by_time[:10]:
        bottlenecks.append({
            'function': func,
            'cumulative_time': data['cumulative_time'],
            'calls': data['calls'],
            'avg_time_per_call': data['cumulative_time'] / data['calls'] if data['calls'] > 0 else 0
        })
    
    # Analyse des appels récursifs
    recursive_calls = []
    for func, data in profile_data.items():
        if func in data['callers'] and data['callers'][func] > 0:
            recursive_calls.append(func)
    
    return {
        'bottlenecks': bottlenecks,
        'recursive_calls': recursive_calls,
        'total_functions': len(profile_data)
    }

# Recommandations d'optimisation
def generate_optimization_recommendations(analysis):
    """Génère des recommandations d'optimisation"""
    recommendations = []
    
    for bottleneck in analysis['bottlenecks'][:5]:
        func_name = bottleneck['function']
        avg_time = bottleneck['avg_time_per_call']
        
        if 'regex' in str(func_name).lower():
            recommendations.append(f"Optimiser les expressions régulières dans {func_name}")
        elif 'db' in str(func_name).lower() or 'query' in str(func_name).lower():
            recommendations.append(f"Optimiser les requêtes DB dans {func_name}")
        elif avg_time > 0.1:  # Plus de 100ms en moyenne
            recommendations.append(f"Considérer la mise en cache pour {func_name}")
        elif bottleneck['calls'] > 1000:
            recommendations.append(f"Réduire le nombre d'appels à {func_name}")
    
    return recommendations
```

**Démonstration pratique (15 min)**
Profiling d'une fonction lente et analyse des résultats.

**Exercices guidés (10 min)**
1. Installer et utiliser cProfile sur une fonction
2. Analyser les résultats avec pstats
3. Identifier les optimisations possibles

**QCM d'auto-évaluation (3 min)**
1. Quelle différence entre time et cumulative dans cProfile ?
2. Quand utiliser line_profiler ?
3. Comment profiler en production sans impact ?

**Devoir**
Profiler une partie de l'application "Tâches" et identifier les optimisations.

---

## Cours 7 - Optimisation algorithmique
**Objectifs**
- Maîtriser la complexité algorithmique (Big O)
- Optimiser les algorithmes de recherche et tri
- Choisir la bonne structure de données

**Leçon (30 min - détaillée)**
L'optimisation algorithmique est souvent plus efficace que l'optimisation code.

**Complexité algorithmique - Big O**
```python
# O(1) - Accès direct
def get_task_by_id(tasks_dict, task_id):
    return tasks_dict.get(task_id)  # O(1)

# O(n) - Recherche linéaire
def find_task_by_title(tasks_list, title):
    for task in tasks_list:  # O(n)
        if task.title == title:
            return task
    return None

# O(log n) - Recherche binaire
def binary_search_tasks(sorted_tasks, title):
    left, right = 0, len(sorted_tasks) - 1
    while left <= right:
        mid = (left + right) // 2
        if sorted_tasks[mid].title == title:
            return sorted_tasks[mid]
        elif sorted_tasks[mid].title < title:
            left = mid + 1
        else:
            right = mid - 1
    return None

# O(n log n) - Tri
def sort_tasks_by_priority(tasks):
    return sorted(tasks, key=lambda t: t.priority)  # O(n log n)

# O(n²) - Algorithme inefficace
def find_duplicates_brute_force(tasks):
    duplicates = []
    for i in range(len(tasks)):  # O(n²)
        for j in range(i + 1, len(tasks)):
            if tasks[i].title == tasks[j].title:
                duplicates.append(tasks[i])
    return duplicates

# O(n) - Utilisant un set
def find_duplicates_optimized(tasks):
    seen = set()
    duplicates = set()
    for task in tasks:  # O(n)
        if task.title in seen:
            duplicates.add(task)
        else:
            seen.add(task.title)
    return list(duplicates)
```

**Structures de données optimisées**
```python
from collections import defaultdict, deque
import heapq

# Dictionary pour les lookups O(1)
class TaskRegistry:
    def __init__(self):
        self.tasks_by_id = {}  # O(1) lookup
        self.tasks_by_user = defaultdict(list)  # O(1) append
        self.tasks_by_status = defaultdict(list)
    
    def add_task(self, task):
        self.tasks_by_id[task.id] = task
        self.tasks_by_user[task.user_id].append(task)
        self.tasks_by_status[task.status].append(task)
    
    def get_user_tasks(self, user_id):
        return self.tasks_by_user[user_id]  # O(1)
    
    def get_tasks_by_status(self, status):
        return self.tasks_by_status[status]  # O(1)

# Set pour les vérifications d'unicité O(1)
class UniqueTaskValidator:
    def __init__(self):
        self.titles = set()
    
    def is_unique(self, title):
        return title not in self.titles  # O(1)
    
    def add_title(self, title):
        self.titles.add(title)

# Heap pour les tâches prioritaires
class PriorityTaskQueue:
    def __init__(self):
        self.tasks = []  # Min-heap par priorité
    
    def add_task(self, task, priority):
        heapq.heappush(self.tasks, (priority, task))
    
    def get_highest_priority(self):
        if self.tasks:
            return heapq.heappop(self.tasks)[1]
        return None

# Deque pour les opérations récentes (LRU)
from collections import deque

class RecentTasksCache:
    def __init__(self, max_size=100):
        self.tasks = deque(maxlen=max_size)
        self.task_index = {}  # Pour accès rapide
    
    def add_task(self, task):
        # Éviter les doublons
        if task.id in self.task_index:
            self.tasks.remove(self.task_index[task.id])
        
        self.tasks.append(task)
        self.task_index[task.id] = task
    
    def get_recent_tasks(self, limit=10):
        return list(self.tasks)[-limit:]
```

**Algorithmes de recherche optimisés**
```python
# Recherche avec index
class TaskSearchEngine:
    def __init__(self):
        self.tasks = []
        self.title_index = defaultdict(list)  # Index inversé
        self.build_index()
    
    def build_index(self):
        """Construction de l'index"""
        for i, task in enumerate(self.tasks):
            words = task.title.lower().split()
            for word in words:
                self.title_index[word].append(i)
    
    def search_by_title(self, query):
        """Recherche avec index"""
        query_words = query.lower().split()
        if not query_words:
            return []
        
        # Intersection des résultats pour chaque mot
        result_sets = []
        for word in query_words:
            result_sets.append(set(self.title_index.get(word, [])))
        
        # Intersection de tous les ensembles
        if result_sets:
            common_indices = result_sets[0]
            for result_set in result_sets[1:]:
                common_indices &= result_set
            
            return [self.tasks[i] for i in common_indices]
        
        return []

# Cache LRU pour les résultats de recherche
from functools import lru_cache

class CachedTaskSearchEngine(TaskSearchEngine):
    @lru_cache(maxsize=128)
    def search_by_title_cached(self, query):
        """Recherche avec cache LRU"""
        return self.search_by_title(query)

# Recherche floue avec Trie
class TaskTrie:
    def __init__(self):
        self.root = {}
    
    def insert(self, word, task_id):
        node = self.root
        for char in word:
            if char not in node:
                node[char] = {}
            node = node[char]
        node['$'] = task_id  # Marqueur de fin
    
    def search_prefix(self, prefix):
        """Recherche par préfixe"""
        node = self.root
        for char in prefix:
            if char not in node:
                return []
            node = node[char]
        
        # Collecte tous les mots complets
        results = []
        self._collect_words(node, prefix, results)
        return results
    
    def _collect_words(self, node, current_word, results):
        for char, child_node in node.items():
            if char == '$':
                results.append(current_word)
            else:
                self._collect_words(child_node, current_word + char, results)
```

**Optimisations mémoire**
```python
# Générateurs pour économiser la mémoire
def get_completed_tasks_stream(tasks):
    """Générateur pour traiter les tâches par lot"""
    for task in tasks:
        if task.completed:
            yield task

# Utilisation
completed_tasks = list(get_completed_tasks_stream(all_tasks))  # Mémoire contrôlée

# Traitement par lot
def process_tasks_in_batches(tasks, batch_size=100):
    """Traitement par lots pour éviter la surcharge mémoire"""
    for i in range(0, len(tasks), batch_size):
        batch = tasks[i:i + batch_size]
        process_batch(batch)
        # Libération de la mémoire
        del batch

# __slots__ pour réduire l'empreinte mémoire des objets
class OptimizedTask:
    __slots__ = ['id', 'title', 'description', 'completed', 'user_id']
    
    def __init__(self, id, title, description, completed, user_id):
        self.id = id
        self.title = title
        self.description = description
        self.completed = completed
        self.user_id = user_id

# Comparaison mémoire
import sys
regular_task = Task(id=1, title="Test", description="Desc", completed=False, user_id=1)
optimized_task = OptimizedTask(id=1, title="Test", description="Desc", completed=False, user_id=1)

print(f"Regular task: {sys.getsizeof(regular_task)} bytes")
print(f"Optimized task: {sys.getsizeof(optimized_task)} bytes")
```

**Démonstration pratique (15 min)**
Comparaison d'algorithmes de complexité différente.

**Exercices guidés (10 min)**
1. Calculer la complexité d'un algorithme donné
2. Optimiser une recherche linéaire
3. Implémenter une structure de données adaptée

**QCM d'auto-évaluation (3 min)**
1. Quelle complexité pour une recherche dans un dict ?
2. Quand utiliser un set plutôt qu'une liste ?
3. Quelle est la complexité du tri en Python ?

**Devoir**
Optimiser un algorithme de l'application "Tâches" en réduisant sa complexité.

---

## Cours 8 - Concurrence et parallélisation
**Objectifs**
- Maîtriser asyncio pour la programmation asynchrone
- Utiliser threading et multiprocessing
- Gérer la concurrence de manière sûre

**Leçon (30 min - détaillée)**
La concurrence permet d'exécuter plusieurs tâches simultanément pour améliorer les performances.

**Asyncio - Programmation asynchrone**
```python
import asyncio
from typing import List
import aiohttp

# Fonctions asynchrones
async def create_task_async(title: str, description: str) -> Task:
    """Création asynchrone d'une tâche"""
    # Simulation d'I/O
    await asyncio.sleep(0.1)  # Simule DB access
    
    task = Task(
        id=generate_id(),
        title=title,
        description=description,
        created_at=datetime.now()
    )
    
    # Sauvegarde asynchrone
    await save_task_to_db(task)
    return task

async def save_task_to_db(task: Task):
    """Simulation de sauvegarde DB asynchrone"""
    await asyncio.sleep(0.05)
    # Logique de sauvegarde réelle

# Traitement en parallèle
async def create_multiple_tasks(titles: List[str]) -> List[Task]:
    """Création de plusieurs tâches en parallèle"""
    tasks = []
    for title in titles:
        task = asyncio.create_task(create_task_async(title, f"Description for {title}"))
        tasks.append(task)
    
    # Attendre que toutes les tâches soient terminées
    results = await asyncio.gather(*tasks)
    return results

# Gestionnaire d'erreurs
async def create_task_safe(title: str) -> Optional[Task]:
    """Création avec gestion d'erreurs"""
    try:
        return await create_task_async(title, f"Description for {title}")
    except Exception as e:
        print(f"Error creating task {title}: {e}")
        return None

# Utilisation
async def main():
    titles = ["Task 1", "Task 2", "Task 3", "Task 4", "Task 5"]
    
    # Création séquentielle (lente)
    sequential_start = asyncio.get_event_loop().time()
    sequential_tasks = []
    for title in titles:
        task = await create_task_async(title, f"Description for {title}")
        sequential_tasks.append(task)
    sequential_time = asyncio.get_event_loop().time() - sequential_start
    
    # Création parallèle (rapide)
    parallel_start = asyncio.get_event_loop().time()
    parallel_tasks = await create_multiple_tasks(titles)
    parallel_time = asyncio.get_event_loop().time() - parallel_start
    
    print(f"Séquentiel: {sequential_time:.2f}s")
    print(f"Parallèle: {parallel_time:.2f}s")
    print(f"Accélération: {sequential_time/parallel_time:.1f}x")

# Exécution
if __name__ == "__main__":
    asyncio.run(main())
```

**APIs REST asynchrones avec FastAPI**
```python
from fastapi import FastAPI, BackgroundTasks
from typing import List
import asyncio

app = FastAPI()

# Service métier asynchrone
class AsyncTaskService:
    async def create_task(self, title: str, description: str) -> Task:
        # Simulation de traitement asynchrone
        await asyncio.sleep(0.1)
        return Task(id=generate_id(), title=title, description=description)
    
    async def send_notification(self, task: Task):
        """Envoi de notification en arrière-plan"""
        await asyncio.sleep(0.5)  # Simulation d'API externe
        print(f"Notification sent for task: {task.title}")

# Endpoints asynchrones
@app.post("/tasks", response_model=TaskResponse)
async def create_task(request: TaskCreateRequest, background_tasks: BackgroundTasks):
    service = AsyncTaskService()
    
    # Création de la tâche
    task = await service.create_task(request.title, request.description)
    
    # Notification en arrière-plan (ne bloque pas la réponse)
    background_tasks.add_task(service.send_notification, task)
    
    return TaskResponse.from_task(task)

@app.get("/tasks", response_model=List[TaskResponse])
async def get_tasks():
    # Simulation de requête DB asynchrone
    await asyncio.sleep(0.05)
    return [TaskResponse.from_task(task) for task in get_all_tasks()]

# Traitement par lots
@app.post("/tasks/batch")
async def create_tasks_batch(request: BatchTaskRequest):
    service = AsyncTaskService()
    
    # Création en parallèle
    tasks = await asyncio.gather(*[
        service.create_task(title, f"Batch task {i}")
        for i, title in enumerate(request.titles)
    ])
    
    return {"created": len(tasks), "tasks": [TaskResponse.from_task(t) for t in tasks]}
```

**Threading pour les tâches CPU-bound**
```python
import threading
from concurrent.futures import ThreadPoolExecutor, as_completed
import time

class TaskProcessor:
    def __init__(self, max_workers=4):
        self.executor = ThreadPoolExecutor(max_workers=max_workers)
        self.lock = threading.Lock()
    
    def process_task_cpu_intensive(self, task: Task) -> ProcessedTask:
        """Traitement CPU intensif (calculs, transformations)"""
        # Simulation de traitement CPU
        time.sleep(0.2)  # Remplacer par le vrai traitement
        
        # Calculs complexes
        result = self._complex_calculation(task.title)
        
        return ProcessedTask(task=task, result=result)
    
    def _complex_calculation(self, text: str) -> str:
        """Simulation de calcul complexe"""
        return text.upper() * 3
    
    def process_batch_threaded(self, tasks: List[Task]) -> List[ProcessedTask]:
        """Traitement par lots avec threads"""
        futures = [
            self.executor.submit(self.process_task_cpu_intensive, task)
            for task in tasks
        ]
        
        results = []
        for future in as_completed(futures):
            try:
                result = future.result()
                results.append(result)
            except Exception as e:
                print(f"Error processing task: {e}")
        
        return results

# Utilisation
processor = TaskProcessor(max_workers=4)
tasks = [Task(id=i, title=f"Task {i}") for i in range(10)]

start_time = time.time()
results = processor.process_batch_threaded(tasks)
end_time = time.time()

print(f"Processed {len(results)} tasks in {end_time - start_time:.2f}s")
```

**Multiprocessing pour les tâches très CPU-bound**
```python
import multiprocessing as mp
from multiprocessing import Pool
import os

def process_task_multiprocess(task_data):
    """Fonction exécutée dans un processus séparé"""
    task_id, title = task_data
    
    # Simulation de traitement très CPU intensif
    result = 0
    for i in range(1000000):  # Calcul intensif
        result += i * i
    
    return {
        'task_id': task_id,
        'title': title,
        'result': result,
        'processed_by': os.getpid()
    }

class MultiprocessTaskProcessor:
    def __init__(self, num_processes=None):
        self.num_processes = num_processes or mp.cpu_count()
    
    def process_tasks_parallel(self, tasks: List[Task]):
        """Traitement parallèle avec multiprocessing"""
        # Préparation des données
        task_data = [(task.id, task.title) for task in tasks]
        
        # Création du pool de processus
        with Pool(processes=self.num_processes) as pool:
            # Traitement parallèle
            results = pool.map(process_task_multiprocess, task_data)
        
        return results

# Utilisation
processor = MultiprocessTaskProcessor()
tasks = [Task(id=i, title=f"Heavy Task {i}") for i in range(8)]

start_time = time.time()
results = processor.process_tasks_parallel(tasks)
end_time = time.time()

print(f"Processed {len(results)} heavy tasks in {end_time - start_time:.2f}s")
print(f"Used {processor.num_processes} processes")
for result in results[:3]:
    print(f"Task {result['task_id']} processed by PID {result['processed_by']}")
```

**Gestion de la concurrence avec locks**
```python
import asyncio
from asyncio import Lock
import threading

class ConcurrentTaskManager:
    def __init__(self):
        self.tasks = {}
        self.lock = Lock()  # Pour asyncio
        self.thread_lock = threading.Lock()  # Pour threading
    
    async def add_task_async(self, task: Task):
        """Ajout thread-safe avec asyncio"""
        async with self.lock:
            self.tasks[task.id] = task
            # Logique métier thread-safe
    
    def add_task_threaded(self, task: Task):
        """Ajout thread-safe avec threading"""
        with self.thread_lock:
            self.tasks[task.id] = task
    
    async def get_task_count_async(self) -> int:
        """Lecture thread-safe"""
        async with self.lock:
            return len(self.tasks)

# Gestion des ressources partagées
class SharedResourceManager:
    def __init__(self):
        self.semaphore = asyncio.Semaphore(10)  # Max 10 accès simultanés
        self.resources = {}
    
    async def access_resource(self, resource_id: str, user_id: str):
        """Accès contrôlé à une ressource"""
        async with self.semaphore:
            if resource_id not in self.resources:
                self.resources[resource_id] = []
            
            self.resources[resource_id].append(user_id)
            
            # Simulation d'accès à la ressource
            await asyncio.sleep(0.1)
            
            return f"Accessed resource {resource_id} by {user_id}"
```

**Démonstration pratique (15 min)**
Comparaison performances synchrone vs asynchrone vs threading.

**Exercices guidés (10 min)**
1. Convertir une fonction synchrone en asynchrone
2. Implémenter un traitement parallèle avec asyncio
3. Utiliser ThreadPoolExecutor pour des tâches CPU

**QCM d'auto-évaluation (3 min)**
1. Quand utiliser asyncio plutôt que threading ?
2. Quelle différence entre ThreadPoolExecutor et multiprocessing ?
3. Pourquoi utiliser des locks ?

**Devoir**
Implémenter la concurrence dans une partie de l'application "Tâches".

---

## Cours 9 - Cache avancé
**Objectifs**
- Implémenter différentes stratégies de cache
- Configurer Redis pour le cache distribué
- Gérer l'invalidation et la cohérence

**Leçon (30 min - détaillée)**
Le cache améliore drastiquement les performances en réduisant les accès aux ressources lentes.

**Stratégies de cache**
```python
from abc import ABC, abstractmethod
from typing import Any, Optional
import time
import hashlib

class CacheStrategy(ABC):
    @abstractmethod
    async def get(self, key: str) -> Optional[Any]:
        pass
    
    @abstractmethod
    async def set(self, key: str, value: Any, ttl: Optional[int] = None):
        pass
    
    @abstractmethod
    async def delete(self, key: str):
        pass

# Cache en mémoire simple
class InMemoryCache(CacheStrategy):
    def __init__(self):
        self.cache = {}
    
    async def get(self, key: str) -> Optional[Any]:
        entry = self.cache.get(key)
        if entry and (entry['expires'] is None or entry['expires'] > time.time()):
            return entry['value']
        elif entry:
            del self.cache[key]  # Expiré
        return None
    
    async def set(self, key: str, value: Any, ttl: Optional[int] = None):
        expires = time.time() + ttl if ttl else None
        self.cache[key] = {'value': value, 'expires': expires}
    
    async def delete(self, key: str):
        self.cache.pop(key, None)

# Cache LRU (Least Recently Used)
from collections import OrderedDict

class LRUCache(CacheStrategy):
    def __init__(self, capacity: int = 100):
        self.capacity = capacity
        self.cache = OrderedDict()
    
    async def get(self, key: str) -> Optional[Any]:
        if key in self.cache:
            # Déplacer en fin (plus récemment utilisé)
            self.cache.move_to_end(key)
            return self.cache[key]['value']
        return None
    
    async def set(self, key: str, value: Any, ttl: Optional[int] = None):
        expires = time.time() + ttl if ttl else None
        
        if key in self.cache:
            self.cache.move_to_end(key)
        else:
            if len(self.cache) >= self.capacity:
                # Évincer le moins récemment utilisé
                self.cache.popitem(last=False)
        
        self.cache[key] = {'value': value, 'expires': expires}
    
    async def delete(self, key: str):
        self.cache.pop(key, None)

# Cache multi-niveau
class MultiLevelCache(CacheStrategy):
    def __init__(self, l1_cache: CacheStrategy, l2_cache: CacheStrategy):
        self.l1_cache = l1_cache  # Cache rapide (mémoire)
        self.l2_cache = l2_cache  # Cache plus lent (Redis)
    
    async def get(self, key: str) -> Optional[Any]:
        # Essayer L1 d'abord
        value = await self.l1_cache.get(key)
        if value is not None:
            return value
        
        # Essayer L2
        value = await self.l2_cache.get(key)
        if value is not None:
            # Mettre en L1 pour les prochains accès
            await self.l1_cache.set(key, value, ttl=300)
            return value
        
        return None
    
    async def set(self, key: str, value: Any, ttl: Optional[int] = None):
        # Mettre dans les deux niveaux
        await self.l1_cache.set(key, value, ttl=min(ttl or 3600, 300))  # L1: max 5min
        await self.l2_cache.set(key, value, ttl)
    
    async def delete(self, key: str):
        await self.l1_cache.delete(key)
        await self.l2_cache.delete(key)
```

**Redis pour le cache distribué**
```python
import redis.asyncio as redis
from typing import Any, Optional
import json
import pickle

class RedisCache(CacheStrategy):
    def __init__(self, host: str = 'localhost', port: int = 6379, db: int = 0):
        self.redis = redis.Redis(host=host, port=port, db=db, decode_responses=False)
    
    async def get(self, key: str) -> Optional[Any]:
        data = await self.redis.get(key)
        if data:
            return pickle.loads(data)
        return None
    
    async def set(self, key: str, value: Any, ttl: Optional[int] = None):
        data = pickle.dumps(value)
        if ttl:
            await self.redis.setex(key, ttl, data)
        else:
            await self.redis.set(key, data)
    
    async def delete(self, key: str):
        await self.redis.delete(key)

# Cache avec sérialisation JSON pour les types simples
class RedisJSONCache(CacheStrategy):
    def __init__(self, host: str = 'localhost', port: int = 6379, db: int = 0):
        self.redis = redis.Redis(host=host, port=port, db=db, decode_responses=True)
    
    async def get(self, key: str) -> Optional[Any]:
        data = await self.redis.get(key)
        if data:
            return json.loads(data)
        return None
    
    async def set(self, key: str, value: Any, ttl: Optional[int] = None):
        data = json.dumps(value)
        if ttl:
            await self.redis.setex(key, ttl, data)
        else:
            await self.redis.set(key, data)
    
    async def delete(self, key: str):
        await self.redis.delete(key)

# Patterns de clés de cache
class CacheKeyGenerator:
    @staticmethod
    def task_key(task_id: int) -> str:
        return f"task:{task_id}"
    
    @staticmethod
    def user_tasks_key(user_id: int) -> str:
        return f"user:{user_id}:tasks"
    
    @staticmethod
    def tasks_list_key(filters: dict) -> str:
        # Créer une clé déterministe à partir des filtres
        filter_str = json.dumps(filters, sort_keys=True)
        return f"tasks:list:{hashlib.md5(filter_str.encode()).hexdigest()}"
```

**Invalidation intelligente du cache**
```python
class CacheInvalidator:
    def __init__(self, cache: CacheStrategy):
        self.cache = cache
    
    async def invalidate_task(self, task_id: int):
        """Invalider toutes les clés liées à une tâche"""
        keys_to_delete = [
            CacheKeyGenerator.task_key(task_id),
            # Invalider aussi les listes qui pourraient contenir cette tâche
            f"tasks:list:*"  # Pattern pour les clés de liste
        ]
        
        for key in keys_to_delete:
            if '*' in key:
                # Pour les patterns, utiliser scan dans Redis
                await self._delete_pattern(key)
            else:
                await self.cache.delete(key)
    
    async def invalidate_user_tasks(self, user_id: int):
        """Invalider le cache des tâches d'un utilisateur"""
        key = CacheKeyGenerator.user_tasks_key(user_id)
        await self.cache.delete(key)
    
    async def _delete_pattern(self, pattern: str):
        """Supprimer toutes les clés matching un pattern (Redis uniquement)"""
        if hasattr(self.cache, 'redis'):
            cursor = 0
            while True:
                cursor, keys = await self.cache.redis.scan(cursor, match=pattern, count=100)
                if keys:
                    await self.cache.redis.delete(*keys)
                if cursor == 0:
                    break

# Cache avec invalidation automatique
class SelfInvalidatingCache:
    def __init__(self, cache: CacheStrategy, invalidator: CacheInvalidator):
        self.cache = cache
        self.invalidator = invalidator
    
    async def get_or_set(self, key: str, getter_func, ttl: int = 300):
        """Récupérer du cache ou définir et mettre en cache"""
        value = await self.cache.get(key)
        if value is not None:
            return value
        
        # Appeler la fonction pour obtenir la valeur
        value = await getter_func()
        await self.cache.set(key, value, ttl)
        return value

# Utilisation dans le repository
class CachedTaskRepository(TaskRepository):
    def __init__(self, base_repository: TaskRepository, cache: SelfInvalidatingCache):
        self.base_repository = base_repository
        self.cache = cache
    
    async def save(self, task: Task) -> Task:
        saved_task = await self.base_repository.save(task)
        
        # Invalider le cache pour cette tâche
        await self.cache.invalidator.invalidate_task(task.id)
        
        return saved_task
    
    async def get_by_id(self, task_id: int) -> Optional[Task]:
        key = CacheKeyGenerator.task_key(task_id)
        
        async def fetch_from_db():
            return await self.base_repository.get_by_id(task_id)
        
        return await self.cache.get_or_set(key, fetch_from_db, ttl=600)
```

**Cache distribué avec Redis Cluster**
```python
# Configuration Redis Cluster
class RedisClusterCache(CacheStrategy):
    def __init__(self, startup_nodes):
        from rediscluster import RedisCluster
        self.redis = RedisCluster(startup_nodes=startup_nodes, decode_responses=False)
    
    async def get(self, key: str) -> Optional[Any]:
        data = await self.redis.get(key)
        if data:
            return pickle.loads(data)
        return None
    
    async def set(self, key: str, value: Any, ttl: Optional[int] = None):
        data = pickle.dumps(value)
        if ttl:
            await self.redis.setex(key, ttl, data)
        else:
            await self.redis.set(key, data)
    
    async def delete(self, key: str):
        await self.redis.delete(key)

# Cache avec circuit breaker
class CircuitBreakerCache:
    def __init__(self, cache: CacheStrategy, failure_threshold: int = 5):
        self.cache = cache
        self.failure_threshold = failure_threshold
        self.failures = 0
        self.state = 'closed'  # closed, open, half-open
    
    async def get(self, key: str) -> Optional[Any]:
        if self.state == 'open':
            return None  # Circuit ouvert, pas d'appel
        
        try:
            result = await self.cache.get(key)
            self._reset()  # Succès, reset du circuit
            return result
        except Exception:
            self._record_failure()
            raise
    
    def _record_failure(self):
        self.failures += 1
        if self.failures >= self.failure_threshold:
            self.state = 'open'
    
    def _reset(self):
        self.failures = 0
        self.state = 'closed'
```

**Démonstration pratique (15 min)**
Configuration d'un système de cache multi-niveau avec Redis.

**Exercices guidés (10 min)**
1. Implémenter un cache LRU en mémoire
2. Configurer Redis pour le cache distribué
3. Mettre en place l'invalidation automatique

**QCM d'auto-évaluation (3 min)**
1. Quelle stratégie pour un cache multi-niveau ?
2. Quand invalider le cache ?
3. Quelle différence entre pickle et JSON pour le cache ?

**Devoir**
Implémenter un système de cache avancé dans l'application "Tâches".

---

## Cours 10 - Optimisation base de données
**Objectifs**
- Optimiser les requêtes SQL et les index
- Configurer le connection pooling
- Mettre en place la réplication et le partitioning

**Leçon (30 min - détaillée)**
L'optimisation de la base de données est cruciale pour les performances applicatives.

**Index et optimisation des requêtes**
```python
# Analyse des requêtes lentes
def analyze_slow_queries():
    """Identifier les requêtes lentes avec EXPLAIN"""
    queries = [
        "SELECT * FROM tasks WHERE user_id = ? AND status = ?",
        "SELECT * FROM tasks WHERE created_at BETWEEN ? AND ? ORDER BY priority DESC",
        "SELECT COUNT(*) FROM tasks t JOIN users u ON t.user_id = u.id WHERE u.active = true"
    ]
    
    for query in queries:
        print(f"EXPLAIN for: {query}")
        # En PostgreSQL
        result = db.execute(f"EXPLAIN ANALYZE {query}", params)
        print(result.fetchall())
        print("-" * 50)

# Index stratégiques
def create_optimized_indexes():
    """Création d'index optimisés"""
    
    # Index simples
    db.execute("CREATE INDEX idx_tasks_user_id ON tasks(user_id)")
    db.execute("CREATE INDEX idx_tasks_status ON tasks(status)")
    db.execute("CREATE INDEX idx_tasks_created_at ON tasks(created_at)")
    
    # Index composites (pour les requêtes multi-colonnes)
    db.execute("CREATE INDEX idx_tasks_user_status ON tasks(user_id, status)")
    db.execute("CREATE INDEX idx_tasks_user_created ON tasks(user_id, created_at DESC)")
    
    # Index partiels (pour les données fréquemment filtrées)
    db.execute("CREATE INDEX idx_active_tasks ON tasks(created_at) WHERE completed = false")
    
    # Index fonctionnels
    db.execute("CREATE INDEX idx_tasks_title_lower ON tasks(LOWER(title))")
    
    # Index GIN pour les recherches full-text (PostgreSQL)
    db.execute("CREATE INDEX idx_tasks_title_fts ON tasks USING GIN(to_tsvector('english', title))")

# Requêtes optimisées
class OptimizedTaskQueries:
    @staticmethod
    def get_user_tasks_optimized(user_id: int, status: Optional[str] = None, limit: int = 50):
        """Requête optimisée avec index"""
        query = """
        SELECT t.id, t.title, t.description, t.status, t.priority, t.created_at, t.updated_at
        FROM tasks t
        WHERE t.user_id = %s
        """
        params = [user_id]
        
        if status:
            query += " AND t.status = %s"
            params.append(status)
        
        query += " ORDER BY t.created_at DESC LIMIT %s"
        params.append(limit)
        
        return db.execute(query, params).fetchall()
    
    @staticmethod
    def get_tasks_summary_optimized():
        """Résumé optimisé avec agrégation"""
        query = """
        SELECT 
            DATE(created_at) as date,
            status,
            COUNT(*) as count,
            AVG(priority) as avg_priority
        FROM tasks
        WHERE created_at >= CURRENT_DATE - INTERVAL '30 days'
        GROUP BY DATE(created_at), status
        ORDER BY date DESC, status
        """
        
        return db.execute(query).fetchall()
    
    @staticmethod
    def search_tasks_optimized(search_term: str, user_id: int):
        """Recherche full-text optimisée"""
        query = """
        SELECT id, title, description, 
               ts_rank(to_tsvector('english', title || ' ' || description), plainto_tsquery(%s)) as rank
        FROM tasks
        WHERE user_id = %s 
          AND to_tsvector('english', title || ' ' || description) @@ plainto_tsquery(%s)
        ORDER BY rank DESC
        LIMIT 20
        """
        
        return db.execute(query, [search_term, user_id, search_term]).fetchall()
```

**Connection pooling**
```python
from sqlalchemy import create_engine, pool
from sqlalchemy.orm import sessionmaker, scoped_session

# Configuration du pool de connexions
def create_optimized_engine(database_url: str):
    """Création d'un engine avec pool optimisé"""
    
    engine = create_engine(
        database_url,
        poolclass=pool.QueuePool,  # Pool thread-safe
        pool_size=10,              # Nombre de connexions maintenues
        max_overflow=20,           # Connexions supplémentaires possibles
        pool_timeout=30,           # Timeout pour obtenir une connexion
        pool_recycle=3600,        # Recycle des connexions après 1h
        pool_pre_ping=True,       # Vérifier la connexion avant usage
        echo=False                 # Pas de log SQL en prod
    )
    
    return engine

# Session factory optimisée
def create_session_factory(engine):
    """Factory de sessions optimisée"""
    
    session_factory = sessionmaker(
        bind=engine,
        autocommit=False,
        autoflush=False,
        expire_on_commit=False  # Important pour les performances
    )
    
    # Session scopée pour le threading
    Session = scoped_session(session_factory)
    
    return Session

# Utilisation dans l'application
class DatabaseManager:
    def __init__(self, database_url: str):
        self.engine = create_optimized_engine(database_url)
        self.Session = create_session_factory(self.engine)
    
    def get_session(self):
        """Obtenir une session du pool"""
        return self.Session()
    
    def health_check(self):
        """Vérification de la santé de la DB"""
        try:
            with self.engine.connect() as conn:
                result = conn.execute("SELECT 1")
                return result.fetchone() is not None
        except Exception:
            return False

# Gestionnaire global
db_manager = DatabaseManager(os.getenv('DATABASE_URL'))

# Utilisation dans les repositories
class TaskRepository:
    def __init__(self):
        self.db_manager = db_manager
    
    def get_user_tasks(self, user_id: int):
        session = self.db_manager.get_session()
        try:
            tasks = session.query(Task).filter_by(user_id=user_id).all()
            return tasks
        finally:
            session.close()  # Retour de la connexion au pool
```

**Réplication et haute disponibilité**
```python
# Configuration réplication PostgreSQL
POSTGRES_REPLICATION_CONFIG = """
# postgresql.conf pour le primaire
wal_level = replica
max_wal_senders = 3
wal_keep_size = 64
synchronous_commit = on
synchronous_standby_names = 'FIRST 1 (replica1, replica2)'

# pg_hba.conf
host replication repl_user replica1 trust
host replication repl_user replica2 trust
"""

# Configuration des replicas
REPLICA_CONFIG = """
# recovery.conf
primary_conninfo = 'host=primary_host port=5432 user=repl_user password=repl_password'
restore_command = 'cp /var/lib/postgresql/archive/%f %p'
recovery_target_timeline = 'latest'
standby_mode = on
"""

# Routing intelligent des requêtes
class SmartDatabaseRouter:
    def __init__(self, primary_db, replica_dbs):
        self.primary = primary_db
        self.replicas = replica_dbs
        self.replica_index = 0
    
    def get_read_connection(self):
        """Connexion pour les lectures (round-robin)"""
        if not self.replicas:
            return self.primary
        
        replica = self.replicas[self.replica_index % len(self.replicas)]
        self.replica_index += 1
        return replica
    
    def get_write_connection(self):
        """Connexion pour les écritures (toujours primaire)"""
        return self.primary

# Utilisation dans les repositories
class ReplicatedTaskRepository(TaskRepository):
    def __init__(self, router: SmartDatabaseRouter):
        self.router = router
    
    def get_user_tasks(self, user_id: int):
        """Lecture depuis un replica"""
        conn = self.router.get_read_connection()
        # Logique de requête...
    
    def save(self, task: Task):
        """Écriture vers le primaire"""
        conn = self.router.get_write_connection()
        # Logique de sauvegarde...
```

**Partitioning et sharding**
```python
# Partitioning par date (PostgreSQL)
PARTITIONING_SETUP = """
-- Fonction de création de partitions
CREATE OR REPLACE FUNCTION create_task_partition(start_date DATE, end_date DATE)
RETURNS VOID AS $$
DECLARE
    partition_name TEXT;
BEGIN
    partition_name := 'tasks_' || to_char(start_date, 'YYYY_MM');
    
    EXECUTE format('CREATE TABLE IF NOT EXISTS %I PARTITION OF tasks
                    FOR VALUES FROM (%L) TO (%L)',
                   partition_name, start_date, end_date);
    
    EXECUTE format('CREATE INDEX IF NOT EXISTS idx_%s_created_at ON %I(created_at)',
                   partition_name, partition_name);
END;
$$ LANGUAGE plpgsql;

-- Table partitionnée
CREATE TABLE tasks (
    id SERIAL,
    title VARCHAR(200) NOT NULL,
    description TEXT,
    user_id INTEGER NOT NULL,
    status VARCHAR(20) DEFAULT 'todo',
    priority INTEGER DEFAULT 1,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
) PARTITION BY RANGE (created_at);

-- Création des partitions mensuelles
SELECT create_task_partition('2024-01-01', '2024-02-01');
SELECT create_task_partition('2024-02-01', '2024-03-01');
-- etc.
"""

# Sharding par user_id
class ShardedDatabaseManager:
    def __init__(self, shard_configs):
        self.shards = {}
        for shard_id, config in shard_configs.items():
            self.shards[shard_id] = create_engine(config['url'])
    
    def get_shard_for_user(self, user_id: int) -> str:
        """Déterminer le shard pour un utilisateur"""
        # Sharding simple par modulo
        shard_count = len(self.shards)
        shard_id = f"shard_{(user_id % shard_count) + 1}"
        return shard_id
    
    def get_connection_for_user(self, user_id: int):
        """Connexion au bon shard"""
        shard_id = self.get_shard_for_user(user_id)
        return self.shards[shard_id].connect()
```

**Optimisation des migrations**
```python
# Migrations optimisées
from alembic import op
import sqlalchemy as sa

def upgrade():
    # Création d'index concurrently (PostgreSQL)
    op.execute("CREATE INDEX CONCURRENTLY idx_tasks_user_status ON tasks(user_id, status)")
    
    # Ajout de colonnes avec valeur par défaut
    op.add_column('tasks', sa.Column('archived', sa.Boolean(), server_default='false'))
    
    # Mise à jour en lots pour éviter les locks
    connection = op.get_bind()
    
    # Batch update pour éviter les timeouts
    batch_size = 1000
    offset = 0
    
    while True:
        result = connection.execute(
            sa.text("SELECT id FROM tasks WHERE archived IS NULL LIMIT :limit OFFSET :offset"),
            {"limit": batch_size, "offset": offset}
        )
        
        ids = [row[0] for row in result]
        if not ids:
            break
        
        # Mise à jour par lot
        connection.execute(
            sa.text("UPDATE tasks SET archived = false WHERE id = ANY(:ids)"),
            {"ids": ids}
        )
        
        offset += batch_size

def downgrade():
    op.drop_index('idx_tasks_user_status')
    op.drop_column('tasks', 'archived')
```

**Démonstration pratique (15 min)**
Optimisation d'une base de données avec index et requêtes.

**Exercices guidés (10 min)**
1. Créer des index optimisés pour des requêtes fréquentes
2. Configurer un connection pool
3. Analyser et optimiser une requête lente

**QCM d'auto-évaluation (3 min)**
1. Quel index pour une requête multi-colonnes ?
2. Pourquoi utiliser un connection pool ?
3. Quelle différence entre réplication et partitioning ?

**Devoir**
Optimiser complètement la base de données de l'application "Tâches".

---

## Cours 11 - Tests avancés
**Objectifs**
- Maîtriser TDD et les tests de qualité
- Implémenter les tests de performance et de charge
- Utiliser la génération automatique de tests

**Leçon (30 min - détaillée)**
Les tests avancés garantissent la qualité et la maintenabilité du code.

**Test-Driven Development (TDD)**
```python
# test_task_service.py
import pytest
from unittest.mock import Mock, patch
from app.services.task_service import TaskService
from app.entities.task import Task

class TestTaskService:
    def setup_method(self):
        """Configuration avant chaque test"""
        self.mock_repository = Mock()
        self.service = TaskService(self.mock_repository)
    
    def test_create_task_success(self):
        """Test création tâche réussie"""
        # Arrange
        task_data = {"title": "Test Task", "description": "Test Description"}
        expected_task = Task(id=1, title="Test Task", description="Test Description")
        self.mock_repository.save.return_value = expected_task
        
        # Act
        result = self.service.create_task(task_data)
        
        # Assert
        assert result == expected_task
        self.mock_repository.save.assert_called_once()
        saved_task = self.mock_repository.save.call_args[0][0]
        assert saved_task.title == "Test Task"
    
    def test_create_task_validation_error(self):
        """Test validation titre trop court"""
        # Arrange
        task_data = {"title": "A", "description": "Test"}
        
        # Act & Assert
        with pytest.raises(ValueError, match="Title too short"):
            self.service.create_task(task_data)
        
        self.mock_repository.save.assert_not_called()
    
    def test_get_user_tasks_filters_correctly(self):
        """Test filtrage des tâches utilisateur"""
        # Arrange
        user_id = 1
        mock_tasks = [
            Task(id=1, title="Task 1", user_id=1, completed=False),
            Task(id=2, title="Task 2", user_id=1, completed=True),
            Task(id=3, title="Task 3", user_id=2, completed=False)
        ]
        self.mock_repository.get_all.return_value = mock_tasks
        
        # Act
        result = self.service.get_user_tasks(user_id, completed=False)
        
        # Assert
        assert len(result) == 1
        assert result[0].id == 1
        assert not result[0].completed

# Tests paramétrés
@pytest.mark.parametrize("title,description,expected_valid", [
    ("Valid Title", "Valid Description", True),
    ("A", "Valid", False),  # Titre trop court
    ("Valid", "", True),    # Description optionnelle
    ("", "Valid", False),   # Titre requis
])
def test_task_validation(title, description, expected_valid):
    service = TaskService(Mock())
    
    task_data = {"title": title, "description": description}
    
    if expected_valid:
        # Ne devrait pas lever d'exception
        service.create_task(task_data)
    else:
        with pytest.raises(ValueError):
            service.create_task(task_data)
```

**Property-based testing avec Hypothesis**
```python
from hypothesis import given, strategies as st, assume
import hypothesis.strategies as hst

class TestTaskProperties:
    @given(
        title=hst.text(min_size=1, max_size=200),
        description=hst.text(max_size=1000)
    )
    def test_task_creation_properties(self, title, description):
        """Test propriétés de création de tâche"""
        assume(len(title.strip()) > 0)  # Titre non vide après trim
        
        service = TaskService(Mock())
        task_data = {"title": title, "description": description}
        
        # Propriété: La tâche créée doit avoir le même titre (trimé)
        result = service.create_task(task_data)
        assert result.title == title.strip()
        
        # Propriété: La description doit être préservée
        assert result.description == description
    
    @given(
        tasks=hst.lists(
            hst.builds(Task, 
                      id=hst.integers(min_value=1),
                      title=hst.text(min_size=1, max_size=100),
                      completed=hst.booleans()),
            min_size=1, max_size=50
        )
    )
    def test_task_filtering_properties(self, tasks):
        """Test propriétés du filtrage"""
        service = TaskService(Mock())
        service.repository.get_all.return_value = tasks
        
        # Propriété: Filtrage completed ne retourne que les tâches terminées
        completed_tasks = service.get_user_tasks(1, completed=True)
        assert all(task.completed for task in completed_tasks)
        
        # Propriété: Nombre total = completed + non completed
        all_tasks = service.get_user_tasks(1)
        completed_count = len([t for t in all_tasks if t.completed])
        not_completed_count = len([t for t in all_tasks if not t.completed])
        assert len(all_tasks) == completed_count + not_completed_count

# Stratégies personnalisées
@st.composite
def valid_task_data(draw):
    """Stratégie pour générer des données de tâche valides"""
    title = draw(st.text(min_size=3, max_size=200).filter(lambda x: x.strip()))
    description = draw(st.text(max_size=1000))
    
    return {
        "title": title,
        "description": description
    }

@given(task_data=valid_task_data())
def test_task_creation_with_valid_data(task_data):
    service = TaskService(Mock())
    result = service.create_task(task_data)
    
    assert result.title == task_data["title"].strip()
    assert result.description == task_data["description"]
```

**Tests d'intégration**
```python
# tests/integration/test_task_workflow.py
import pytest
from app import create_app
from app.extensions import db
from app.models import Task, User

@pytest.fixture
def app():
    app = create_app('testing')
    with app.app_context():
        db.create_all()
        yield app
        db.drop_all()

@pytest.fixture
def client(app):
    return app.test_client()

@pytest.fixture
def test_user(app):
    with app.app_context():
        user = User(username='testuser', email='test@example.com')
        user.set_password('password')
        db.session.add(user)
        db.session.commit()
        return user

class TestTaskWorkflow:
    def test_complete_task_workflow(self, client, test_user):
        """Test workflow complet de création à complétion"""
        # 1. Créer une tâche
        response = client.post('/api/tasks', 
                              json={
                                  'title': 'Integration Test Task',
                                  'description': 'Testing complete workflow'
                              },
                              headers={'Authorization': f'Bearer {get_token(test_user)}'})
        
        assert response.status_code == 201
        task_data = response.get_json()
        task_id = task_data['id']
        
        # 2. Vérifier que la tâche existe
        response = client.get(f'/api/tasks/{task_id}',
                             headers={'Authorization': f'Bearer {get_token(test_user)}'})
        assert response.status_code == 200
        
        # 3. Mettre à jour la tâche
        response = client.put(f'/api/tasks/{task_id}',
                             json={'title': 'Updated Task'},
                             headers={'Authorization': f'Bearer {get_token(test_user)}'})
        assert response.status_code == 200
        
        # 4. Compléter la tâche
        response = client.post(f'/api/tasks/{task_id}/complete',
                              headers={'Authorization': f'Bearer {get_token(test_user)}'})
        assert response.status_code == 200
        
        # 5. Vérifier que la tâche est complétée
        response = client.get(f'/api/tasks/{task_id}',
                             headers={'Authorization': f'Bearer {get_token(test_user)}'})
        assert response.status_code == 200
        assert response.get_json()['completed'] == True

# Tests contractuels avec Pact
from pact import Consumer, Provider

pact = Consumer('TaskService').has_pact_with(Provider('UserService'))

@pact.given('user exists')
@pact.upon_receiving('a request for user details')
@pact.with_request({'method': 'GET', 'path': '/users/123'})
@pact.will_respond_with({'status': 200, 'body': {'id': 123, 'name': 'Test User'}})
def test_user_service_contract():
    # Test d'intégration avec contrat
    pass
```

**Tests de performance**
```python
# tests/performance/test_performance.py
import pytest
import time
from locust import HttpUser, task, between

class TestPerformance:
    def test_task_creation_performance(self, benchmark):
        """Test performance création de tâches"""
        service = TaskService(Mock())
        
        def create_task():
            task_data = {"title": "Performance Test Task", "description": "Test"}
            return service.create_task(task_data)
        
        # Benchmark avec pytest-benchmark
        result = benchmark(create_task)
        assert result.title == "Performance Test Task"
    
    def test_database_query_performance(self, benchmark, app):
        """Test performance requêtes DB"""
        with app.app_context():
            # Créer des données de test
            create_test_tasks(1000)
            
            def query_tasks():
                return Task.query.filter_by(completed=False).all()
            
            result = benchmark(query_tasks)
            assert len(result) > 0

# Tests de charge avec Locust
class TaskUser(HttpUser):
    wait_time = between(1, 3)
    
    @task
    def create_task(self):
        self.client.post("/api/tasks", json={
            "title": f"Load Test Task {time.time()}",
            "description": "Load testing task"
        })
    
    @task(3)  # 3x plus fréquent
    def get_tasks(self):
        self.client.get("/api/tasks")

# Tests de montée en charge
def test_scalability():
    """Test de montée en charge progressive"""
    # Simulation d'augmentation progressive de la charge
    user_counts = [10, 50, 100, 200]
    
    for user_count in user_counts:
        start_time = time.time()
        
        # Simuler user_count utilisateurs simultanés
        results = simulate_concurrent_requests(user_count)
        
        end_time = time.time()
        duration = end_time - start_time
        
        # Vérifier les métriques
        success_rate = sum(1 for r in results if r['status'] == 200) / len(results)
        avg_response_time = sum(r['response_time'] for r in results) / len(results)
        
        print(f"Users: {user_count}, Success: {success_rate:.2%}, Avg Time: {avg_response_time:.2f}s")
        
        # Assertions de performance
        assert success_rate > 0.95  # 95% de succès minimum
        assert avg_response_time < 2.0  # < 2s de temps de réponse moyen
```

**Mutation testing**
```python
# tests/mutation/test_mutation.py
import mutmut

# Configuration mutmut
"""
[mutmut]
paths_to_mutate = app/
tests_dir = tests/
"""

# Test d'exemple pour mutation testing
def test_task_completion_logic():
    """Test que la logique de complétion fonctionne"""
    task = Task(id=1, title="Test", completed=False)
    
    # Cette assertion devrait échouer si le mutant change completed = True en completed = False
    task.mark_completed()
    assert task.completed == True
    
    # Cette assertion devrait échouer si le mutant enlève la mise à jour de updated_at
    assert task.updated_at is not None

# Commandes mutmut
"""
# Exécuter les tests avec mutations
mutmut run

# Voir les résultats
mutmut results

# Générer un rapport HTML
mutmut html
"""
```

**Démonstration pratique (15 min)**
Écriture de tests TDD et property-based.

**Exercices guidés (10 min)**
1. Écrire un test TDD pour une nouvelle fonctionnalité
2. Créer des tests paramétrés
3. Implémenter des tests d'intégration

**QCM d'auto-évaluation (3 min)**
1. Quelle différence entre test unitaire et d'intégration ?
2. Quand utiliser les tests property-based ?
3. Quel outil pour les tests de charge ?

**Devoir**
Implémenter une suite complète de tests avancés pour l'application "Tâches".

---

## Cours 12 - Property-based testing
**Objectifs**
- Maîtriser Hypothesis pour les tests basés sur les propriétés
- Générer automatiquement des cas de test
- Découvrir des bugs cachés

**Leçon (30 min - détaillée)**
Les tests property-based trouvent des bugs que les tests traditionnels manquent.

**Concepts de base Hypothesis**
```python
from hypothesis import given, strategies as st, assume
import hypothesis.strategies as hst

# Stratégies de base
@given(
    x=st.integers(),
    y=st.integers()
)
def test_commutative_addition(x, y):
    """Propriété: l'addition est commutative"""
    assert x + y == y + x

@given(
    text=st.text(min_size=1)
)
def test_string_upper_lower(text):
    """Propriété: upper puis lower revient au départ"""
    assert text.upper().lower() == text.lower()

# Stratégies complexes
@given(
    numbers=st.lists(st.integers(min_value=0, max_value=100), min_size=1, max_size=100)
)
def test_list_max_property(numbers):
    """Propriété: le max d'une liste est >= à tous les éléments"""
    maximum = max(numbers)
    for num in numbers:
        assert maximum >= num

# Filtres et assumptions
@given(
    x=st.integers(),
    y=st.integers()
)
def test_division_by_non_zero(x, y):
    assume(y != 0)  # Ignorer les cas où y = 0
    result = x / y
    assert isinstance(result, float)

# Stratégies personnalisées
@st.composite
def valid_email_strategy(draw):
    """Stratégie pour générer des emails valides"""
    username = draw(st.text(alphabet=st.characters(whitelist_categories=('L', 'N')), min_size=1, max_size=20))
    domain = draw(st.text(alphabet=st.characters(whitelist_categories=('L', 'N')), min_size=1, max_size=10))
    tld = draw(st.sampled_from(['com', 'org', 'net', 'edu']))
    
    return f"{username}@{domain}.{tld}"

@given(email=valid_email_strategy())
def test_email_validation(email):
    """Test validation email avec données générées"""
    # Votre logique de validation
    assert '@' in email
    assert '.' in email.split('@')[1]
```

**Application aux entités métier**
```python
# test_task_properties.py
from hypothesis import given, strategies as st
from app.entities.task import Task, TaskStatus

# Stratégie pour générer des tâches valides
@st.composite
def valid_task_strategy(draw):
    task_id = draw(st.integers(min_value=1, max_value=10000))
    title = draw(st.text(min_size=1, max_size=200).filter(lambda x: x.strip()))
    description = draw(st.text(max_size=1000))
    completed = draw(st.booleans())
    priority = draw(st.integers(min_value=1, max_value=5))
    
    return Task(
        id=task_id,
        title=title,
        description=description,
        completed=completed,
        priority=priority
    )

class TestTaskProperties:
    @given(task=valid_task_strategy())
    def test_task_completion_properties(self, task):
        """Propriétés de la complétion de tâche"""
        original_completed = task.completed
        original_updated = task.updated_at
        
        # Action
        task.mark_completed()
        
        # Propriétés
        assert task.completed == True
        assert task.updated_at >= original_updated
        
        # Propriété idempotente: marquer complète plusieurs fois ne change rien
        task.mark_completed()
        assert task.completed == True
    
    @given(
        title=st.text(min_size=1, max_size=200),
        description=st.text(max_size=1000)
    )
    def test_task_creation_properties(self, title, description):
        """Propriétés de création de tâche"""
        assume(len(title.strip()) > 0)  # Titre non vide
        
        task = Task(
            id=1,
            title=title,
            description=description
        )
        
        # Propriétés
        assert task.title == title.strip()  # Le titre est trimé
        assert task.description == description  # Description préservée
        assert task.completed == False  # Par défaut non complétée
        assert task.priority == 1  # Priorité par défaut
    
    @given(
        tasks=st.lists(valid_task_strategy(), min_size=1, max_size=50)
    )
    def test_task_collection_properties(self, tasks):
        """Propriétés sur les collections de tâches"""
        # Propriété: filtrer les tâches complétées
        completed_tasks = [t for t in tasks if t.completed]
        assert all(t.completed for t in completed_tasks)
        
        # Propriété: le nombre total = complétées + non complétées
        total_completed = len([t for t in tasks if t.completed])
        total_not_completed = len([t for t in tasks if not t.completed])
        assert len(tasks) == total_completed + total_not_completed
        
        # Propriété: les priorités sont dans les limites
        for task in tasks:
            assert 1 <= task.priority <= 5

# Tests de services
class TestTaskServiceProperties:
    @given(
        title=st.text(min_size=3, max_size=200).filter(lambda x: x.strip()),
        description=st.text(max_size=1000)
    )
    def test_task_service_creation_properties(self, title, description):
        """Propriétés du service de création de tâches"""
        service = TaskService(Mock())
        
        task_data = {"title": title, "description": description}
        
        # Action
        result = service.create_task(task_data)
        
        # Propriétés
        assert result.title == title.strip()
        assert result.description == description
        assert result.id is not None
        assert isinstance(result.created_at, datetime)
        
        # Vérifier que le repository a été appelé
        service.repository.save.assert_called_once()
```

**Tests de sécurité avec Hypothesis**
```python
# test_security_properties.py
from hypothesis import given, strategies as st, settings

class TestSecurityProperties:
    @given(
        input_data=st.text()  # Toute entrée possible
    )
    def test_sql_injection_resistance(self, input_data):
        """Test résistance aux injections SQL"""
        # Simuler une requête avec entrée utilisateur
        query = f"SELECT * FROM tasks WHERE title = '{input_data}'"
        
        # Avec SQLAlchemy, les paramètres sont sécurisés
        from sqlalchemy import text
        safe_query = text("SELECT * FROM tasks WHERE title = :title")
        
        # La requête paramétrée est toujours sûre
        assert ":title" in str(safe_query)
        
        # Test que l'entrée brute n'est pas exécutée directement
        dangerous_patterns = ["'", "DROP", "UNION", "SELECT"]
        for pattern in dangerous_patterns:
            # Les patterns dangereux dans l'entrée ne devraient pas affecter la sécurité
            # car on utilise des requêtes paramétrées
            pass
    
    @given(
        user_input=st.text()
    )
    @settings(max_examples=1000)  # Plus d'exemples pour la sécurité
    def test_xss_prevention(self, user_input):
        """Test prévention XSS"""
        from flask import escape
        
        # Simuler affichage de contenu utilisateur
        safe_output = escape(user_input)
        
        # Propriété: le contenu dangereux est échappé
        dangerous_tags = ["<script>", "</script>", "<img", "javascript:"]
        for tag in dangerous_tags:
            if tag in user_input:
                # Le tag devrait être échappé dans la sortie
                assert tag not in safe_output or escape(tag) in safe_output
    
    @given(
        password=st.text(min_size=1)
    )
    def test_password_hashing_properties(self, password):
        """Propriétés du hashage de mot de passe"""
        from werkzeug.security import generate_password_hash, check_password_hash
        
        # Hash du mot de passe
        hashed = generate_password_hash(password)
        
        # Propriétés
        assert hashed != password  # Le hash n'est pas le mot de passe en clair
        assert check_password_hash(hashed, password)  # Vérification fonctionne
        assert not check_password_hash(hashed, password + "wrong")  # Mauvais mot de passe échoue
        
        # Propriété: même mot de passe donne des hashs différents (salt)
        hashed2 = generate_password_hash(password)
        assert hashed != hashed2  # Différents à cause du salt
        assert check_password_hash(hashed2, password)  # Mais vérification fonctionne

# Tests de performance avec Hypothesis
class TestPerformanceProperties:
    @given(
        task_count=st.integers(min_value=1, max_value=1000)
    )
    def test_performance_scaling(self, task_count):
        """Test que les performances scalent correctement"""
        import time
        
        # Créer des tâches de test
        tasks = [Task(id=i, title=f"Task {i}") for i in range(task_count)]
        
        # Mesurer le temps de traitement
        start_time = time.time()
        result = process_tasks(tasks)  # Votre fonction à tester
        end_time = time.time()
        
        duration = end_time - start_time
        
        # Propriété: le temps ne devrait pas croître de manière exponentielle
        # Pour N tâches, temps ≈ O(N) ou O(N log N) maximum
        max_expected_time = task_count * 0.01  # 10ms par tâche max
        
        assert duration < max_expected_time, f"Performance trop lente: {duration}s pour {task_count} tâches"
```

**Configuration avancée d'Hypothesis**
```python
# pytest.ini ou setup.cfg
"""
[tool:pytest]
addopts = --hypothesis-profile=ci

[tool:hypothesis]
max_examples = 100
deadline = 1000
suppress_health_check = [HealthCheck.too_slow]
"""

# Configuration programmatique
from hypothesis import settings, Phase

@settings(
    max_examples=200,  # Plus d'exemples pour une meilleure couverture
    deadline=None,     # Pas de timeout
    phases=[Phase.explicit, Phase.reuse, Phase.generate, Phase.target, Phase.shrink],
    suppress_health_check=[HealthCheck.too_slow, HealthCheck.filter_too_much]
)
@given(x=st.integers())
def test_with_custom_settings(x):
    pass

# Profils de configuration
from hypothesis import settings

# Profil pour le développement (rapide)
dev_settings = settings(max_examples=50, deadline=500)

# Profil pour CI (thorough)
ci_settings = settings(max_examples=500, deadline=None)

@given(x=st.integers())
@ci_settings
def test_with_ci_profile(x):
    pass
```

**Démonstration pratique (15 min)**
Écriture de tests property-based qui trouvent des bugs.

**Exercices guidés (10 min)**
1. Créer une stratégie personnalisée pour vos données
2. Écrire un test property-based
3. Analyser les résultats et les shrinking

**QCM d'auto-évaluation (3 min)**
1. Quelle différence avec les tests traditionnels ?
2. Que fait le shrinking dans Hypothesis ?
3. Quand utiliser assume() ?

**Devoir**
Implémenter des tests property-based pour l'application "Tâches".

---

## Cours 13 - Tests d'intégration
**Objectifs**
- Maîtriser les tests end-to-end
- Implémenter les tests de contrats
- Automatiser les tests d'intégration

**Leçon (30 min - détaillée)**
Les tests d'intégration valident le comportement global du système.

**Tests end-to-end avec Selenium**
```python
# tests/e2e/test_task_management.py
import pytest
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.chrome.options import Options

@pytest.fixture(scope="session")
def browser():
    """Fixture pour le navigateur Selenium"""
    options = Options()
    options.add_argument("--headless")  # Mode headless pour CI
    options.add_argument("--no-sandbox")
    options.add_argument("--disable-dev-shm-usage")
    
    driver = webdriver.Chrome(options=options)
    driver.implicitly_wait(10)
    
    yield driver
    driver.quit()

@pytest.fixture
def logged_in_user(browser, test_user):
    """Fixture pour utilisateur connecté"""
    browser.get("http://localhost:5000/login")
    
    # Remplir le formulaire de connexion
    browser.find_element(By.ID, "username").send_keys(test_user.username)
    browser.find_element(By.ID, "password").send_keys("password")
    browser.find_element(By.ID, "login-button").click()
    
    # Attendre la redirection
    WebDriverWait(browser, 10).until(
        EC.url_contains("/dashboard")
    )
    
    return test_user

class TestTaskManagementE2E:
    def test_complete_task_workflow(self, browser, logged_in_user):
        """Test workflow complet de gestion des tâches"""
        # Aller à la page des tâches
        browser.get("http://localhost:5000/tasks")
        
        # Créer une nouvelle tâche
        create_button = browser.find_element(By.ID, "create-task-button")
        create_button.click()
        
        # Remplir le formulaire
        title_field = browser.find_element(By.ID, "task-title")
        title_field.send_keys("E2E Test Task")
        
        description_field = browser.find_element(By.ID, "task-description")
        description_field.send_keys("Testing end-to-end functionality")
        
        # Soumettre
        submit_button = browser.find_element(By.ID, "submit-task")
        submit_button.click()
        
        # Vérifier que la tâche apparaît dans la liste
        WebDriverWait(browser, 10).until(
            EC.text_to_be_present_in_element((By.CLASS_NAME, "task-list"), "E2E Test Task")
        )
        
        # Marquer comme complétée
        task_element = browser.find_element(By.XPATH, "//div[contains(text(), 'E2E Test Task')]")
        complete_button = task_element.find_element(By.XPATH, ".//button[@class='complete-btn']")
        complete_button.click()
        
        # Vérifier que la tâche est marquée comme complétée
        WebDriverWait(browser, 10).until(
            EC.presence_of_element_located((By.CLASS_NAME, "completed-task"))
        )
        
        # Vérifier dans la base de données
        from app import db
        from app.models import Task
        task = Task.query.filter_by(title="E2E Test Task").first()
        assert task is not None
        assert task.completed == True

    def test_task_filtering(self, browser, logged_in_user):
        """Test du filtrage des tâches"""
        browser.get("http://localhost:5000/tasks")
        
        # Créer plusieurs tâches avec différents statuts
        self._create_task(browser, "Active Task", "active")
        self._create_task(browser, "Completed Task", "completed")
        
        # Filtrer par tâches actives
        active_filter = browser.find_element(By.ID, "filter-active")
        active_filter.click()
        
        # Vérifier que seule la tâche active est visible
        task_list = browser.find_element(By.CLASS_NAME, "task-list")
        tasks = task_list.find_elements(By.CLASS_NAME, "task-item")
        
        assert len(tasks) == 1
        assert "Active Task" in tasks[0].text
        
        # Filtrer par tâches complétées
        completed_filter = browser.find_element(By.ID, "filter-completed")
        completed_filter.click()
        
        WebDriverWait(browser, 10).until(
            lambda driver: len(driver.find_elements(By.CLASS_NAME, "task-item")) == 1
        )
        
        tasks = browser.find_elements(By.CLASS_NAME, "task-item")
        assert "Completed Task" in tasks[0].text
    
    def _create_task(self, browser, title, status="active"):
        """Helper pour créer une tâche"""
        create_button = browser.find_element(By.ID, "create-task-button")
        create_button.click()
        
        title_field = browser.find_element(By.ID, "task-title")
        title_field.send_keys(title)
        
        if status == "completed":
            status_checkbox = browser.find_element(By.ID, "task-completed")
            status_checkbox.click()
        
        submit_button = browser.find_element(By.ID, "submit-task")
        submit_button.click()
        
        # Attendre que la tâche apparaisse
        WebDriverWait(browser, 10).until(
            EC.text_to_be_present_in_element((By.CLASS_NAME, "task-list"), title)
        )
```

**Tests de contrats avec Pact**
```python
# tests/contracts/test_user_service_contract.py
from pact import Consumer, Provider
import pytest
import requests

# Définition du contrat
pact = Consumer('TaskService').has_pact_with(Provider('UserService'))

class TestUserServiceContract:
    @pact.given('user with id 123 exists')
    @pact.upon_receiving('a request for user 123')
    @pact.with_request({
        'method': 'GET',
        'path': '/api/users/123',
        'headers': {'Accept': 'application/json'}
    })
    @pact.will_respond_with({
        'status': 200,
        'headers': {'Content-Type': 'application/json'},
        'body': {
            'id': 123,
            'username': 'testuser',
            'email': 'test@example.com',
            'active': True
        }
    })
    def test_get_user_details(self):
        # Test d'intégration utilisant le contrat mock
        response = requests.get('http://localhost:8080/api/users/123')
        
        assert response.status_code == 200
        data = response.json()
        assert data['id'] == 123
        assert data['username'] == 'testuser'
        assert 'email' in data

    @pact.given('user service is available')
    @pact.upon_receiving('a request to create a user')
    @pact.with_request({
        'method': 'POST',
        'path': '/api/users',
        'headers': {'Content-Type': 'application/json'},
        'body': {
            'username': 'newuser',
            'email': 'new@example.com'
        }
    })
    @pact.will_respond_with({
        'status': 201,
        'headers': {'Content-Type': 'application/json'},
        'body': {
            'id': 456,
            'username': 'newuser',
            'email': 'new@example.com',
            'active': True
        }
    })
    def test_create_user(self):
        response = requests.post('http://localhost:8080/api/users',
                               json={
                                   'username': 'newuser',
                                   'email': 'new@example.com'
                               })
        
        assert response.status_code == 201
        data = response.json()
        assert data['username'] == 'newuser'
        assert data['id'] == 456

# Génération et vérification des contrats
"""
# Générer le pact file
pytest tests/contracts/ --pact-broker-url=http://localhost:9292 --pact-consumer-version=1.0.0

# Vérifier les contrats côté provider
pact-provider-verifier --provider-base-url=http://localhost:8080 \
                      --pact-url=./pacts/TaskService-UserService.json
"""
```

**Tests d'intégration de base de données**
```python
# tests/integration/test_database_integration.py
import pytest
from app import create_app, db
from app.models import Task, User
from sqlalchemy import text

@pytest.fixture
def app():
    app = create_app('testing')
    with app.app_context():
        db.create_all()
        yield app
        db.drop_all()

@pytest.fixture
def test_data(app):
    """Fixture pour créer des données de test"""
    with app.app_context():
        # Créer des utilisateurs
        user1 = User(username='user1', email='user1@example.com')
        user2 = User(username='user2', email='user2@example.com')
        db.session.add_all([user1, user2])
        db.session.commit()
        
        # Créer des tâches
        tasks = [
            Task(title='Task 1', description='Desc 1', user_id=user1.id, completed=False),
            Task(title='Task 2', description='Desc 2', user_id=user1.id, completed=True),
            Task(title='Task 3', description='Desc 3', user_id=user2.id, completed=False),
        ]
        db.session.add_all(tasks)
        db.session.commit()
        
        return {'users': [user1, user2], 'tasks': tasks}

class TestDatabaseIntegration:
    def test_task_user_relationship(self, app, test_data):
        """Test relations entre tâches et utilisateurs"""
        with app.app_context():
            # Récupérer un utilisateur avec ses tâches
            user = User.query.filter_by(username='user1').first()
            user_tasks = Task.query.filter_by(user_id=user.id).all()
            
            assert len(user_tasks) == 2
            assert all(task.user_id == user.id for task in user_tasks)
    
    def test_cascading_deletes(self, app, test_data):
        """Test suppression en cascade"""
        with app.app_context():
            user_id = test_data['users'][0].id
            
            # Supprimer l'utilisateur
            User.query.filter_by(id=user_id).delete()
            db.session.commit()
            
            # Vérifier que les tâches sont supprimées (si cascade configuré)
            remaining_tasks = Task.query.filter_by(user_id=user_id).all()
            assert len(remaining_tasks) == 0
    
    def test_database_constraints(self, app):
        """Test contraintes de base de données"""
        with app.app_context():
            # Tester contrainte NOT NULL
            with pytest.raises(Exception):  # IntegrityError
                task = Task(title=None, description='Test')
                db.session.add(task)
                db.session.commit()
    
    def test_complex_queries(self, app, test_data):
        """Test requêtes complexes"""
        with app.app_context():
            # Requête avec jointure
            result = db.session.execute(text("""
                SELECT u.username, COUNT(t.id) as task_count
                FROM users u
                LEFT JOIN tasks t ON u.id = t.user_id
                GROUP BY u.id, u.username
                ORDER BY task_count DESC
            """)).fetchall()
            
            assert len(result) == 2
            # Vérifier les comptes
            user1_count = next(r[1] for r in result if r[0] == 'user1')
            user2_count = next(r[1] for r in result if r[0] == 'user2')
            assert user1_count == 2
            assert user2_count == 1
    
    def test_database_performance(self, app):
        """Test performance base de données"""
        with app.app_context():
            import time
            
            # Créer beaucoup de données de test
            users = [User(username=f'user{i}', email=f'user{i}@example.com') 
                    for i in range(100)]
            db.session.add_all(users)
            db.session.commit()
            
            # Mesurer le temps de requête
            start_time = time.time()
            result = User.query.filter(User.username.like('user%')).all()
            end_time = time.time()
            
            assert len(result) == 100
            assert (end_time - start_time) < 1.0  # Moins d'1 seconde
    
    def test_transaction_integrity(self, app):
        """Test intégrité transactionnelle"""
        with app.app_context():
            try:
                with db.session.begin():
                    # Créer une tâche
                    task = Task(title='Transaction Test', description='Test')
                    db.session.add(task)
                    
                    # Simuler une erreur
                    raise Exception("Test rollback")
                    
            except Exception:
                pass  # Attendu
            
            # Vérifier que la tâche n'a pas été créée
            task_count = Task.query.filter_by(title='Transaction Test').count()
            assert task_count == 0
```

**Tests d'API avec requests**
```python
# tests/integration/test_api_integration.py
import pytest
import requests
from app import create_app, db
from app.models import User

@pytest.fixture
def client():
    app = create_app('testing')
    with app.app_context():
        db.create_all()
        yield app.test_client()
        db.drop_all()

@pytest.fixture
def auth_token(client):
    """Fixture pour obtenir un token d'authentification"""
    # Créer un utilisateur de test
    response = client.post('/api/auth/register', json={
        'username': 'testuser',
        'email': 'test@example.com',
        'password': 'password123'
    })
    assert response.status_code == 201
    
    # Se connecter
    response = client.post('/api/auth/login', json={
        'username': 'testuser',
        'password': 'password123'
    })
    assert response.status_code == 200
    
    return response.get_json()['token']

class TestAPIIntegration:
    def test_task_crud_operations(self, client, auth_token):
        """Test opérations CRUD complètes sur les tâches"""
        headers = {'Authorization': f'Bearer {auth_token}'}
        
        # Créer une tâche
        response = client.post('/api/tasks', 
                              json={
                                  'title': 'API Integration Test',
                                  'description': 'Testing full CRUD'
                              },
                              headers=headers)
        assert response.status_code == 201
        task_data = response.get_json()
        task_id = task_data['id']
        
        # Lire la tâche
        response = client.get(f'/api/tasks/{task_id}', headers=headers)
        assert response.status_code == 200
        assert response.get_json()['title'] == 'API Integration Test'
        
        # Mettre à jour
        response = client.put(f'/api/tasks/{task_id}',
                             json={'title': 'Updated Title'},
                             headers=headers)
        assert response.status_code == 200
        
        # Vérifier la mise à jour
        response = client.get(f'/api/tasks/{task_id}', headers=headers)
        assert response.get_json()['title'] == 'Updated Title'
        
        # Supprimer
        response = client.delete(f'/api/tasks/{task_id}', headers=headers)
        assert response.status_code == 204
        
        # Vérifier la suppression
        response = client.get(f'/api/tasks/{task_id}', headers=headers)
        assert response.status_code == 404
    
    def test_pagination(self, client, auth_token):
        """Test pagination des résultats"""
        headers = {'Authorization': f'Bearer {auth_token}'}
        
        # Créer plusieurs tâches
        for i in range(15):
            client.post('/api/tasks',
                       json={'title': f'Task {i}', 'description': f'Description {i}'},
                       headers=headers)
        
        # Tester pagination
        response = client.get('/api/tasks?page=1&per_page=5', headers=headers)
        assert response.status_code == 200
        data = response.get_json()
        assert len(data['items']) == 5
        assert data['total'] == 15
        assert data['pages'] == 3
        
        # Page 2
        response = client.get('/api/tasks?page=2&per_page=5', headers=headers)
        data = response.get_json()
        assert len(data['items']) == 5
        assert data['page'] == 2
    
    def test_error_handling(self, client, auth_token):
        """Test gestion d'erreurs"""
        headers = {'Authorization': f'Bearer {auth_token}'}
        
        # Tâche avec titre vide
        response = client.post('/api/tasks',
                              json={'title': '', 'description': 'Test'},
                              headers=headers)
        assert response.status_code == 400
        assert 'error' in response.get_json()
        
        # Accès sans authentification
        response = client.get('/api/tasks')
        assert response.status_code == 401
        
        # Ressource inexistante
        response = client.get('/api/tasks/99999', headers=headers)
        assert response.status_code == 404
```

**Démonstration pratique (15 min)**
Configuration et exécution de tests d'intégration.

**Exercices guidés (10 min)**
1. Écrire un test end-to-end avec Selenium
2. Créer un test de contrat avec Pact
3. Implémenter un test d'intégration de base de données

**QCM d'auto-évaluation (3 min)**
1. Quelle différence entre test unitaire et d'intégration ?
2. Quand utiliser Selenium plutôt que requests ?
3. Quel avantage des tests de contrats ?

**Devoir**
Implémenter des tests d'intégration complets pour l'application "Tâches".

---

## Cours 14 - Documentation avancée
**Objectifs**
- Maîtriser Sphinx pour la documentation
- Implémenter le type hinting complet
- Générer des docs d'API automatiques

**Leçon (30 min - détaillée)**
Une bonne documentation est essentielle pour la maintenabilité.

**Type hints avancés**
```python
# types.py
from typing import List, Dict, Optional, Union, Any, Callable, TypeVar, Generic
from datetime import datetime
from dataclasses import dataclass

# Types génériques
T = TypeVar('T')
U = TypeVar('U')

# Types pour le domaine
TaskId = int
UserId = int
Priority = int

@dataclass
class TaskData:
    title: str
    description: Optional[str] = None
    priority: Priority = 1
    completed: bool = False

# Types pour les repositories
class Repository(Generic[T]):
    def save(self, entity: T) -> T: ...
    def get_by_id(self, entity_id: int) -> Optional[T]: ...
    def get_all(self) -> List[T]: ...
    def delete(self, entity_id: int) -> bool: ...

# Types pour les services
TaskFilter = Callable[[Task], bool]
TaskSorter = Callable[[List[Task]], List[Task]]

# Union types pour les APIs
APIResponse = Union[
    Dict[str, Any],  # Success response
    Dict[str, str]   # Error response
]

# Callbacks
EventHandler = Callable[[str, Dict[str, Any]], None]

# Types pour la configuration
class Config:
    database_url: str
    debug: bool
    max_workers: int
    cache_ttl: int

# Types pour les erreurs
class AppError(Exception):
    code: str
    message: str
    details: Optional[Dict[str, Any]] = None

class ValidationError(AppError):
    field: str
    
    def __init__(self, field: str, message: str):
        super().__init__(code="VALIDATION_ERROR", message=message)
        self.field = field

class NotFoundError(AppError):
    resource_type: str
    resource_id: Any
    
    def __init__(self, resource_type: str, resource_id: Any):
        super().__init__(
            code="NOT_FOUND",
            message=f"{resource_type} with id {resource_id} not found"
        )
        self.resource_type = resource_type
        self.resource_id = resource_id
```

**Fonction avec type hints complets**
```python
# task_service.py
from typing import List, Optional, Dict, Any, Protocol
from abc import ABC, abstractmethod
import logging

logger = logging.getLogger(__name__)

class TaskRepositoryProtocol(Protocol):
    def save(self, task: Task) -> Task: ...
    def get_by_id(self, task_id: TaskId) -> Optional[Task]: ...
    def get_all(self) -> List[Task]: ...
    def delete(self, task_id: TaskId) -> bool: ...
    def get_by_user(self, user_id: UserId) -> List[Task]: ...

class NotificationServiceProtocol(Protocol):
    async def send_task_notification(self, task: Task, user_id: UserId) -> None: ...

class TaskService:
    def __init__(self, 
                 repository: TaskRepositoryProtocol,
                 notification_service: Optional[NotificationServiceProtocol] = None):
        self.repository = repository
        self.notification_service = notification_service
    
    def create_task(self, 
                   title: str, 
                   description: Optional[str] = None,
                   user_id: UserId,
                   priority: Priority = 1) -> Task:
        """
        Crée une nouvelle tâche.
        
        Args:
            title: Le titre de la tâche (requis, 1-200 caractères)
            description: La description optionnelle
            user_id: L'ID de l'utilisateur propriétaire
            priority: La priorité (1-5, défaut: 1)
            
        Returns:
            La tâche créée
            
        Raises:
            ValidationError: Si les données sont invalides
            AppError: En cas d'erreur système
        """
        if not title or len(title.strip()) == 0:
            raise ValidationError("title", "Title is required")
        
        if len(title) > 200:
            raise ValidationError("title", "Title must be less than 200 characters")
        
        if not (1 <= priority <= 5):
            raise ValidationError("priority", "Priority must be between 1 and 5")
        
        task = Task(
            id=None,  # Sera généré par la DB
            title=title.strip(),
            description=description.strip() if description else None,
            user_id=user_id,
            priority=priority,
            completed=False,
            created_at=datetime.now(),
            updated_at=datetime.now()
        )
        
        try:
            saved_task = self.repository.save(task)
            logger.info(f"Task created: {saved_task.id} by user {user_id}")
            
            # Notification asynchrone
            if self.notification_service:
                # Dans un vrai système, utiliser asyncio.create_task()
                pass
            
            return saved_task
            
        except Exception as e:
            logger.error(f"Failed to create task: {e}")
            raise AppError("TASK_CREATION_FAILED", f"Could not create task: {str(e)}")
    
    def get_user_tasks(self, 
                      user_id: UserId,
                      completed: Optional[bool] = None,
                      priority_filter: Optional[Priority] = None,
                      limit: int = 50,
                      offset: int = 0) -> Dict[str, Any]:
        """
        Récupère les tâches d'un utilisateur avec filtrage et pagination.
        
        Args:
            user_id: L'ID de l'utilisateur
            completed: Filtrer par statut (None = tous)
            priority_filter: Filtrer par priorité minimum
            limit: Nombre maximum de résultats
            offset: Offset pour la pagination
            
        Returns:
            Dictionnaire avec les tâches et métadonnées de pagination
        """
        try:
            all_tasks = self.repository.get_by_user(user_id)
            
            # Appliquer les filtres
            filtered_tasks = all_tasks
            
            if completed is not None:
                filtered_tasks = [t for t in filtered_tasks if t.completed == completed]
            
            if priority_filter is not None:
                filtered_tasks = [t for t in filtered_tasks if t.priority >= priority_filter]
            
            # Trier par date de création (plus récent en premier)
            filtered_tasks.sort(key=lambda t: t.created_at, reverse=True)
            
            # Pagination
            total = len(filtered_tasks)
            paginated_tasks = filtered_tasks[offset:offset + limit]
            
            return {
                'tasks': paginated_tasks,
                'total': total,
                'limit': limit,
                'offset': offset,
                'has_more': (offset + limit) < total
            }
            
        except Exception as e:
            logger.error(f"Failed to get user tasks: {e}")
            raise AppError("TASK_RETRIEVAL_FAILED", f"Could not retrieve tasks: {str(e)}")
    
    def update_task(self, 
                   task_id: TaskId,
                   updates: Dict[str, Any],
                   user_id: UserId) -> Task:
        """
        Met à jour une tâche.
        
        Args:
            task_id: L'ID de la tâche à modifier
            updates: Dictionnaire des champs à modifier
            user_id: L'ID de l'utilisateur (pour vérification des permissions)
            
        Returns:
            La tâche mise à jour
        """
        task = self.repository.get_by_id(task_id)
        if not task:
            raise NotFoundError("Task", task_id)
        
        # Vérifier les permissions (simplifié)
        if task.user_id != user_id:
            raise AppError("PERMISSION_DENIED", "You can only update your own tasks")
        
        # Appliquer les mises à jour
        for field, value in updates.items():
            if field == 'title':
                if not value or len(value.strip()) == 0:
                    raise ValidationError("title", "Title is required")
                task.title = value.strip()
            elif field == 'description':
                task.description = value.strip() if value else None
            elif field == 'priority':
                if not (1 <= value <= 5):
                    raise ValidationError("priority", "Priority must be between 1 and 5")
                task.priority = value
            elif field == 'completed':
                task.completed = bool(value)
            else:
                raise ValidationError(field, f"Unknown field: {field}")
        
        task.updated_at = datetime.now()
        
        try:
            updated_task = self.repository.save(task)
            logger.info(f"Task updated: {task_id} by user {user_id}")
            return updated_task
            
        except Exception as e:
            logger.error(f"Failed to update task: {e}")
            raise AppError("TASK_UPDATE_FAILED", f"Could not update task: {str(e)}")
```

**Configuration Sphinx**
```python
# docs/conf.py
import os
import sys
sys.path.insert(0, os.path.abspath('..'))

project = 'Tasks App'
copyright = '2024, Your Name'
author = 'Your Name'

extensions = [
    'sphinx.ext.autodoc',      # Génération auto à partir des docstrings
    'sphinx.ext.viewcode',     # Liens vers le code source
    'sphinx.ext.napoleon',     # Support Google/NumPy style docstrings
    'sphinx.ext.intersphinx',  # Liens vers docs externes
    'sphinx.ext.todo',         # Support des TODO
    'sphinx.ext.coverage',     # Couverture de documentation
    'sphinx_autodoc_typehints', # Type hints dans la doc
]

# Configuration autodoc
autodoc_default_options = {
    'members': True,
    'undoc-members': True,
    'show-inheritance': True,
    'member-order': 'bysource',
}

# Support des type hints
autodoc_typehints = 'description'

# Thème
html_theme = 'sphinx_rtd_theme'

# Fichiers statiques
html_static_path = ['_static']

# Intersphinx pour liens externes
intersphinx_mapping = {
    'python': ('https://docs.python.org/3', None),
    'flask': ('https://flask.palletsprojects.com/', None),
    'sqlalchemy': ('https://docs.sqlalchemy.org/', None),
}
```

**Structure de documentation**
```
docs/
├── conf.py
├── index.rst
├── api/
│   ├── index.rst
│   ├── entities.rst
│   ├── services.rst
│   └── repositories.rst
├── guides/
│   ├── installation.rst
│   ├── configuration.rst
│   ├── deployment.rst
│   └── troubleshooting.rst
├── _static/
└── _build/
```

**Fichiers RST principaux**
```rst
# docs/index.rst
Tasks Application Documentation
==============================

Bienvenue dans la documentation de l'application Tasks.

.. toctree::
   :maxdepth: 2
   :caption: Contents:

   installation
   api/index
   guides/index
   changelog

Indices and tables
==================

* :ref:`genindex`
* :ref:`modindex`
* :ref:`search`
```

```rst
# docs/api/index.rst
API Reference
=============

Cette section contient la référence complète de l'API.

Entities
--------

.. automodule:: app.entities.task
   :members:
   :undoc-members:
   :show-inheritance:

Services
--------

.. automodule:: app.services.task_service
   :members:
   :undoc-members:
   :show-inheritance:

Repositories
------------

.. automodule:: app.repositories.task_repository
   :members:
   :undoc-members:
   :show-inheritance:
```

**Génération de docs d'API avec FastAPI**
```python
# api_docs.py
from fastapi import FastAPI, APIRouter
from fastapi.openapi.utils import get_openapi
from app.services.task_service import TaskService
import json

app = FastAPI(
    title="Tasks API",
    description="API pour la gestion des tâches",
    version="1.0.0",
    docs_url="/docs",  # Swagger UI
    redoc_url="/redoc"  # ReDoc
)

# Router pour les tâches
task_router = APIRouter(prefix="/api/tasks", tags=["tasks"])

@task_router.post("/", response_model=TaskResponse)
def create_task(request: TaskCreateRequest):
    """Crée une nouvelle tâche."""
    service = get_task_service()  # Dependency injection
    task = service.create_task(
        title=request.title,
        description=request.description,
        user_id=get_current_user_id()
    )
    return TaskResponse.from_task(task)

@task_router.get("/", response_model=TaskListResponse)
def get_tasks(
    completed: Optional[bool] = None,
    priority: Optional[int] = None,
    page: int = 1,
    per_page: int = 20
):
    """Récupère la liste des tâches avec filtrage et pagination."""
    service = get_task_service()
    result = service.get_user_tasks(
        user_id=get_current_user_id(),
        completed=completed,
        priority_filter=priority,
        limit=per_page,
        offset=(page - 1) * per_page
    )
    return TaskListResponse(
        tasks=[TaskResponse.from_task(t) for t in result['tasks']],
        total=result['total'],
        page=page,
        per_page=per_page,
        has_more=result['has_more']
    )

app.include_router(task_router)

# Schémas Pydantic pour la documentation
from pydantic import BaseModel, Field

class TaskBase(BaseModel):
    title: str = Field(..., min_length=1, max_length=200, description="Titre de la tâche")
    description: Optional[str] = Field(None, description="Description optionnelle")
    priority: int = Field(1, ge=1, le=5, description="Priorité (1-5)")

class TaskCreateRequest(TaskBase):
    pass

class TaskResponse(TaskBase):
    id: int
    completed: bool
    created_at: datetime
    updated_at: datetime

class TaskListResponse(BaseModel):
    tasks: List[TaskResponse]
    total: int
    page: int
    per_page: int
    has_more: bool

# Personnalisation OpenAPI
def custom_openapi():
    if app.openapi_schema:
        return app.openapi_schema
    
    openapi_schema = get_openapi(
        title="Tasks API",
        version="1.0.0",
        description="API REST pour la gestion des tâches avec authentification JWT",
        routes=app.routes,
    )
    
    # Ajouter des informations de sécurité
    openapi_schema["components"]["securitySchemes"] = {
        "BearerAuth": {
            "type": "http",
            "scheme": "bearer",
            "bearerFormat": "JWT"
        }
    }
    
    # Appliquer la sécurité globale
    openapi_schema["security"] = [{"BearerAuth": []}]
    
    app.openapi_schema = openapi_schema
    return app.openapi_schema

app.openapi = custom_openapi
```

**Démonstration pratique (15 min)**
Configuration de Sphinx et génération de documentation.

**Exercices guidés (10 min)**
1. Ajouter des type hints complets à une fonction
2. Configurer Sphinx pour votre projet
3. Générer des docs d'API avec FastAPI

**QCM d'auto-évaluation (3 min)**
1. Quel outil pour générer la doc Python ?
2. Quelle extension pour les type hints dans Sphinx ?
3. Quel avantage de FastAPI pour la doc ?

**Devoir**
Créer une documentation complète pour l'application "Tâches".

---

## Cours 15 - Type hints et mypy
**Objectifs**
- Maîtriser le type hinting avancé en Python
- Configurer mypy pour la vérification statique
- Écrire du code type-safe

**Leçon (30 min - détaillée)**
Le type hinting améliore la qualité et maintenabilité du code.

**Type hints avancés**
```python
# advanced_types.py
from typing import (
    List, Dict, Set, Tuple, Optional, Union, Any, Callable, 
    TypeVar, Generic, Protocol, Literal, Final, ClassVar,
    overload, TYPE_CHECKING
)
from dataclasses import dataclass
from abc import ABC, abstractmethod
import datetime

# Type variables
T = TypeVar('T')
U = TypeVar('U')
K = TypeVar('K')
V = TypeVar('V')

# Literals pour valeurs spécifiques
Status = Literal['pending', 'in_progress', 'completed', 'cancelled']

# Final pour constantes
FINAL_PROJECT_NAME: Final = "Tasks App"
MAX_TASK_TITLE_LENGTH: Final = 200

@dataclass
class Task:
    id: Optional[int]
    title: str
    description: Optional[str]
    status: Status
    priority: int
    created_at: datetime.datetime
    updated_at: datetime.datetime
    
    # Class variables
    MAX_TITLE_LENGTH: ClassVar[int] = 200
    VALID_PRIORITIES: ClassVar[Set[int]] = {1, 2, 3, 4, 5}
    
    def __post_init__(self):
        self._validate()
    
    def _validate(self) -> None:
        if len(self.title) > self.MAX_TITLE_LENGTH:
            raise ValueError(f"Title too long: {len(self.title)} > {self.MAX_TITLE_LENGTH}")
        if self.priority not in self.VALID_PRIORITIES:
            raise ValueError(f"Invalid priority: {self.priority}")

# Protocols pour interfaces
class TaskRepositoryProtocol(Protocol[T]):
    def save(self, task: T) -> T: ...
    def get_by_id(self, task_id: int) -> Optional[T]: ...
    def get_all(self) -> List[T]: ...
    def delete(self, task_id: int) -> bool: ...

class CacheProtocol(Protocol[K, V]):
    def get(self, key: K) -> Optional[V]: ...
    def set(self, key: K, value: V, ttl: Optional[int] = None) -> None: ...
    def delete(self, key: K) -> None: ...

# Generics
class Result(Generic[T, U]):
    def __init__(self, success: bool, data: Union[T, U]):
        self.success = success
        self.data = data
    
    @classmethod
    def ok(cls, data: T) -> 'Result[T, Any]':
        return cls(True, data)
    
    @classmethod
    def error(cls, error: U) -> 'Result[Any, U]':
        return cls(False, error)

# Overloads pour fonctions polymorphiques
@overload
def create_task(title: str) -> Task: ...

@overload  
def create_task(title: str, description: str) -> Task: ...

@overload
def create_task(title: str, description: str, priority: int) -> Task: ...

def create_task(title: str, description: Optional[str] = None, priority: int = 1) -> Task:
    return Task(
        id=None,
        title=title,
        description=description,
        status='pending',
        priority=priority,
        created_at=datetime.datetime.now(),
        updated_at=datetime.datetime.now()
    )

# Callbacks typés
TaskCallback = Callable[[Task], None]
TaskFilter = Callable[[Task], bool]
TaskTransformer = Callable[[Task], Task]

def process_tasks(
    tasks: List[Task], 
    filters: List[TaskFilter],
    transformers: List[TaskTransformer],
    callback: Optional[TaskCallback] = None
) -> List[Task]:
    result = tasks
    
    # Appliquer les filtres
    for filter_func in filters:
        result = [task for task in result if filter_func(task)]
    
    # Appliquer les transformations
    for transformer in transformers:
        result = [transformer(task) for task in result]
    
    # Callback optionnel
    if callback:
        for task in result:
            callback(task)
    
    return result

# Types conditionnels avec TYPE_CHECKING
if TYPE_CHECKING:
    from sqlalchemy.orm import Session
    DatabaseSession = Session
else:
    DatabaseSession = Any

class TaskRepository:
    def __init__(self, session: DatabaseSession):
        self.session = session
    
    def save(self, task: Task) -> Task:
        # Logique de sauvegarde
        return task

# Types pour les configurations
class DatabaseConfig:
    host: str
    port: int
    database: str
    username: str
    password: str
    
    def get_connection_string(self) -> str:
        return f"postgresql://{self.username}:{self.password}@{self.host}:{self.port}/{self.database}"

class AppConfig:
    database: DatabaseConfig
    debug: bool
    secret_key: str
    max_workers: int

# Fonctions utilitaires typées
def validate_email(email: str) -> bool:
    """Valide une adresse email."""
    import re
    pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'
    return bool(re.match(pattern, email))

def parse_priority(value: Union[str, int]) -> int:
    """Parse une priorité depuis différents types."""
    if isinstance(value, int):
        return value
    elif isinstance(value, str):
        try:
            return int(value)
        except ValueError:
            # Mapping string vers int
            mapping = {'low': 1, 'medium': 3, 'high': 5}
            return mapping.get(value.lower(), 3)
    else:
        return 3

# Decorators typés
def logged(func: Callable[..., T]) -> Callable[..., T]:
    def wrapper(*args: Any, **kwargs: Any) -> T:
        print(f"Calling {func.__name__}")
        result = func(*args, **kwargs)
        print(f"Finished {func.__name__}")
        return result
    return wrapper

# Classes abstraites typées
class BaseService(ABC, Generic[T]):
    def __init__(self, repository: TaskRepositoryProtocol[T]):
        self.repository = repository
    
    @abstractmethod
    def process(self, item: T) -> T:
        pass

class TaskService(BaseService[Task]):
    def process(self, task: Task) -> Task:
        # Logique métier
        return task
```

**Configuration mypy**
```ini
# mypy.ini ou setup.cfg
[mypy]
python_version = 3.11
warn_return_any = True
warn_unused_configs = True
disallow_untyped_defs = True
disallow_incomplete_defs = True
check_untyped_defs = True
disallow_untyped_decorators = True
no_implicit_optional = True
warn_redundant_casts = True
warn_unused_ignores = True
warn_no_return = True
warn_unreachable = True
strict_equality = True

# Modules spécifiques
[mypy-app.models.*]
disallow_untyped_defs = False  # Temporaire pour les modèles SQLAlchemy

[mypy-tests.*]
disallow_untyped_defs = False  # Tests peuvent être moins stricts

# Dépendances externes
[mypy-sqlalchemy.*]
ignore_missing_imports = True

[mypy-flask.*]
ignore_missing_imports = True
```

**Intégration avec pre-commit**
```yaml
# .pre-commit-config.yaml
repos:
  - repo: https://github.com/pre-commit/pre-commit-hooks
    rev: v4.4.0
    hooks:
      - id: trailing-whitespace
      - id: end-of-file-fixer
      - id: check-yaml
      - id: check-added-large-files

  - repo: https://github.com/psf/black
    rev: 23.3.0
    hooks:
      - id: black
        language_version: python3.11

  - repo: https://github.com/pycqa/isort
    rev: 5.12.0
    hooks:
      - id: isort

  - repo: https://github.com/pre-commit/mirrors-mypy
    rev: v1.3.0
    hooks:
      - id: mypy
        additional_dependencies: [types-all]
```

**Exemples d'erreurs mypy et corrections**
```python
# ❌ Erreurs courantes
def process_data(data: Any) -> Any:  # Trop vague
    return data.upper()  # Erreur: Any n'a pas de méthode upper

def get_user(user_id: int) -> dict:  # Retour trop vague
    return {"id": user_id, "name": "User"}

# ✅ Corrections
def process_data(data: str) -> str:
    return data.upper()

@dataclass
class User:
    id: int
    name: str

def get_user(user_id: int) -> User:
    return User(id=user_id, name="User")

# Gestion des types Any nécessaires
from typing import cast

def unsafe_operation() -> Any:
    return some_external_api_call()

def safe_wrapper() -> str:
    result = unsafe_operation()
    # Cast explicite quand on sait le type réel
    return cast(str, result)
```

**Démonstration pratique (15 min)**
Configuration de mypy et correction d'erreurs de types.

**Exercices guidés (10 min)**
1. Ajouter des type hints complets à une fonction existante
2. Configurer mypy pour votre projet
3. Corriger les erreurs de types détectées

**QCM d'auto-évaluation (3 min)**
1. Quel outil pour la vérification statique des types ?
2. Quelle annotation pour un paramètre optionnel ?
3. Quand utiliser TYPE_CHECKING ?

**Devoir**
Ajouter le type hinting complet et configurer mypy pour l'application "Tâches".

---

## Cours 16 - Code quality
**Objectifs**
- Maîtriser les outils de qualité de code (black, isort, flake8)
- Configurer les pre-commit hooks
- Automatiser la qualité dans CI/CD

**Leçon (30 min - détaillée)**
La qualité de code est essentielle pour la maintenabilité.

**Configuration Black**
```python
# pyproject.toml
[tool.black]
line-length = 88
target-version = ['py311']
include = '\.pyi?$'
extend-exclude = '''
/(
  # directories
  \.eggs
  | \.git
  | \.hg
  | \.mypy_cache
  | \.tox
  | \.venv
  | build
  | dist
  | migrations
)/
'''

# Configuration alternative dans setup.cfg
[black]
line-length = 88
target-version = py311
include = \.pyi?$
extend-exclude = migrations
```

**Configuration isort**
```python
# pyproject.toml
[tool.isort]
profile = "black"
multi_line_output = 3
line_length = 88
known_first_party = ["app", "tests"]
known_third_party = ["flask", "sqlalchemy", "pytest"]

# Sections personnalisées
sections = ["FUTURE", "STDLIB", "THIRDPARTY", "FIRSTPARTY", "LOCALFOLDER"]
default_section = "THIRDPARTY"

# Imports à ignorer
skip = ["migrations", ".venv"]
```

**Configuration flake8**
```ini
# .flake8 ou setup.cfg
[flake8]
max-line-length = 88
extend-ignore = E203, W503, E501
exclude = 
    .git,
    __pycache__,
    migrations,
    .venv,
    build,
    dist
per-file-ignores =
    __init__.py:F401
    tests/*:S101  # Asserts in tests
    migrations/*:E501  # Long lines in migrations

# Extensions recommandées
[flake8]
select = B,C,E,F,W,T4,B9
ignore = E203, E501, W503
max-complexity = 12
```

**Configuration pre-commit**
```yaml
# .pre-commit-config.yaml
repos:
  # Hooks de base
  - repo: https://github.com/pre-commit/pre-commit-hooks
    rev: v4.4.0
    hooks:
      - id: trailing-whitespace
      - id: end-of-file-fixer
      - id: check-yaml
      - id: check-added-large-files
      - id: check-merge-conflict
      - id: debug-statements

  # Formatage Python
  - repo: https://github.com/psf/black
    rev: 23.3.0
    hooks:
      - id: black
        language_version: python3.11

  # Tri des imports
  - repo: https://github.com/pycqa/isort
    rev: 5.12.0
    hooks:
      - id: isort

  # Linting
  - repo: https://github.com/pycqa/flake8
    rev: 6.0.0
    hooks:
      - id: flake8
        additional_dependencies: [
          flake8-bugbear,
          flake8-comprehensions,
          flake8-simplify,
          pep8-naming
        ]

  # Type checking
  - repo: https://github.com/pre-commit/mirrors-mypy
    rev: v1.3.0
    hooks:
      - id: mypy
        additional_dependencies: [types-all]

  # Sécurité
  - repo: https://github.com/PyCQA/bandit
    rev: 1.7.5
    hooks:
      - id: bandit
        args: ["-c", "pyproject.toml"]
        exclude: ^tests/

  # Tests
  - repo: local
    hooks:
      - id: pytest
        name: pytest
        entry: pytest
        language: system
        pass_filenames: false
        args: ["tests/", "--tb=short", "-x"]

# Configuration Bandit
[tool.bandit]
exclude_dirs = ["tests", "migrations"]
skips = ["B101", "B601"]  # Asserts used, shell usage
```

**Qualité de code avancée**
```python
# radon pour complexité cyclomatique
# pip install radon
"""
radon cc app/  # Complexité cyclomatique
radon mi app/  # Métriques de maintenabilité
radon raw app/  # Métriques brutes
"""

# vulture pour code mort
# pip install vulture
"""
vulture app/  # Détecte code inutilisé
"""

# coverage pour couverture de tests
# pip install coverage
"""
coverage run -m pytest
coverage report
coverage html  # Rapport HTML
"""

# prospector pour analyse complète
# pip install prospector
"""
prospector app/
"""
```

**Scripts de qualité personnalisés**
```python
# scripts/code_quality.py
#!/usr/bin/env python3
import subprocess
import sys
from pathlib import Path
from typing import List, Tuple

class CodeQualityChecker:
    def __init__(self, project_root: str = "."):
        self.project_root = Path(project_root)
    
    def run_command(self, cmd: List[str], cwd: Path = None) -> Tuple[int, str, str]:
        """Exécute une commande et retourne (code_retour, stdout, stderr)"""
        result = subprocess.run(
            cmd, 
            cwd=cwd or self.project_root,
            capture_output=True, 
            text=True
        )
        return result.returncode, result.stdout, result.stderr
    
    def check_black(self) -> bool:
        """Vérifie le formatage Black"""
        print("🔍 Vérification Black...")
        code, stdout, stderr = self.run_command(["black", "--check", "--diff", "app/"])
        
        if code != 0:
            print("❌ Code non formaté avec Black:")
            print(stdout)
            return False
        
        print("✅ Code formaté avec Black")
        return True
    
    def check_isort(self) -> bool:
        """Vérifie le tri des imports"""
        print("🔍 Vérification isort...")
        code, stdout, stderr = self.run_command(["isort", "--check-only", "--diff", "app/"])
        
        if code != 0:
            print("❌ Imports non triés:")
            print(stdout)
            return False
        
        print("✅ Imports triés")
        return True
    
    def check_flake8(self) -> bool:
        """Vérifie le linting"""
        print("🔍 Vérification flake8...")
        code, stdout, stderr = self.run_command(["flake8", "app/"])
        
        if code != 0:
            print("❌ Erreurs de linting:")
            print(stdout)
            return False
        
        print("✅ Linting OK")
        return True
    
    def check_mypy(self) -> bool:
        """Vérifie les types"""
        print("🔍 Vérification mypy...")
        code, stdout, stderr = self.run_command(["mypy", "app/"])
        
        if code != 0:
            print("❌ Erreurs de types:")
            print(stdout)
            return False
        
        print("✅ Types OK")
        return True
    
    def check_tests(self) -> bool:
        """Exécute les tests"""
        print("🧪 Exécution des tests...")
        code, stdout, stderr = self.run_command([
            "pytest", "tests/", 
            "--tb=short", 
            "--cov=app", 
            "--cov-report=term-missing"
        ])
        
        if code != 0:
            print("❌ Tests échoués:")
            print(stdout)
            return False
        
        print("✅ Tests réussis")
        return True
    
    def check_security(self) -> bool:
        """Vérifie la sécurité"""
        print("🔒 Vérification sécurité...")
        code, stdout, stderr = self.run_command([
            "bandit", "-r", "app/", 
            "-c", "pyproject.toml"
        ])
        
        if code != 0:
            print("❌ Vulnérabilités détectées:")
            print(stdout)
            return False
        
        print("✅ Sécurité OK")
        return True
    
    def run_all_checks(self) -> bool:
        """Exécute toutes les vérifications"""
        print("🚀 Vérifications de qualité de code")
        print("=" * 50)
        
        checks = [
            self.check_black,
            self.check_isort,
            self.check_flake8,
            self.check_mypy,
            self.check_tests,
            self.check_security
        ]
        
        results = []
        for check in checks:
            try:
                result = check()
                results.append(result)
                print()
            except Exception as e:
                print(f"❌ Erreur lors de la vérification {check.__name__}: {e}")
                results.append(False)
                print()
        
        # Résumé
        passed = sum(results)
        total = len(results)
        
        print("=" * 50)
        print(f"Résumé: {passed}/{total} vérifications réussies")
        
        if passed == total:
            print("🎉 Toutes les vérifications sont passées!")
            return True
        else:
            print("⚠️  Certaines vérifications ont échoué")
            return False

if __name__ == "__main__":
    checker = CodeQualityChecker()
    success = checker.run_all_checks()
    sys.exit(0 if success else 1)
```

**Intégration CI/CD**
```yaml
# .github/workflows/quality.yml
name: Code Quality

on:
  push:
    branches: [ main, develop ]
  pull_request:
    branches: [ main ]

jobs:
  quality:
    runs-on: ubuntu-latest
    
    steps:
    - uses: actions/checkout@v3
    
    - name: Set up Python
      uses: actions/setup-python@v4
      with:
        python-version: '3.11'
    
    - name: Cache pip dependencies
      uses: actions/cache@v3
      with:
        path: ~/.cache/pip
        key: ${{ runner.os }}-pip-${{ hashFiles('**/requirements*.txt') }}
        restore-keys: |
          ${{ runner.os }}-pip-
    
    - name: Install dependencies
      run: |
        python -m pip install --upgrade pip
        pip install -r requirements.txt
        pip install -r requirements-dev.txt
    
    - name: Run quality checks
      run: python scripts/code_quality.py
    
    - name: Upload coverage
      uses: codecov/codecov-action@v3
      if: success()
```

**Démonstration pratique (15 min)**
Configuration des outils de qualité et exécution des vérifications.

**Exercices guidés (10 min)**
1. Configurer black, isort et flake8
2. Mettre en place les pre-commit hooks
3. Créer un script de vérification qualité

**QCM d'auto-évaluation (3 min)**
1. Quel outil pour formater le code Python ?
2. Quel hook pour vérifier avant commit ?
3. Quelle commande pour trier les imports ?

**Devoir**
Mettre en place une chaîne complète de qualité de code pour l'application "Tâches".

---

## Cours 17 - CI/CD avancé
**Objectifs**
- Implémenter des quality gates dans CI/CD
- Configurer le déploiement canary
- Automatiser les releases et versioning

**Leçon (30 min - détaillée)**
Un CI/CD avancé garantit la qualité et la fiabilité des déploiements.

**Quality gates avancés**
```yaml
# .github/workflows/advanced-ci.yml
name: Advanced CI/CD Pipeline

on:
  push:
    branches: [ main, develop ]
  pull_request:
    branches: [ main ]

env:
  PYTHON_VERSION: '3.11'

jobs:
  # Tests parallèles
  test:
    runs-on: ubuntu-latest
    strategy:
      matrix:
        python-version: ['3.9', '3.10', '3.11']
        test-type: ['unit', 'integration']
    
    services:
      postgres:
        image: postgres:15
        env:
          POSTGRES_PASSWORD: postgres
        options: >-
          --health-cmd pg_isready
          --health-interval 10s
          --health-timeout 5s
          --health-retries 5
    
    steps:
    - uses: actions/checkout@v3
    
    - name: Set up Python ${{ matrix.python-version }}
      uses: actions/setup-python@v4
      with:
        python-version: ${{ matrix.python-version }}
    
    - name: Cache pip
      uses: actions/cache@v3
      with:
        path: ~/.cache/pip
        key: ${{ runner.os }}-pip-${{ matrix.python-version }}-${{ hashFiles('**/requirements*.txt') }}
    
    - name: Install dependencies
      run: |
        python -m pip install --upgrade pip
        pip install -r requirements.txt -r requirements-dev.txt
    
    - name: Run tests
      env:
        DATABASE_URL: postgresql://postgres:postgres@localhost:5432/test
      run: |
        if [ "${{ matrix.test-type }}" = "unit" ]; then
          pytest tests/unit/ -v --cov=app --cov-report=xml
        else
          pytest tests/integration/ -v --cov=app --cov-report=xml --cov-append
        fi
    
    - name: Upload coverage
      uses: codecov/codecov-action@v3
      with:
        file: ./coverage.xml
        flags: ${{ matrix.test-type }}

  # Quality gates
  quality:
    needs: test
    runs-on: ubuntu-latest
    
    steps:
    - uses: actions/checkout@v3
    
    - name: Set up Python
      uses: actions/setup-python@v4
      with:
        python-version: ${{ env.PYTHON_VERSION }}
    
    - name: Install quality tools
      run: |
        pip install black isort flake8 mypy bandit radon
    
    - name: Check code formatting
      run: |
        black --check app/
        isort --check-only app/
    
    - name: Lint code
      run: flake8 app/
    
    - name: Type check
      run: mypy app/
    
    - name: Security scan
      run: bandit -r app/
    
    - name: Code complexity
      run: |
        radon cc app/ | tee complexity.txt
        if grep -q "CC" complexity.txt; then
          echo "Functions with high complexity found:"
          grep "CC" complexity.txt
          exit 1
        fi
    
    - name: Coverage check
      uses: codecov/codecov-action@v3
      with:
        fail_ci_if_error: true
        threshold: 80%

  # Build
  build:
    needs: [test, quality]
    runs-on: ubuntu-latest
    
    steps:
    - uses: actions/checkout@v3
    
    - name: Set up Docker Buildx
      uses: docker/setup-buildx-action@v2
    
    - name: Log in to Docker Hub
      uses: docker/login-action@v2
      with:
        username: ${{ secrets.DOCKER_USERNAME }}
        password: ${{ secrets.DOCKER_PASSWORD }}
    
    - name: Extract metadata
      id: meta
      uses: docker/metadata-action@v4
      with:
        images: myapp/tasks-app
        tags: |
          type=ref,event=branch
          type=ref,event=pr
          type=sha
          type=raw,value=latest,enable={{is_default_branch}}
    
    - name: Build and push Docker image
      uses: docker/build-push-action@v4
      with:
        context: .
        push: true
        tags: ${{ steps.meta.outputs.tags }}
        labels: ${{ steps.meta.outputs.labels }}
        cache-from: type=gha
        cache-to: type=gha,mode=max

  # Déploiement canary
  canary-deploy:
    needs: build
    runs-on: ubuntu-latest
    if: github.ref == 'refs/heads/main'
    environment: production
    
    steps:
    - name: Deploy to canary
      run: |
        echo "🚀 Déploiement canary..."
        # Logique de déploiement canary
        # Par exemple: déployer sur 10% du traffic
    
    - name: Health check
      run: |
        # Vérifier la santé du déploiement canary
        curl -f https://canary.myapp.com/health || exit 1
    
    - name: Performance test
      run: |
        # Tests de performance sur l'environnement canary
        # Par exemple: k6, locust, artillery
    
    - name: Rollback if needed
      if: failure()
      run: |
        echo "❌ Déploiement canary échoué, rollback..."
        # Logique de rollback

  # Déploiement production
  production-deploy:
    needs: canary-deploy
    runs-on: ubuntu-latest
    if: github.ref == 'refs/heads/main'
    environment: production
    
    steps:
    - name: Blue-green deployment
      run: |
        echo "🔄 Déploiement blue-green..."
        # Créer nouvelle version
        # Basculer le traffic
        # Vérifier
        # Supprimer ancienne version
    
    - name: Post-deployment tests
      run: |
        # Tests end-to-end en production
        # Monitoring des métriques
        # Alertes si nécessaire
```

**Versioning sémantique et releases**
```yaml
# .github/workflows/release.yml
name: Create Release

on:
  push:
    tags:
      - 'v*.*.*'

jobs:
  release:
    runs-on: ubuntu-latest
    
    steps:
    - uses: actions/checkout@v3
      with:
        fetch-depth: 0
    
    - name: Get version
      id: get_version
      run: |
        VERSION=${GITHUB_REF#refs/tags/v}
        echo "version=$VERSION" >> $GITHUB_OUTPUT
    
    - name: Generate changelog
      id: changelog
      run: |
        # Générer changelog depuis dernier tag
        git log --pretty=format:"%h %s" $(git describe --tags --abbrev=0 HEAD^)..HEAD > changelog.txt
        echo "changelog<<EOF" >> $GITHUB_OUTPUT
        cat changelog.txt >> $GITHUB_OUTPUT
        echo "EOF" >> $GITHUB_OUTPUT
    
    - name: Create GitHub release
      uses: actions/create-release@v1
      env:
        GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
      with:
        tag_name: ${{ github.ref }}
        release_name: Release ${{ steps.get_version.outputs.version }}
        body: |
          ## Changes
          ${{ steps.changelog.outputs.changelog }}
          
          ## Installation
          ```bash
          pip install myapp==${{ steps.get_version.outputs.version }}
          ```
        draft: false
        prerelease: false

  publish:
    needs: release
    runs-on: ubuntu-latest
    
    steps:
    - uses: actions/checkout@v3
    
    - name: Set up Python
      uses: actions/setup-python@v4
      with:
        python-version: ${{ env.PYTHON_VERSION }}
    
    - name: Install build tools
      run: pip install build twine
    
    - name: Build package
      run: python -m build
    
    - name: Publish to PyPI
      env:
        TWINE_USERNAME: __token__
        TWINE_PASSWORD: ${{ secrets.PYPI_API_TOKEN }}
      run: |
        twine upload dist/*
```

**Feature flags et déploiement progressif**
```python
# feature_flags.py
from typing import Dict, Any, Optional
import os
import json

class FeatureFlag:
    def __init__(self, name: str, enabled: bool = False, percentage: int = 0):
        self.name = name
        self.enabled = enabled
        self.percentage = percentage
    
    def is_enabled_for(self, user_id: Optional[str] = None) -> bool:
        if self.enabled:
            return True
        
        if self.percentage > 0 and user_id:
            # Rollout progressif basé sur user_id
            import hashlib
            hash_value = int(hashlib.md5(user_id.encode()).hexdigest(), 16)
            return (hash_value % 100) < self.percentage
        
        return False

class FeatureFlagManager:
    def __init__(self):
        self.flags: Dict[str, FeatureFlag] = {}
        self.load_flags()
    
    def load_flags(self):
        """Charge les flags depuis un fichier ou service externe"""
        # En développement: fichier JSON
        if os.path.exists('feature_flags.json'):
            with open('feature_flags.json', 'r') as f:
                data = json.load(f)
                for name, config in data.items():
                    self.flags[name] = FeatureFlag(
                        name=name,
                        enabled=config.get('enabled', False),
                        percentage=config.get('percentage', 0)
                    )
    
    def is_enabled(self, flag_name: str, user_id: Optional[str] = None) -> bool:
        flag = self.flags.get(flag_name)
        if not flag:
            return False
        return flag.is_enabled_for(user_id)

# Utilisation dans l'application
feature_flags = FeatureFlagManager()

@app.route('/api/tasks')
def get_tasks():
    user_id = get_current_user_id()
    
    # Nouvelle fonctionnalité de tri avancé
    if feature_flags.is_enabled('advanced_sorting', user_id):
        # Code de tri avancé
        return get_tasks_with_advanced_sorting()
    else:
        # Code original
        return get_tasks_basic()

# feature_flags.json
{
  "advanced_sorting": {
    "enabled": false,
    "percentage": 25
  },
  "new_ui": {
    "enabled": true,
    "percentage": 0
  }
}
```

**Monitoring et rollback automatique**
```yaml
# .github/workflows/monitoring-deploy.yml
name: Monitor Deployment

on:
  deployment_status

jobs:
  monitor:
    runs-on: ubuntu-latest
    if: github.event.deployment_status.state == 'success'
    
    steps:
    - name: Check deployment health
      run: |
        # Vérifier les métriques post-déploiement
        # Erreur rate, latence, etc.
        
        ERROR_RATE=$(curl -s https://api.myapp.com/metrics | jq '.error_rate')
        
        if (( $(echo "$ERROR_RATE > 0.05" | bc -l) )); then
          echo "❌ Taux d'erreur trop élevé: $ERROR_RATE"
          echo "rollback=true" >> $GITHUB_ENV
        fi
    
    - name: Rollback if needed
      if: env.rollback == 'true'
      run: |
        echo "🔄 Rollback automatique..."
        # Logique de rollback
        # Revenir à la version précédente
```

**Démonstration pratique (15 min)**
Configuration d'un pipeline CI/CD avancé avec quality gates.

**Exercices guidés (10 min)**
1. Configurer des quality gates dans GitHub Actions
2. Implémenter un déploiement canary
3. Mettre en place le versioning automatique

**QCM d'auto-évaluation (3 min)**
1. Quel type de déploiement pour tester en production ?
2. Quelle action pour créer une release ?
3. Comment fonctionnent les feature flags ?

**Devoir**
Mettre en place un CI/CD avancé avec quality gates et déploiement progressif.

---

## Cours 18 - Code review
**Objectifs**
- Maîtriser les bonnes pratiques de code review
- Utiliser les outils de review automatisés
- Donner et recevoir du feedback constructif

**Leçon (30 min - détaillée)**
Le code review améliore la qualité et partage les connaissances.

**Checklist de code review**
```python
# code_review_checklist.py
from typing import List, Dict, Any
import re

class CodeReviewChecklist:
    def __init__(self):
        self.issues = []
    
    def analyze_file(self, file_path: str, content: str) -> List[Dict[str, Any]]:
        """Analyse un fichier et retourne les problèmes trouvés"""
        self.issues = []
        
        lines = content.split('\n')
        
        for i, line in enumerate(lines, 1):
            self._check_line(file_path, i, line)
        
        # Vérifications globales
        self._check_file_structure(file_path, content)
        
        return self.issues
    
    def _check_line(self, file_path: str, line_num: int, line: str):
        """Vérifications ligne par ligne"""
        
        # Longueur de ligne
        if len(line) > 88:
            self.issues.append({
                'file': file_path,
                'line': line_num,
                'type': 'style',
                'severity': 'minor',
                'message': f'Ligne trop longue: {len(line)} caractères (max 88)'
            })
        
        # TODOs et FIXMEs
        if 'TODO' in line.upper() or 'FIXME' in line.upper():
            self.issues.append({
                'file': file_path,
                'line': line_num,
                'type': 'maintenance',
                'severity': 'info',
                'message': 'TODO ou FIXME trouvé'
            })
        
        # Print statements
        if re.search(r'\bprint\s*\(', line):
            self.issues.append({
                'file': file_path,
                'line': line_num,
                'type': 'logging',
                'severity': 'warning',
                'message': 'Utilisation de print() au lieu de logging'
            })
        
        # Exceptions génériques
        if re.search(r'except\s*:\s*$', line) or re.search(r'except\s+Exception\s*:', line):
            self.issues.append({
                'file': file_path,
                'line': line_num,
                'type': 'error_handling',
                'severity': 'warning',
                'message': 'Exception trop générique attrapée'
            })
    
    def _check_file_structure(self, file_path: str, content: str):
        """Vérifications structurelles"""
        
        # Docstring manquante
        if not re.search(r'""".*"""', content, re.DOTALL):
            self.issues.append({
                'file': file_path,
                'line': 1,
                'type': 'documentation',
                'severity': 'info',
                'message': 'Docstring de module manquante'
            })
        
        # Imports non utilisés (simple check)
        import_lines = [line for line in content.split('\n') if line.startswith('import ') or 'from ' in line and ' import ' in line]
        # Analyse plus complexe nécessaire pour détecter les imports non utilisés
    
    def generate_report(self) -> str:
        """Génère un rapport de code review"""
        if not self.issues:
            return "✅ Aucun problème détecté"
        
        report = "📋 Rapport de code review\n"
        report += "=" * 40 + "\n\n"
        
        # Grouper par type
        by_type = {}
        for issue in self.issues:
            issue_type = issue['type']
            if issue_type not in by_type:
                by_type[issue_type] = []
            by_type[issue_type].append(issue)
        
        for issue_type, issues in by_type.items():
            report += f"🔍 {issue_type.upper()}\n"
            for issue in issues:
                severity_icon = {
                    'critical': '🔴',
                    'major': '🟠',
                    'warning': '🟡',
                    'minor': '🔵',
                    'info': 'ℹ️'
                }.get(issue['severity'], '❓')
                
                report += f"  {severity_icon} {issue['file']}:{issue['line']} - {issue['message']}\n"
            report += "\n"
        
        # Statistiques
        total_issues = len(self.issues)
        severity_counts = {}
        for issue in self.issues:
            severity = issue['severity']
            severity_counts[severity] = severity_counts.get(severity, 0) + 1
        
        report += "📊 Statistiques:\n"
        report += f"  Total: {total_issues} problème(s)\n"
        for severity, count in severity_counts.items():
            report += f"  {severity}: {count}\n"
        
        return report

# Utilisation
def review_pull_request(pr_number: int):
    """Revue automatique d'une PR"""
    # Récupérer les fichiers modifiés
    # Pour chaque fichier, analyser avec CodeReviewChecklist
    # Générer un commentaire sur la PR
    pass
```

**Outils de code review**
```yaml
# .github/workflows/code-review.yml
name: Automated Code Review

on:
  pull_request:
    types: [opened, synchronize, reopened]

jobs:
  review:
    runs-on: ubuntu-latest
    
    steps:
    - uses: actions/checkout@v3
      with:
        fetch-depth: 0
    
    - name: Set up Python
      uses: actions/setup-python@v4
      with:
        python-version: '3.11'
    
    - name: Install review tools
      run: |
        pip install flake8 black isort mypy radon vulture
    
    - name: Run automated review
      id: review
      run: |
        python scripts/code_review.py > review_report.txt
        echo "report<<EOF" >> $GITHUB_OUTPUT
        cat review_report.txt >> $GITHUB_OUTPUT
        echo "EOF" >> $GITHUB_OUTPUT
    
    - name: Comment PR
      uses: actions/github-script@v6
      with:
        script: |
          const report = `${{ steps.review.outputs.report }}`;
          
          github.rest.issues.createComment({
            issue_number: context.issue.number,
            owner: context.repo.owner,
            repo: context.repo.repo,
            body: `## 🤖 Code Review Automatique\n\n${report}`
          });
    
    - name: Check critical issues
      run: |
        if grep -q "🔴" review_report.txt; then
          echo "❌ Problèmes critiques détectés"
          exit 1
        fi
```

**Bonnes pratiques de code review**
```python
# review_guidelines.py
REVIEW_GUIDELINES = {
    'general': [
        "✅ Le code fonctionne-t-il comme attendu ?",
        "✅ Les tests passent-ils ?",
        "✅ Le code est-il lisible et compréhensible ?",
        "✅ Y a-t-il des commentaires/docus appropriés ?",
        "✅ Le code suit-il les conventions du projet ?"
    ],
    
    'architecture': [
        "🏗️ L'architecture respecte-t-elle les principes SOLID ?",
        "🏗️ Les responsabilités sont-elles bien séparées ?",
        "🏗️ Y a-t-il des dépendances circulaires ?",
        "🏗️ Les abstractions sont-elles appropriées ?"
    ],
    
    'performance': [
        "⚡ Y a-t-il des problèmes de performance évidents ?",
        "⚡ Les requêtes DB sont-elles optimisées ?",
        "⚡ Y a-t-il des fuites mémoire potentielles ?",
        "⚡ La complexité algorithmique est-elle acceptable ?"
    ],
    
    'sécurité': [
        "🔒 Y a-t-il des vulnérabilités de sécurité ?",
        "🔒 Les entrées utilisateur sont-elles validées ?",
        "🔒 Les secrets sont-ils gérés correctement ?",
        "🔒 Les autorisations sont-elles vérifiées ?"
    ],
    
    'tests': [
        "🧪 Y a-t-il suffisamment de tests ?",
        "🧪 Les tests couvrent-ils les cas d'erreur ?",
        "🧪 Les tests sont-ils lisibles et maintenables ?",
        "🧪 Y a-t-il des tests d'intégration ?"
    ],
    
    'maintenance': [
        "🔧 Le code est-il facile à modifier ?",
        "🔧 Y a-t-il de la dette technique ajoutée ?",
        "🔧 Les noms de variables/fonctions sont-ils clairs ?",
        "🔧 Y a-t-il du code dupliqué ?"
    ]
}

def generate_review_template() -> str:
    """Génère un template de code review"""
    template = "# 📋 Template de Code Review\n\n"
    
    for category, questions in REVIEW_GUIDELINES.items():
        template += f"## {category.title()}\n"
        for question in questions:
            template += f"- [ ] {question}\n"
        template += "\n"
    
    template += "## Commentaires généraux\n\n"
    template += "## Décision\n"
    template += "- [ ] ✅ Approuver\n"
    template += "- [ ] 🔄 Demander des modifications\n"
    template += "- [ ] ❌ Rejeter\n\n"
    template += "### Raison:\n"
    
    return template

# Template pour les reviewers
REVIEW_COMMENTS = {
    'blocking': [
        "❌ Cette modification introduit une régression critique",
        "❌ Vulnérabilité de sécurité détectée",
        "❌ Violation des principes architecturaux",
    ],
    
    'major': [
        "⚠️ Complexité cyclomatique trop élevée",
        "⚠️ Manque de tests pour cette fonctionnalité",
        "⚠️ Performance potentiellement dégradée",
    ],
    
    'minor': [
        "💡 Considérer renommer cette variable pour plus de clarté",
        "💡 Ajouter une docstring pour cette fonction",
        "💡 Cette logique pourrait être extraite dans une fonction séparée",
    ],
    
    'praise': [
        "✅ Excellente implémentation de ce pattern",
        "✅ Tests très complets et lisibles",
        "✅ Bonne séparation des préoccupations",
    ]
}

def suggest_improvements(code_diff: str) -> List[str]:
    """Suggère des améliorations basées sur le diff"""
    suggestions = []
    
    # Analyse simple du diff
    if len(code_diff.split('\n')) > 100:
        suggestions.append("💡 Ce diff est assez volumineux. Considérer le diviser en PRs plus petites.")
    
    if 'print(' in code_diff:
        suggestions.append("💡 Remplacer print() par logging pour la production.")
    
    if 'except:' in code_diff or 'except Exception:' in code_diff:
        suggestions.append("💡 Éviter les exceptions trop génériques. Attraper des exceptions spécifiques.")
    
    return suggestions
```

**Processus de code review**
```python
# review_process.py
from enum import Enum
from typing import List, Optional
from dataclasses import dataclass

class ReviewStatus(Enum):
    PENDING = "pending"
    APPROVED = "approved"
    CHANGES_REQUESTED = "changes_requested"
    REJECTED = "rejected"

@dataclass
class ReviewComment:
    file_path: str
    line_number: Optional[int]
    comment: str
    severity: str  # 'blocking', 'major', 'minor', 'info'
    reviewer: str

@dataclass
class CodeReview:
    pr_number: int
    reviewers: List[str]
    status: ReviewStatus
    comments: List[ReviewComment]
    automated_checks_passed: bool
    
    def add_comment(self, comment: ReviewComment):
        self.comments.append(comment)
    
    def approve(self, reviewer: str):
        if reviewer in self.reviewers:
            self.status = ReviewStatus.APPROVED
    
    def request_changes(self, reviewer: str, comments: List[ReviewComment]):
        if reviewer in self.reviewers:
            self.status = ReviewStatus.CHANGES_REQUESTED
            self.comments.extend(comments)
    
    def can_merge(self) -> bool:
        """Détermine si la PR peut être mergée"""
        if self.status != ReviewStatus.APPROVED:
            return False
        
        # Vérifier qu'il n'y a pas de commentaires bloquants
        blocking_comments = [c for c in self.comments if c.severity == 'blocking']
        if blocking_comments:
            return False
        
        # Vérifier les checks automatisés
        if not self.automated_checks_passed:
            return False
        
        return True

# Workflow de review
def conduct_code_review(pr_number: int, reviewers: List[str]) -> CodeReview:
    """Conduit une revue de code complète"""
    
    review = CodeReview(
        pr_number=pr_number,
        reviewers=reviewers,
        status=ReviewStatus.PENDING,
        comments=[],
        automated_checks_passed=False
    )
    
    # 1. Checks automatisés
    if run_automated_checks(pr_number):
        review.automated_checks_passed = True
    else:
        review.add_comment(ReviewComment(
            file_path=None,
            line_number=None,
            comment="❌ Les vérifications automatisées ont échoué",
            severity="blocking",
            reviewer="automation"
        ))
    
    # 2. Review manuelle simulée
    manual_comments = perform_manual_review(pr_number)
    review.comments.extend(manual_comments)
    
    # 3. Décision
    if any(c.severity == 'blocking' for c in review.comments):
        review.status = ReviewStatus.CHANGES_REQUESTED
    elif all(c.severity in ['minor', 'info'] for c in review.comments):
        review.status = ReviewStatus.APPROVED
    else:
        review.status = ReviewStatus.CHANGES_REQUESTED
    
    return review

def run_automated_checks(pr_number: int) -> bool:
    """Exécute les vérifications automatisées"""
    # Intégration avec les outils de CI/CD
    return True  # Simulation

def perform_manual_review(pr_number: int) -> List[ReviewComment]:
    """Effectue une revue manuelle (simulée)"""
    return [
        ReviewComment(
            file_path="app/services/task_service.py",
            line_number=42,
            comment="💡 Considérer ajouter une validation pour la longueur du titre",
            severity="minor",
            reviewer="senior_dev"
        )
    ]
```

**Démonstration pratique (15 min)**
Processus complet de code review avec outils automatisés.

**Exercices guidés (10 min)**
1. Créer une checklist de code review
2. Analyser un diff et identifier les problèmes
3. Rédiger des commentaires constructifs

**QCM d'auto-évaluation (3 min)**
1. Quel type de commentaire bloque la fusion ?
2. Quand approuver une PR ?
3. Quel outil pour les reviews automatisées ?

**Devoir**
Mettre en place un processus de code review complet pour l'application "Tâches".

---

## Cours 19 - Refactoring patterns
**Objectifs**
- Maîtriser les techniques de refactoring sécurisé
- Reconnaître les code smells et les corriger
- Refactorer sans introduire de bugs

**Leçon (30 min - détaillée)**
Le refactoring améliore le code sans changer son comportement.

**Code smells courants**
```python
# ❌ Long Method
class TaskService:
    def create_task(self, data):
        # Validation
        if not data.get('title'):
            raise ValueError("Title required")
        if len(data.get('title', '')) > 200:
            raise ValueError("Title too long")
        
        # Création
        task = Task(
            title=data['title'].strip(),
            description=data.get('description', '').strip(),
            priority=data.get('priority', 1)
        )
        
        # Sauvegarde
        self.repository.save(task)
        
        # Notification
        if data.get('notify_users'):
            self.notifier.send_task_created(task)
        
        # Logging
        logger.info(f"Task created: {task.id}")
        
        return task

# ✅ Extract Method
class TaskService:
    def create_task(self, data):
        self._validate_task_data(data)
        task = self._build_task(data)
        saved_task = self.repository.save(task)
        self._handle_notifications(saved_task, data)
        self._log_task_creation(saved_task)
        return saved_task
    
    def _validate_task_data(self, data):
        if not data.get('title'):
            raise ValueError("Title required")
        if len(data.get('title', '')) > 200:
            raise ValueError("Title too long")
    
    def _build_task(self, data):
        return Task(
            title=data['title'].strip(),
            description=data.get('description', '').strip(),
            priority=data.get('priority', 1)
        )
    
    def _handle_notifications(self, task, data):
        if data.get('notify_users'):
            self.notifier.send_task_created(task)
    
    def _log_task_creation(self, task):
        logger.info(f"Task created: {task.id}")
```

**Refactoring patterns**
```python
# 1. Extract Class - Séparer les responsabilités
# ❌ God Object
class TaskManager:
    def __init__(self):
        self.tasks = []
        self.users = []
        self.notifications = []
    
    def add_task(self, task_data):
        # Validation, sauvegarde, notification...
        pass
    
    def add_user(self, user_data):
        # Validation, sauvegarde...
        pass
    
    def send_notification(self, message):
        # Logique d'envoi...
        pass

# ✅ Separate Classes
class TaskService:
    def __init__(self, repository, notifier):
        self.repository = repository
        self.notifier = notifier
    
    def add_task(self, task_data):
        # Logique métier des tâches
        pass

class UserService:
    def __init__(self, repository):
        self.repository = repository
    
    def add_user(self, user_data):
        # Logique métier des utilisateurs
        pass

class NotificationService:
    def send_notification(self, message):
        # Logique des notifications
        pass

# 2. Move Method - Déplacer une méthode vers la bonne classe
# ❌ Method in wrong class
class Task:
    def __init__(self, title, assignee):
        self.title = title
        self.assignee = assignee
    
    def send_assignment_notification(self):
        # Logique d'envoi d'email
        email_service.send(self.assignee.email, f"Assigned to: {self.title}")

# ✅ Move to appropriate class
class Task:
    def __init__(self, title, assignee):
        self.title = title
        self.assignee = assignee
    
    def notify_assignee(self, notification_service):
        notification_service.send_assignment_notification(self)

class NotificationService:
    def send_assignment_notification(self, task):
        email_service.send(task.assignee.email, f"Assigned to: {task.title}")

# 3. Replace Conditional with Polymorphism
# ❌ Complex conditional
class TaskExporter:
    def export(self, tasks, format_type):
        if format_type == 'json':
            return json.dumps([t.__dict__ for t in tasks])
        elif format_type == 'csv':
            # Logique CSV
            pass
        elif format_type == 'xml':
            # Logique XML
            pass
        else:
            raise ValueError(f"Unsupported format: {format_type}")

# ✅ Polymorphism
from abc import ABC, abstractmethod

class TaskExporter(ABC):
    @abstractmethod
    def export(self, tasks):
        pass

class JSONTaskExporter(TaskExporter):
    def export(self, tasks):
        return json.dumps([t.__dict__ for t in tasks])

class CSVTaskExporter(TaskExporter):
    def export(self, tasks):
        # Logique CSV
        pass

class TaskExportService:
    def __init__(self):
        self.exporters = {
            'json': JSONTaskExporter(),
            'csv': CSVTaskExporter(),
        }
    
    def export(self, tasks, format_type):
        exporter = self.exporters.get(format_type)
        if not exporter:
            raise ValueError(f"Unsupported format: {format_type}")
        return exporter.export(tasks)
```

**Refactoring sécurisé avec tests**
```python
# refactoring_workflow.py
import pytest
from typing import List

class RefactoringTestSuite:
    """Suite de tests pour refactoring sécurisé"""
    
    def test_original_behavior_preserved(self):
        """Test que le comportement original est préservé"""
        # Setup
        service = TaskService()
        
        # Test data
        task_data = {"title": "Test Task", "description": "Test"}
        
        # Action
        result = service.create_task(task_data)
        
        # Assertions
        assert result.title == "Test Task"
        assert result.description == "Test"
        assert result.id is not None
    
    def test_edge_cases_handled(self):
        """Test que les cas limites sont gérés"""
        service = TaskService()
        
        # Empty title
        with pytest.raises(ValueError):
            service.create_task({"title": ""})
        
        # Very long title
        long_title = "A" * 300
        with pytest.raises(ValueError):
            service.create_task({"title": long_title})
    
    def test_performance_not_degraded(self):
        """Test que les performances ne sont pas dégradées"""
        import time
        
        service = TaskService()
        task_data = {"title": "Perf Test", "description": "Test"}
        
        # Mesurer le temps avant refactoring
        start = time.time()
        for _ in range(100):
            service.create_task(task_data)
        end = time.time()
        
        duration = end - start
        assert duration < 5.0  # Ne doit pas prendre plus de 5 secondes

def run_refactoring_tests():
    """Exécute tous les tests de refactoring"""
    pytest.main([
        "-v",
        "--tb=short",
        "tests/refactoring/",
        "--cov=app",
        "--cov-report=html"
    ])

# Workflow de refactoring
def safe_refactoring_workflow():
    """
    Workflow pour refactoring sécurisé:
    1. Écrire des tests complets
    2. Exécuter les tests (doivent passer)
    3. Effectuer le refactoring
    4. Ré-exécuter les tests (doivent toujours passer)
    5. Nettoyer et optimiser
    6. Commit avec message descriptif
    """
    
    print("🔄 Début du refactoring sécurisé")
    
    # 1. Tests initiaux
    print("1. Exécution des tests initiaux...")
    run_refactoring_tests()
    
    # 2. Refactoring (manuel)
    print("2. Application du refactoring...")
    # Ici le développeur applique les changements
    
    # 3. Tests post-refactoring
    print("3. Vérification post-refactoring...")
    run_refactoring_tests()
    
    # 4. Vérifications supplémentaires
    print("4. Vérifications qualité...")
    # Linting, type checking, etc.
    
    print("✅ Refactoring terminé avec succès")

# Patterns de refactoring courants
REFACTORING_PATTERNS = {
    'extract_method': {
        'description': 'Extraire une méthode pour réduire la complexité',
        'when_to_use': 'Méthode trop longue (> 20 lignes)',
        'example': 'Extraire la logique de validation dans _validate_input()'
    },
    
    'extract_class': {
        'description': 'Créer une nouvelle classe pour séparer les responsabilités',
        'when_to_use': 'Classe avec trop de responsabilités',
        'example': 'Extraire NotificationService de TaskService'
    },
    
    'move_method': {
        'description': 'Déplacer une méthode vers la classe appropriée',
        'when_to_use': 'Méthode utilisée principalement par une autre classe',
        'example': 'Déplacer calculate_due_date() vers Task'
    },
    
    'replace_conditional_with_polymorphism': {
        'description': 'Utiliser l\'héritage au lieu de conditions',
        'when_to_use': 'Conditions complexes sur le type d\'objet',
        'example': 'TaskFormatter polymorphique au lieu de if format == "json"'
    },
    
    'introduce_parameter_object': {
        'description': 'Grouper des paramètres liés dans un objet',
        'when_to_use': 'Méthode avec trop de paramètres',
        'example': 'TaskCreationParams au lieu de title, desc, priority séparés'
    },
    
    'replace_magic_number_with_constant': {
        'description': 'Remplacer les nombres magiques par des constantes',
        'when_to_use': 'Nombres codés en dur dans le code',
        'example': 'MAX_TITLE_LENGTH = 200'
    }
}

def suggest_refactoring(code_snippet: str) -> List[str]:
    """Suggère des refactorings pour un extrait de code"""
    suggestions = []
    
    # Analyse simple
    lines = code_snippet.split('\n')
    
    if len(lines) > 30:
        suggestions.append("extract_method: Méthode trop longue, extraire des sous-méthodes")
    
    if 'if' in code_snippet and 'elif' in code_snippet:
        suggestions.append("replace_conditional_with_polymorphism: Conditions complexes, considérer le polymorphisme")
    
    magic_numbers = re.findall(r'\b\d{2,}\b', code_snippet)
    if magic_numbers:
        suggestions.append("replace_magic_number_with_constant: Nombres magiques détectés")
    
    return suggestions
```

**Démonstration pratique (15 min)**
Application de patterns de refactoring sur du code legacy.

**Exercices guidés (10 min)**
1. Identifier les code smells dans un code donné
2. Appliquer un pattern de refactoring
3. Vérifier que les tests passent après refactoring

**QCM d'auto-évaluation (3 min)**
1. Quel refactoring pour une méthode trop longue ?
2. Quand utiliser Extract Class ?
3. Pourquoi faire des tests avant refactoring ?

**Devoir**
Refactorer une partie de l'application "Tâches" en appliquant les patterns appropriés.

---

## Cours 20 - Gestion de dette technique
**Objectifs**
- Identifier et mesurer la dette technique
- Prioriser et planifier la réduction de dette
- Équilibrer dette et développement de fonctionnalités

**Leçon (30 min - détaillée)**
La dette technique est un investissement nécessaire pour l'avenir du code.

**Types de dette technique**
```python
# technical_debt_types.py
from enum import Enum
from typing import Dict, List, Any
from dataclasses import dataclass

class DebtType(Enum):
    CODE_QUALITY = "code_quality"
    ARCHITECTURE = "architecture"
    PERFORMANCE = "performance"
    SECURITY = "security"
    TESTING = "testing"
    DOCUMENTATION = "documentation"
    DEPENDENCIES = "dependencies"

class DebtSeverity(Enum):
    LOW = "low"
    MEDIUM = "medium"
    HIGH = "high"
    CRITICAL = "critical"

@dataclass
class TechnicalDebt:
    id: str
    type: DebtType
    severity: DebtSeverity
    title: str
    description: str
    location: str  # file:line ou component
    effort: int  # jours-homme estimés
    impact: str  # impact sur le projet
    created_date: str
    resolved_date: Optional[str] = None
    
    @property
    def is_resolved(self) -> bool:
        return self.resolved_date is not None
    
    @property
    def priority_score(self) -> int:
        """Calcule un score de priorité basé sur sévérité et impact"""
        severity_score = {
            DebtSeverity.LOW: 1,
            DebtSeverity.MEDIUM: 2,
            DebtSeverity.HIGH: 3,
            DebtSeverity.CRITICAL: 4
        }[self.severity]
        
        # Impact estimé (simplifié)
        impact_score = 2 if "performance" in self.impact.lower() else 1
        
        return severity_score * impact_score

class TechnicalDebtRegistry:
    def __init__(self):
        self.debts: Dict[str, TechnicalDebt] = {}
    
    def add_debt(self, debt: TechnicalDebt):
        self.debts[debt.id] = debt
    
    def resolve_debt(self, debt_id: str):
        if debt_id in self.debts:
            from datetime import datetime
            self.debts[debt_id].resolved_date = datetime.now().isoformat()
    
    def get_unresolved_debts(self) -> List[TechnicalDebt]:
        return [d for d in self.debts.values() if not d.is_resolved]
    
    def get_debts_by_priority(self) -> List[TechnicalDebt]:
        unresolved = self.get_unresolved_debts()
        return sorted(unresolved, key=lambda d: d.priority_score, reverse=True)
    
    def get_debt_summary(self) -> Dict[str, Any]:
        unresolved = self.get_unresolved_debts()
        
        by_type = {}
        for debt in unresolved:
            debt_type = debt.type.value
            if debt_type not in by_type:
                by_type[debt_type] = 0
            by_type[debt_type] += 1
        
        by_severity = {}
        for debt in unresolved:
            severity = debt.severity.value
            if severity not in by_severity:
                by_severity[severity] = 0
            by_severity[severity] += 1
        
        total_effort = sum(d.effort for d in unresolved)
        
        return {
            'total_debts': len(unresolved),
            'by_type': by_type,
            'by_severity': by_severity,
            'total_effort_days': total_effort,
            'high_priority_count': len([d for d in unresolved if d.priority_score >= 6])
        }

# Outils d'analyse automatique
class DebtAnalyzer:
    def __init__(self, project_path: str):
        self.project_path = project_path
    
    def analyze_code_complexity(self) -> List[TechnicalDebt]:
        """Analyse la complexité cyclomatique"""
        debts = []
        
        # Utiliser radon pour mesurer la complexité
        import subprocess
        result = subprocess.run(['radon', 'cc', self.project_path, '-j'], 
                              capture_output=True, text=True)
        
        if result.returncode == 0:
            import json
            complexity_data = json.loads(result.stdout)
            
            for file_path, functions in complexity_data.items():
                for func_name, data in functions.items():
                    complexity = data['complexity']
                    if complexity > 10:  # Seuil arbitraire
                        debts.append(TechnicalDebt(
                            id=f"complexity_{file_path}_{func_name}",
                            type=DebtType.CODE_QUALITY,
                            severity=DebtSeverity.MEDIUM if complexity > 15 else DebtSeverity.LOW,
                            title=f"Fonction complexe: {func_name}",
                            description=f"Complexité cyclomatique: {complexity} (recommandé: < 10)",
                            location=f"{file_path}:{data['line_number']}",
                            effort=complexity // 5,  # Effort estimé
                            impact="Difficulté de maintenance et testing",
                            created_date=datetime.now().isoformat()
                        ))
        
        return debts
    
    def analyze_code_duplication(self) -> List[TechnicalDebt]:
        """Détecte la duplication de code"""
        debts = []
        
        # Simulation simple (utiliser un outil comme jscpd en vrai)
        # Analyser les fichiers et chercher des patterns similaires
        
        return debts
    
    def analyze_outdated_dependencies(self) -> List[TechnicalDebt]:
        """Vérifie les dépendances obsolètes"""
        debts = []
        
        try:
            import subprocess
            result = subprocess.run(['pip', 'list', '--outdated'], 
                                  capture_output=True, text=True)
            
            if result.returncode == 0:
                lines = result.stdout.strip().split('\n')[2:]  # Skip headers
                
                for line in lines:
                    if line.strip():
                        parts = line.split()
                        if len(parts) >= 3:
                            package, current, latest = parts[0], parts[1], parts[2]
                            
                            debts.append(TechnicalDebt(
                                id=f"outdated_{package}",
                                type=DebtType.DEPENDENCIES,
                                severity=DebtSeverity.MEDIUM,
                                title=f"Dépendance obsolète: {package}",
                                description=f"Version actuelle: {current}, dernière: {latest}",
                                location="requirements.txt",
                                effort=1,
                                impact="Sécurité et compatibilité",
                                created_date=datetime.now().isoformat()
                            ))
        except:
            pass
        
        return debts

# Exemple d'utilisation
def analyze_project_debt(project_path: str) -> TechnicalDebtRegistry:
    """Analyse complète de la dette technique"""
    registry = TechnicalDebtRegistry()
    analyzer = DebtAnalyzer(project_path)
    
    # Analyses automatiques
    debts = []
    debts.extend(analyzer.analyze_code_complexity())
    debts.extend(analyzer.analyze_outdated_dependencies())
    
    # Dette manuellement identifiée
    manual_debts = [
        TechnicalDebt(
            id="legacy_auth",
            type=DebtType.SECURITY,
            severity=DebtSeverity.HIGH,
            title="Système d'authentification legacy",
            description="Utilise MD5 pour le hash des mots de passe",
            location="auth.py",
            effort=5,
            impact="Faille de sécurité critique",
            created_date="2024-01-01"
        ),
        
        TechnicalDebt(
            id="missing_tests",
            type=DebtType.TESTING,
            severity=DebtSeverity.MEDIUM,
            title="Couverture de tests insuffisante",
            description="Seulement 60% de couverture de code",
            location="tests/",
            effort=10,
            impact="Risque de régression élevé",
            created_date="2024-01-01"
        )
    ]
    
    debts.extend(manual_debts)
    
    # Enregistrer toutes les dettes
    for debt in debts:
        registry.add_debt(debt)
    
    return registry
```

**Stratégies de gestion de dette**
```python
# debt_management.py
from typing import List, Dict, Any
import math

class DebtManagementStrategy:
    def __init__(self, registry: TechnicalDebtRegistry):
        self.registry = registry
    
    def plan_debt_reduction(self, available_effort_days: int, 
                          sprint_duration_days: int = 14) -> Dict[str, Any]:
        """
        Planifie la réduction de dette sur plusieurs sprints
        """
        unresolved_debts = self.registry.get_debts_by_priority()
        
        # Calculer combien de sprints nécessaires
        total_effort = sum(debt.effort for debt in unresolved_debts)
        sprints_needed = math.ceil(total_effort / sprint_duration_days)
        
        # Allouer la dette par sprint
        plan = []
        current_sprint_effort = 0
        current_sprint_debts = []
        
        for debt in unresolved_debts:
            if current_sprint_effort + debt.effort <= sprint_duration_days:
                current_sprint_debts.append(debt)
                current_sprint_effort += debt.effort
            else:
                # Nouveau sprint
                plan.append({
                    'sprint': len(plan) + 1,
                    'effort_days': current_sprint_effort,
                    'debts': current_sprint_debts
                })
                
                current_sprint_debts = [debt]
                current_sprint_effort = debt.effort
        
        # Dernier sprint
        if current_sprint_debts:
            plan.append({
                'sprint': len(plan) + 1,
                'effort_days': current_sprint_effort,
                'debts': current_sprint_debts
            })
        
        return {
            'total_sprints': len(plan),
            'total_effort': total_effort,
            'available_effort': available_effort_days,
            'sprints': plan,
            'recommendation': self._generate_recommendation(total_effort, available_effort_days)
        }
    
    def _generate_recommendation(self, total_effort: int, available_effort: int) -> str:
        """Génère une recommandation basée sur l'effort"""
        ratio = total_effort / available_effort if available_effort > 0 else float('inf')
        
        if ratio > 2:
            return "⚠️ Dette technique importante. Considérer allouer plus de temps ou prioriser les dettes critiques."
        elif ratio > 1:
            return "📊 Dette technique modérée. Plan de réduction réaliste sur plusieurs sprints."
        else:
            return "✅ Dette technique gérable. Peut être résolue rapidement."
    
    def calculate_debt_velocity(self, resolved_debts_last_sprint: int) -> float:
        """
        Calcule la vélocité de résolution de dette
        """
        # Vélocité = dettes résolues par sprint
        return resolved_debts_last_sprint
    
    def suggest_prevention_measures(self) -> List[str]:
        """Suggère des mesures de prévention"""
        return [
            "🏃 Intégrer des vérifications automatiques dans CI/CD",
            "📚 Former l'équipe aux bonnes pratiques",
            "🔍 Effectuer des revues de code régulières",
            "📏 Définir des standards de qualité",
            "⏰ Allouer du temps pour la refactorisation",
            "🧪 Maintenir une couverture de tests élevée"
        ]

# Intégration dans le processus de développement
class DevelopmentWorkflow:
    def __init__(self, debt_registry: TechnicalDebtRegistry):
        self.debt_registry = debt_registry
        self.management = DebtManagementStrategy(debt_registry)
    
    def before_sprint_planning(self):
        """Actions avant la planification du sprint"""
        summary = self.debt_registry.get_debt_summary()
        
        print("📊 État de la dette technique:")
        print(f"  Total: {summary['total_debts']} dettes")
        print(f"  Effort total: {summary['total_effort_days']} jours")
        print(f"  Dettes haute priorité: {summary['high_priority_count']}")
        
        # Recommandations
        if summary['high_priority_count'] > 0:
            print("⚠️ Dettes critiques détectées - prioriser leur résolution")
    
    def during_sprint(self, sprint_effort_available: int):
        """Pendant le sprint"""
        plan = self.management.plan_debt_reduction(sprint_effort_available)
        
        print(f"📅 Plan de réduction de dette: {plan['total_sprints']} sprints nécessaires")
        print(f"💡 Recommandation: {plan['recommendation']}")
    
    def after_sprint(self, resolved_debt_ids: List[str]):
        """Après le sprint"""
        for debt_id in resolved_debt_ids:
            self.debt_registry.resolve_debt(debt_id)
        
        velocity = self.management.calculate_debt_velocity(len(resolved_debt_ids))
        print(f"🏃 Vélocité de résolution: {velocity} dettes par sprint")
        
        # Prévention
        if velocity < 2:  # Arbitraire
            print("💡 Mesures de prévention suggérées:")
            for measure in self.management.suggest_prevention_measures():
                print(f"  {measure}")

# Métriques de suivi
def track_debt_metrics(registry: TechnicalDebtRegistry) -> Dict[str, Any]:
    """Calcule les métriques de dette technique"""
    summary = registry.get_debt_summary()
    
    # Tendance (simulée - en vrai utiliser historique)
    trend = "stable"  # increasing, decreasing, stable
    
    # Seuils d'alerte
    alerts = []
    if summary['total_debts'] > 50:
        alerts.append("🔴 Nombre élevé de dettes techniques")
    if summary['high_priority_count'] > 10:
        alerts.append("🔴 Trop de dettes haute priorité")
    
    return {
        'current_state': summary,
        'trend': trend,
        'alerts': alerts,
        'health_score': calculate_health_score(summary)
    }

def calculate_health_score(summary: Dict[str, Any]) -> int:
    """Calcule un score de santé du projet (0-100)"""
    base_score = 100
    
    # Pénalités
    base_score -= summary['total_debts'] * 2  # -2 par dette
    base_score -= summary['high_priority_count'] * 5  # -5 par dette critique
    
    return max(0, min(100, base_score))
```

**Démonstration pratique (15 min)**
Analyse de dette technique et planification de réduction.

**Exercices guidés (10 min)**
1. Identifier la dette technique dans un projet
2. Prioriser les dettes selon leur impact
3. Créer un plan de réduction réaliste

**QCM d'auto-évaluation (3 min)**
1. Quelle dette a la plus haute priorité ?
2. Comment mesurer la dette technique ?
3. Quand payer la dette technique ?

**Devoir**
Analyser et planifier la réduction de dette technique pour l'application "Tâches".

---

## Cours 21 - Monitoring applicatif
**Objectifs**
- Implémenter des métriques métier personnalisées
- Configurer l'observabilité complète
- Créer des tableaux de bord métier

**Leçon (30 min - détaillée)**
Le monitoring applicatif va au-delà de la technique pour inclure les métriques métier.

**Métriques métier avec Prometheus**
```python
# business_metrics.py
from prometheus_client import Counter, Gauge, Histogram, Summary
from typing import Dict, Any
import time

class BusinessMetrics:
    def __init__(self):
        # Métriques de tâches
        self.tasks_created = Counter(
            'tasks_created_total', 
            'Total number of tasks created',
            ['priority', 'source']  # Labels pour segmentation
        )
        
        self.tasks_completed = Counter(
            'tasks_completed_total',
            'Total number of tasks completed',
            ['priority', 'completion_time_days']
        )
        
        self.active_tasks = Gauge(
            'active_tasks_current',
            'Number of currently active tasks',
            ['priority']
        )
        
        self.task_completion_time = Histogram(
            'task_completion_time_seconds',
            'Time taken to complete tasks',
            ['priority'],
            buckets=[3600, 86400, 604800, 2592000]  # 1h, 1j, 1sem, 1mois
        )
        
        # Métriques utilisateurs
        self.user_registrations = Counter(
            'user_registrations_total',
            'Total user registrations',
            ['registration_method', 'user_type']
        )
        
        self.active_users_daily = Gauge(
            'active_users_daily',
            'Number of daily active users'
        )
        
        self.user_session_duration = Summary(
            'user_session_duration_seconds',
            'User session duration in seconds'
        )
        
        # Métriques performance métier
        self.api_response_time = Histogram(
            'api_response_time_seconds',
            'API response time by endpoint',
            ['endpoint', 'method', 'status_code'],
            buckets=[0.1, 0.5, 1.0, 2.0, 5.0, 10.0]
        )
        
        # Métriques erreurs
        self.business_errors = Counter(
            'business_errors_total',
            'Business logic errors',
            ['error_type', 'component']
        )
        
        # Métriques ressources
        self.database_connection_pool_usage = Gauge(
            'db_connection_pool_usage',
            'Database connection pool usage ratio'
        )
        
        self.cache_hit_ratio = Gauge(
            'cache_hit_ratio',
            'Cache hit ratio (0.0 to 1.0)'
        )

# Service de métriques métier
class BusinessMetricsService:
    def __init__(self):
        self.metrics = BusinessMetrics()
        self._last_cache_stats_update = 0
    
    def record_task_created(self, task, source: str = 'api'):
        """Enregistre la création d'une tâche"""
        self.metrics.tasks_created.labels(
            priority=str(task.priority),
            source=source
        ).inc()
        
        # Mettre à jour le gauge des tâches actives
        self._update_active_tasks_count()
    
    def record_task_completed(self, task, completion_time_seconds: float):
        """Enregistre la complétion d'une tâche"""
        # Calculer le temps en jours
        completion_days = int(completion_time_seconds / 86400)
        
        self.metrics.tasks_completed.labels(
            priority=str(task.priority),
            completion_time_days=str(completion_days)
        ).inc()
        
        self.metrics.task_completion_time.labels(
            priority=str(task.priority)
        ).observe(completion_time_seconds)
        
        self._update_active_tasks_count()
    
    def record_user_registration(self, user, method: str = 'email'):
        """Enregistre une inscription utilisateur"""
        self.metrics.user_registrations.labels(
            registration_method=method,
            user_type='standard'  # ou 'premium', etc.
        ).inc()
    
    def record_api_call(self, endpoint: str, method: str, status_code: int, duration: float):
        """Enregistre un appel API"""
        self.metrics.api_response_time.labels(
            endpoint=endpoint,
            method=method,
            status_code=str(status_code)
        ).observe(duration)
    
    def record_business_error(self, error_type: str, component: str):
        """Enregistre une erreur métier"""
        self.metrics.business_errors.labels(
            error_type=error_type,
            component=component
        ).inc()
    
    def update_system_metrics(self):
        """Met à jour les métriques système (appelé périodiquement)"""
        current_time = time.time()
        
        # Mise à jour des métriques de cache (toutes les 60 secondes)
        if current_time - self._last_cache_stats_update > 60:
            self._update_cache_stats()
            self._last_cache_stats_update = current_time
        
        # Mise à jour des métriques DB
        self._update_database_stats()
    
    def _update_active_tasks_count(self):
        """Met à jour le nombre de tâches actives"""
        # Simulation - en vrai, compter depuis la DB
        active_counts = {
            '1': 10,  # priorité 1
            '2': 25,  # priorité 2
            '3': 40,  # priorité 3
        }
        
        for priority, count in active_counts.items():
            self.metrics.active_tasks.labels(priority=str(priority)).set(count)
    
    def _update_cache_stats(self):
        """Met à jour les statistiques de cache"""
        # Simulation - en vrai, récupérer depuis Redis
        hit_ratio = 0.85  # 85% hit rate
        self.metrics.cache_hit_ratio.set(hit_ratio)
    
    def _update_database_stats(self):
        """Met à jour les statistiques de base de données"""
        # Simulation
        pool_usage = 0.7  # 70% du pool utilisé
        self.metrics.database_connection_pool_usage.set(pool_usage)

# Intégration dans l'application
def create_metrics_service():
    return BusinessMetricsService()

# Middleware pour mesurer les appels API
@app.before_request
def start_api_timer():
    g.api_start_time = time.time()

@app.after_request
def record_api_metrics(response):
    if hasattr(g, 'api_start_time'):
        duration = time.time() - g.api_start_time
        
        # Récupérer le service de métriques depuis l'app context
        metrics_service = get_metrics_service()
        metrics_service.record_api_call(
            endpoint=request.endpoint or 'unknown',
            method=request.method,
            status_code=response.status_code,
            duration=duration
        )
    
    return response

# Décorateur pour mesurer les opérations métier
def track_business_operation(operation_name: str):
    def decorator(func):
        @wraps(func)
        async def wrapper(*args, **kwargs):
            start_time = time.time()
            try:
                result = await func(*args, **kwargs)
                
                # Mesurer la durée de l'opération
                duration = time.time() - start_time
                
                # Enregistrer comme métrique custom
                BUSINESS_OPERATION_DURATION.labels(
                    operation=operation_name,
                    status='success'
                ).observe(duration)
                
                return result
                
            except Exception as e:
                duration = time.time() - start_time
                
                BUSINESS_OPERATION_DURATION.labels(
                    operation=operation_name,
                    status='error'
                ).observe(duration)
                
                raise
    
    return decorator
```

**Tableaux de bord métier Grafana**
```json
// dashboard-business-metrics.json
{
  "dashboard": {
    "title": "Business Metrics Dashboard",
    "tags": ["business", "metrics"],
    "timezone": "browser",
    "panels": [
      {
        "title": "Task Creation Rate",
        "type": "graph",
        "targets": [
          {
            "expr": "rate(tasks_created_total[5m])",
            "legendFormat": "Tasks created/min"
          }
        ]
      },
      {
        "title": "Active Tasks by Priority",
        "type": "bargauge",
        "targets": [
          {
            "expr": "active_tasks_current",
            "legendFormat": "{{priority}}"
          }
        ]
      },
      {
        "title": "Task Completion Time",
        "type": "heatmap",
        "targets": [
          {
            "expr": "rate(task_completion_time_seconds_bucket[5m])",
            "legendFormat": "Completion time"
          }
        ]
      },
      {
        "title": "User Registrations",
        "type": "stat",
        "targets": [
          {
            "expr": "rate(user_registrations_total[1h])",
            "legendFormat": "Registrations/hour"
          }
        ]
      },
      {
        "title": "API Performance",
        "type": "table",
        "targets": [
          {
            "expr": "histogram_quantile(0.95, rate(api_response_time_seconds_bucket[5m]))",
            "legendFormat": "{{endpoint}} - 95th percentile"
          }
        ]
      },
      {
        "title": "Business Errors",
        "type": "graph",
        "targets": [
          {
            "expr": "rate(business_errors_total[5m])",
            "legendFormat": "{{error_type}} in {{component}}"
          }
        ]
      },
      {
        "title": "System Health",
        "type": "gauge",
        "targets": [
          {
            "expr": "cache_hit_ratio * 100",
            "legendFormat": "Cache Hit Ratio %"
          },
          {
            "expr": "db_connection_pool_usage * 100",
            "legendFormat": "DB Pool Usage %"
          }
        ]
      }
    ]
  }
}
```

**Alertes métier**
```yaml
# business-alerts.yml
groups:
  - name: business_metrics_alerts
    rules:
      - alert: LowTaskCreationRate
        expr: rate(tasks_created_total[1h]) < 5
        for: 30m
        labels:
          severity: warning
        annotations:
          summary: "Low task creation rate"
          description: "Only {{ $value }} tasks created in the last hour"
          
      - alert: HighTaskCompletionTime
        expr: histogram_quantile(0.95, rate(task_completion_time_seconds_bucket[1h])) > 604800
        for: 15m
        labels:
          severity: warning
        annotations:
          summary: "Tasks taking too long to complete"
          description: "95th percentile completion time > 1 week"
          
      - alert: HighBusinessErrorRate
        expr: rate(business_errors_total[5m]) > 10
        for: 5m
        labels:
          severity: critical
        annotations:
          summary: "High business error rate"
          description: "More than 10 business errors per minute"
          
      - alert: LowUserRegistrations
        expr: rate(user_registrations_total[1d]) < 1
        for: 1h
        labels:
          severity: info
        annotations:
          summary: "Low user registration rate"
          description: "Less than 1 user registration per day"
```

**Démonstration pratique (15 min)**
Configuration de métriques métier et tableaux de bord.

**Exercices guidés (10 min)**
1. Définir des métriques métier pertinentes
2. Créer un tableau de bord Grafana
3. Configurer des alertes métier

**QCM d'auto-évaluation (3 min)**
1. Quelle différence entre métrique technique et métier ?
2. Quel type de métrique pour mesurer la satisfaction client ?
3. Quand créer une alerte métier ?

**Devoir**
Implémenter un système complet de monitoring applicatif pour l'application "Tâches".

---

## Cours 22 - Feature flags
**Objectifs**
- Implémenter un système de feature flags
- Gérer le déploiement progressif
- Effectuer des tests A/B

**Leçon (30 min - détaillée)**
Les feature flags permettent de contrôler le déploiement et les fonctionnalités.

**Système de feature flags**
```python
# feature_flags_system.py
from typing import Dict, Any, Optional, List, Callable
from dataclasses import dataclass
from enum import Enum
import hashlib
import random
from datetime import datetime

class FeatureFlagState(Enum):
    DISABLED = "disabled"
    ENABLED = "enabled"
    ROLLOUT = "rollout"

class FeatureFlagType(Enum):
    BOOLEAN = "boolean"  # On/Off simple
    PERCENTAGE = "percentage"  # Rollout progressif
    USER_BASED = "user_based"  # Basé sur utilisateurs spécifiques
    TIME_BASED = "time_based"  # Activé à une date/heure

@dataclass
class FeatureFlag:
    name: str
    type: FeatureFlagType
    state: FeatureFlagState
    config: Dict[str, Any]
    created_at: datetime
    updated_at: datetime
    
    def is_enabled_for(self, context: Optional[Dict[str, Any]] = None) -> bool:
        """Détermine si le flag est activé pour le contexte donné"""
        context = context or {}
        
        if self.state == FeatureFlagState.DISABLED:
            return False
        
        if self.state == FeatureFlagState.ENABLED:
            return True
        
        if self.state == FeatureFlagState.ROLLOUT:
            return self._evaluate_rollout(context)
        
        return False
    
    def _evaluate_rollout(self, context: Dict[str, Any]) -> bool:
        """Évalue les conditions de rollout"""
        if self.type == FeatureFlagType.PERCENTAGE:
            percentage = self.config.get('percentage', 0)
            user_id = context.get('user_id', 'anonymous')
            
            # Rollout basé sur hash de l'user_id pour cohérence
            hash_value = int(hashlib.md5(user_id.encode()).hexdigest(), 16)
            user_percentage = (hash_value % 100) / 100.0
            
            return user_percentage < (percentage / 100.0)
        
        elif self.type == FeatureFlagType.USER_BASED:
            allowed_users = set(self.config.get('users', []))
            current_user = context.get('user_id')
            return current_user in allowed_users
        
        elif self.type == FeatureFlagType.TIME_BASED:
            activation_time = self.config.get('activation_time')
            if activation_time:
                return datetime.now() >= datetime.fromisoformat(activation_time)
        
        return False

class FeatureFlagService:
    def __init__(self, storage_adapter):
        self.storage = storage_adapter
        self.flags: Dict[str, FeatureFlag] = {}
        self._load_flags()
    
    def _load_flags(self):
        """Charge les flags depuis le stockage"""
        stored_flags = self.storage.load_all_flags()
        for flag_data in stored_flags:
            self.flags[flag_data['name']] = FeatureFlag(**flag_data)
    
    def is_enabled(self, flag_name: str, context: Optional[Dict[str, Any]] = None) -> bool:
        """Vérifie si un flag est activé"""
        flag = self.flags.get(flag_name)
        if not flag:
            return False
        
        return flag.is_enabled_for(context)
    
    def create_flag(self, name: str, type: FeatureFlagType, config: Dict[str, Any]) -> FeatureFlag:
        """Crée un nouveau feature flag"""
        flag = FeatureFlag(
            name=name,
            type=type,
            state=FeatureFlagState.DISABLED,
            config=config,
            created_at=datetime.now(),
            updated_at=datetime.now()
        )
        
        self.flags[name] = flag
        self.storage.save_flag(flag)
        return flag
    
    def update_flag_state(self, name: str, state: FeatureFlagState, config: Optional[Dict[str, Any]] = None):
        """Met à jour l'état d'un flag"""
        if name not in self.flags:
            raise ValueError(f"Flag {name} not found")
        
        flag = self.flags[name]
        flag.state = state
        flag.updated_at = datetime.now()
        
        if config:
            flag.config.update(config)
        
        self.storage.save_flag(flag)
    
    def get_flag_stats(self, flag_name: str) -> Dict[str, Any]:
        """Retourne les statistiques d'utilisation d'un flag"""
        # Simulation - en vrai, collecter depuis les logs/métriques
        return {
            'name': flag_name,
            'enabled_users': 1250,
            'total_users': 5000,
            'conversion_rate': 0.15,
            'last_updated': datetime.now().isoformat()
        }

# Adaptateur de stockage (base de données)
class DatabaseFlagStorage:
    def __init__(self, db_session):
        self.db = db_session
    
    def load_all_flags(self) -> List[Dict[str, Any]]:
        # Simulation
        return [
            {
                'name': 'new_task_ui',
                'type': FeatureFlagType.PERCENTAGE,
                'state': FeatureFlagState.ROLLOUT,
                'config': {'percentage': 25},
                'created_at': datetime.now(),
                'updated_at': datetime.now()
            }
        ]
    
    def save_flag(self, flag: FeatureFlag):
        # Sauvegarder en base
        pass

# Utilisation dans l'application
feature_flags = None

def init_feature_flags():
    global feature_flags
    storage = DatabaseFlagStorage(db.session)
    feature_flags = FeatureFlagService(storage)

@app.route('/api/tasks')
def get_tasks():
    user_id = get_current_user_id()
    context = {'user_id': user_id}
    
    # Nouvelle interface de tâches
    if feature_flags.is_enabled('new_task_ui', context):
        return render_new_task_interface()
    else:
        return render_old_task_interface()

# Décorateur pour feature flags
def feature_flagged(flag_name: str, fallback_function: Optional[Callable] = None):
    def decorator(func):
        @wraps(func)
        def wrapper(*args, **kwargs):
            user_id = get_current_user_id()
            context = {'user_id': user_id}
            
            if feature_flags.is_enabled(flag_name, context):
                return func(*args, **kwargs)
            elif fallback_function:
                return fallback_function(*args, **kwargs)
            else:
                # Comportement par défaut
                return func(*args, **kwargs)
        
        return wrapper
    return decorator

@feature_flagged('advanced_search', fallback_function=basic_search)
def advanced_task_search(query, filters):
    # Implémentation de recherche avancée
    return perform_advanced_search(query, filters)

def basic_search(query, filters):
    # Implémentation de recherche basique
    return perform_basic_search(query)
```

**Tests A/B avec feature flags**
```python
# ab_testing.py
from typing import Dict, List, Any
import statistics
from dataclasses import dataclass

@dataclass
class ABTestVariant:
    name: str
    flag_name: str
    weight: int  # Pour distribution (ex: 50 pour 50%)

@dataclass
class ABTestResult:
    test_name: str
    variant_a: str
    variant_b: str
    metric_name: str
    variant_a_value: float
    variant_b_value: float
    confidence_interval: float
    winner: Optional[str]
    sample_size_a: int
    sample_size_b: int

class ABTestingService:
    def __init__(self, feature_flags: FeatureFlagService):
        self.feature_flags = feature_flags
        self.tests: Dict[str, List[ABTestVariant]] = {}
    
    def create_ab_test(self, test_name: str, variants: List[ABTestVariant]):
        """Crée un test A/B"""
        total_weight = sum(v.weight for v in variants)
        if total_weight != 100:
            raise ValueError("Variant weights must sum to 100")
        
        self.tests[test_name] = variants
        
        # Créer les feature flags correspondants
        for variant in variants:
            self.feature_flags.create_flag(
                name=variant.flag_name,
                type=FeatureFlagType.PERCENTAGE,
                config={'percentage': variant.weight}
            )
    
    def get_variant_for_user(self, test_name: str, user_id: str) -> Optional[str]:
        """Détermine quelle variante montrer à l'utilisateur"""
        if test_name not in self.tests:
            return None
        
        variants = self.tests[test_name]
        
        # Utiliser l'user_id pour déterminer la variante de manière consistante
        hash_value = int(hashlib.md5(user_id.encode()).hexdigest(), 16)
        random_value = (hash_value % 100) / 100.0
        
        cumulative_weight = 0
        for variant in variants:
            cumulative_weight += variant.weight / 100.0
            if random_value <= cumulative_weight:
                return variant.name
        
        return variants[0].name  # Fallback
    
    def track_event(self, test_name: str, user_id: str, event_name: str, value: Any = None):
        """Enregistre un événement pour le test A/B"""
        variant = self.get_variant_for_user(test_name, user_id)
        
        # Stocker l'événement (en vrai, envoyer à un système d'analytics)
        print(f"A/B Test {test_name}: User {user_id} in variant {variant} triggered {event_name}")
        
        if value is not None:
            print(f"  Value: {value}")
    
    def analyze_test_results(self, test_name: str, metric_name: str, 
                           variant_a_data: List[float], variant_b_data: List[float]) -> ABTestResult:
        """Analyse les résultats d'un test A/B"""
        
        if test_name not in self.tests:
            raise ValueError(f"Test {test_name} not found")
        
        variants = self.tests[test_name]
        variant_a_name = variants[0].name
        variant_b_name = variants[1].name
        
        # Calculs statistiques simples
        mean_a = statistics.mean(variant_a_data)
        mean_b = statistics.mean(variant_b_data)
        
        # Test t simple (simplifié)
        std_a = statistics.stdev(variant_a_data) if len(variant_a_data) > 1 else 0
        std_b = statistics.stdev(variant_b_data) if len(variant_b_data) > 1 else 0
        
        # Intervalle de confiance simplifié
        confidence_interval = abs(mean_a - mean_b) / max(std_a, std_b, 0.001)
        
        winner = None
        if confidence_interval > 1.96:  # Seuil arbitraire pour 95% confidence
            winner = variant_a_name if mean_a > mean_b else variant_b_name
        
        return ABTestResult(
            test_name=test_name,
            variant_a=variant_a_name,
            variant_b=variant_b_name,
            metric_name=metric_name,
            variant_a_value=mean_a,
            variant_b_value=mean_b,
            confidence_interval=confidence_interval,
            winner=winner,
            sample_size_a=len(variant_a_data),
            sample_size_b=len(variant_b_data)
        )

# Exemple d'utilisation
def setup_task_ui_ab_test():
    """Configure un test A/B pour la nouvelle interface de tâches"""
    ab_service = ABTestingService(feature_flags)
    
    # Créer le test
    ab_service.create_ab_test(
        test_name="task_ui_redesign",
        variants=[
            ABTestVariant(name="old_ui", flag_name="old_task_ui", weight=50),
            ABTestVariant(name="new_ui", flag_name="new_task_ui", weight=50)
        ]
    )

# Dans l'application
@app.route('/dashboard')
def dashboard():
    user_id = get_current_user_id()
    
    # Déterminer la variante pour cet utilisateur
    variant = ab_service.get_variant_for_user("task_ui_redesign", user_id)
    
    # Tracker que l'utilisateur a vu le dashboard
    ab_service.track_event("task_ui_redesign", user_id, "dashboard_view")
    
    if variant == "new_ui":
        return render_new_dashboard()
    else:
        return render_old_dashboard()

@app.route('/task/complete', methods=['POST'])
def complete_task():
    user_id = get_current_user_id()
    
    # Traiter la complétion
    # ...
    
    # Tracker la conversion
    ab_service.track_event("task_ui_redesign", user_id, "task_completed", value=1)
    
    return jsonify({'success': True})
```

**Démonstration pratique (15 min)**
Implémentation de feature flags et tests A/B.

**Exercices guidés (10 min)**
1. Créer un système de feature flags
2. Implémenter un test A/B simple
3. Configurer un rollout progressif

**QCM d'auto-évaluation (3 min)**
1. Quel avantage des feature flags ?
2. Comment éviter les conflits dans les tests A/B ?
3. Quand utiliser un rollout à 100% ?

**Devoir**
Implémenter un système de feature flags et tests A/B pour l'application "Tâches".

---

## Cours 23 - Gestion d'erreurs
**Objectifs**
- Implémenter des patterns de resilience
- Gérer les erreurs de manière élégante
- Créer des stratégies de fallback

**Leçon (30 min - détaillée)**
Une bonne gestion d'erreurs améliore la robustesse et l'expérience utilisateur.

**Hiérarchie d'erreurs personnalisées**
```python
# error_hierarchy.py
from typing import Dict, Any, Optional
from dataclasses import dataclass
from enum import Enum

class ErrorCode(Enum):
    # Erreurs de validation
    VALIDATION_ERROR = ("VALIDATION_ERROR", 400)
    MISSING_REQUIRED_FIELD = ("MISSING_REQUIRED_FIELD", 400)
    INVALID_FORMAT = ("INVALID_FORMAT", 400)
    
    # Erreurs d'authentification
    UNAUTHORIZED = ("UNAUTHORIZED", 401)
    INVALID_CREDENTIALS = ("INVALID_CREDENTIALS", 401)
    TOKEN_EXPIRED = ("TOKEN_EXPIRED", 401)
    
    # Erreurs d'autorisation
    FORBIDDEN = ("FORBIDDEN", 403)
    INSUFFICIENT_PERMISSIONS = ("INSUFFICIENT_PERMISSIONS", 403)
    
    # Erreurs de ressources
    NOT_FOUND = ("NOT_FOUND", 404)
    RESOURCE_NOT_FOUND = ("RESOURCE_NOT_FOUND", 404)
    
    # Erreurs de conflit
    CONFLICT = ("CONFLICT", 409)
    RESOURCE_ALREADY_EXISTS = ("RESOURCE_ALREADY_EXISTS", 409)
    
    # Erreurs serveur
    INTERNAL_ERROR = ("INTERNAL_ERROR", 500)
    DATABASE_ERROR = ("DATABASE_ERROR", 500)
    EXTERNAL_SERVICE_ERROR = ("EXTERNAL_SERVICE_ERROR", 502)
    
    def __init__(self, code: str, http_status: int):
        self.code = code
        self.http_status = http_status

@dataclass
class AppError(Exception):
    """Classe de base pour toutes les erreurs applicatives"""
    code: ErrorCode
    message: str
    details: Optional[Dict[str, Any]] = None
    cause: Optional[Exception] = None
    
    def to_dict(self) -> Dict[str, Any]:
        """Convertit l'erreur en dictionnaire pour la réponse API"""
        result = {
            'error': {
                'code': self.code.code,
                'message': self.message
            }
        }
        
        if self.details:
            result['error']['details'] = self.details
        
        # En développement seulement
        if app.debug and self.cause:
            result['error']['cause'] = str(self.cause)
        
        return result
    
    def get_http_status(self) -> int:
        """Retourne le code HTTP approprié"""
        return self.code.http_status

# Erreurs spécialisées
@dataclass
class ValidationError(AppError):
    field: str
    
    def __init__(self, field: str, message: str, details: Optional[Dict[str, Any]] = None):
        super().__init__(
            code=ErrorCode.VALIDATION_ERROR,
            message=message,
            details={'field': field, **(details or {})}
        )
        self.field = field

@dataclass
class NotFoundError(AppError):
    resource_type: str
    resource_id: Any
    
    def __init__(self, resource_type: str, resource_id: Any):
        super().__init__(
            code=ErrorCode.RESOURCE_NOT_FOUND,
            message=f"{resource_type} with id '{resource_id}' not found",
            details={
                'resource_type': resource_type,
                'resource_id': str(resource_id)
            }
        )

@dataclass
class AuthenticationError(AppError):
    def __init__(self, message: str = "Authentication required"):
        super().__init__(
            code=ErrorCode.UNAUTHORIZED,
            message=message
        )

@dataclass
class AuthorizationError(AppError):
    required_permission: str
    
    def __init__(self, required_permission: str):
        super().__init__(
            code=ErrorCode.INSUFFICIENT_PERMISSIONS,
            message=f"Permission '{required_permission}' required",
            details={'required_permission': required_permission}
        )

@dataclass
class ExternalServiceError(AppError):
    service_name: str
    operation: str
    
    def __init__(self, service_name: str, operation: str, cause: Optional[Exception] = None):
        super().__init__(
            code=ErrorCode.EXTERNAL_SERVICE_ERROR,
            message=f"External service '{service_name}' failed for operation '{operation}'",
            details={
                'service_name': service_name,
                'operation': operation
            },
            cause=cause
        )

# Gestionnaire d'erreurs Flask
def register_error_handlers(app):
    @app.errorhandler(AppError)
    def handle_app_error(error):
        response = jsonify(error.to_dict())
        response.status_code = error.get_http_status()
        return response
    
    @app.errorhandler(404)
    def handle_not_found(error):
        app_error = NotFoundError("endpoint", request.path)
        response = jsonify(app_error.to_dict())
        response.status_code = 404
        return response
    
    @app.errorhandler(500)
    def handle_internal_error(error):
        # Log l'erreur complète
        app.logger.error(f"Internal error: {error}", exc_info=True)
        
        app_error = AppError(
            code=ErrorCode.INTERNAL_ERROR,
            message="An internal error occurred"
        )
        response = jsonify(app_error.to_dict())
        response.status_code = 500
        return response
    
    @app.errorhandler(Exception)
    def handle_unexpected_error(error):
        # Log l'erreur inattendue
        app.logger.error(f"Unexpected error: {error}", exc_info=True)
        
        app_error = AppError(
            code=ErrorCode.INTERNAL_ERROR,
            message="An unexpected error occurred"
        )
        response = jsonify(app_error.to_dict())
        response.status_code = 500
        return response
```

**Patterns de resilience**
```python
# resilience_patterns.py
import asyncio
from typing import Callable, Any, Optional, TypeVar, Union
import time
import random
import logging
from functools import wraps
from dataclasses import dataclass

logger = logging.getLogger(__name__)
T = TypeVar('T')

@dataclass
class RetryConfig:
    max_attempts: int = 3
    backoff_factor: float = 2.0
    initial_delay: float = 1.0
    max_delay: float = 60.0
    jitter: bool = True

@dataclass
class CircuitBreakerConfig:
    failure_threshold: int = 5
    recovery_timeout: float = 60.0
    expected_exception: tuple = (Exception,)

class CircuitBreakerState(Enum):
    CLOSED = "closed"
    OPEN = "open"
    HALF_OPEN = "half_open"

class CircuitBreaker:
    def __init__(self, config: CircuitBreakerConfig):
        self.config = config
        self.state = CircuitBreakerState.CLOSED
        self.failure_count = 0
        self.last_failure_time = None
    
    def _should_attempt_reset(self) -> bool:
        if self.state != CircuitBreakerState.OPEN:
            return True
        
        if self.last_failure_time is None:
            return True
        
        elapsed = time.time() - self.last_failure_time
        return elapsed >= self.config.recovery_timeout
    
    def _record_success(self):
        self.failure_count = 0
        self.state = CircuitBreakerState.CLOSED
    
    def _record_failure(self):
        self.failure_count += 1
        self.last_failure_time = time.time()
        
        if self.failure_count >= self.config.failure_threshold:
            self.state = CircuitBreakerState.OPEN
    
    async def call(self, func: Callable[..., T], *args, **kwargs) -> T:
        if not self._should_attempt_reset():
            raise Exception("Circuit breaker is OPEN")
        
        try:
            result = await func(*args, **kwargs)
            self._record_success()
            return result
        except self.config.expected_exception as e:
            self._record_failure()
            raise e

def retry_async(config: RetryConfig):
    def decorator(func: Callable[..., T]):
        @wraps(func)
        async def wrapper(*args, **kwargs) -> T:
            last_exception = None
            
            for attempt in range(config.max_attempts):
                try:
                    return await func(*args, **kwargs)
                except Exception as e:
                    last_exception = e
                    
                    if attempt < config.max_attempts - 1:
                        delay = min(
                            config.initial_delay * (config.backoff_factor ** attempt),
                            config.max_delay
                        )
                        
                        if config.jitter:
                            delay = delay * (0.5 + random.random() * 0.5)
                        
                        logger.warning(f"Attempt {attempt + 1} failed, retrying in {delay:.2f}s: {e}")
                        await asyncio.sleep(delay)
                    else:
                        logger.error(f"All {config.max_attempts} attempts failed")
            
            raise last_exception
        
        return wrapper
    return decorator

def circuit_breaker_async(config: CircuitBreakerConfig):
    breaker = CircuitBreaker(config)
    
    def decorator(func: Callable[..., T]):
        @wraps(func)
        async def wrapper(*args, **kwargs) -> T:
            return await breaker.call(func, *args, **kwargs)
        return wrapper
    return decorator

# Timeout decorator
def timeout_async(seconds: float):
    def decorator(func: Callable[..., T]):
        @wraps(func)
        async def wrapper(*args, **kwargs) -> T:
            try:
                return await asyncio.wait_for(func(*args, **kwargs), timeout=seconds)
            except asyncio.TimeoutError:
                raise Exception(f"Operation timed out after {seconds} seconds")
        return wrapper
    return decorator

# Fallback decorator
def fallback_async(fallback_func: Callable[..., T]):
    def decorator(func: Callable[..., T]):
        @wraps(func)
        async def wrapper(*args, **kwargs) -> T:
            try:
                return await func(*args, **kwargs)
            except Exception as e:
                logger.warning(f"Primary function failed, using fallback: {e}")
                return await fallback_func(*args, **kwargs)
        return wrapper
    return decorator

# Bulkhead pattern pour limiter la concurrence
class Bulkhead:
    def __init__(self, max_concurrent: int):
        self.max_concurrent = max_concurrent
        self.semaphore = asyncio.Semaphore(max_concurrent)
        self.current_requests = 0
    
    async def execute(self, func: Callable[..., T], *args, **kwargs) -> T:
        async with self.semaphore:
            self.current_requests += 1
            try:
                return await func(*args, **kwargs)
            finally:
                self.current_requests -= 1

# Utilisation dans l'application
circuit_breaker = CircuitBreaker(CircuitBreakerConfig())
bulkhead = Bulkhead(max_concurrent=10)

@retry_async(RetryConfig(max_attempts=3, initial_delay=1.0))
@circuit_breaker_async(CircuitBreakerConfig())
@timeout_async(30.0)
async def call_external_api(url: str) -> dict:
    """Appel à une API externe avec resilience"""
    async with aiohttp.ClientSession() as session:
        async with session.get(url) as response:
            return await response.json()

@fallback_async(fallback_cache_lookup)
async def get_user_data(user_id: str) -> dict:
    """Récupération de données utilisateur avec fallback"""
    return await call_external_api(f"https://api.example.com/users/{user_id}")

async def fallback_cache_lookup(user_id: str) -> dict:
    """Fallback vers le cache"""
    # Logique de récupération depuis le cache
    return {"id": user_id, "name": "Unknown", "from_cache": True}

# Service avec patterns de resilience
class ResilientTaskService:
    def __init__(self):
        self.bulkhead = Bulkhead(max_concurrent=5)
    
    @retry_async(RetryConfig(max_attempts=2))
    async def create_task_with_resilience(self, title: str, description: str) -> Task:
        """Création de tâche avec gestion d'erreurs"""
        try:
            # Utiliser le bulkhead pour limiter la concurrence
            return await self.bulkhead.execute(
                self._create_task_internal, title, description
            )
        except Exception as e:
            logger.error(f"Failed to create task: {e}")
            raise ExternalServiceError("task_creation", "database_save", e)
    
    async def _create_task_internal(self, title: str, description: str) -> Task:
        """Logique interne de création"""
        # Simulation d'opération qui peut échouer
        if random.random() < 0.1:  # 10% de chance d'échec
            raise Exception("Database connection failed")
        
        await asyncio.sleep(0.1)  # Simulation de latence
        
        return Task(
            id=generate_id(),
            title=title,
            description=description,
            created_at=datetime.now()
        )
```

**Gestion d'erreurs dans les APIs**
```python
# api_error_handling.py
from functools import wraps
from typing import Callable, Any, Dict, Optional
import traceback

def handle_api_errors(func: Callable[..., Any]):
    """Décorateur pour gérer les erreurs dans les endpoints API"""
    @wraps(func)
    def wrapper(*args, **kwargs):
        try:
            return func(*args, **kwargs)
        except ValidationError as e:
            return jsonify(e.to_dict()), e.get_http_status()
        except AuthenticationError as e:
            return jsonify(e.to_dict()), e.get_http_status()
        except AuthorizationError as e:
            return jsonify(e.to_dict()), e.get_http_status()
        except NotFoundError as e:
            return jsonify(e.to_dict()), e.get_http_status()
        except ExternalServiceError as e:
            # Log l'erreur externe
            app.logger.warning(f"External service error: {e.service_name} - {e.operation}")
            return jsonify(e.to_dict()), e.get_http_status()
        except Exception as e:
            # Erreur inattendue
            app.logger.error(f"Unexpected error in {func.__name__}: {e}", exc_info=True)
            
            error = AppError(
                code=ErrorCode.INTERNAL_ERROR,
                message="An unexpected error occurred",
                cause=e
            )
            return jsonify(error.to_dict()), error.get_http_status()
    
    return wrapper

# Validation avec schema
from marshmallow import Schema, fields, ValidationError as MarshmallowValidationError
from marshmallow import validates, validates_schema

class TaskCreateSchema(Schema):
    title = fields.Str(required=True, validate=lambda x: len(x.strip()) > 0)
    description = fields.Str(allow_none=True)
    priority = fields.Int(validate=lambda x: 1 <= x <= 5, default=1)
    
    @validates('title')
    def validate_title(self, value):
        if len(value.strip()) < 3:
            raise MarshmallowValidationError("Title must be at least 3 characters")
    
    @validates_schema
    def validate_complete_task(self, data, **kwargs):
        # Validation métier personnalisée
        if data.get('priority', 1) > 3 and not data.get('description'):
            raise MarshmallowValidationError(
                "High priority tasks must have a description"
            )

def validate_request_data(schema_class, data: Dict[str, Any]) -> Dict[str, Any]:
    """Valide les données de requête avec un schéma"""
    schema = schema_class()
    try:
        return schema.load(data)
    except MarshmallowValidationError as e:
        # Convertir en ValidationError de l'app
        if e.field_name:
            raise ValidationError(e.field_name, e.messages[0])
        else:
            raise ValidationError("data", str(e.messages))

# Endpoint avec gestion d'erreurs complète
@app.route('/api/tasks', methods=['POST'])
@handle_api_errors
def create_task():
    # Validation des données
    data = validate_request_data(TaskCreateSchema, request.get_json())
    
    # Vérification des permissions
    user = get_current_user()
    if not user.has_permission('create_tasks'):
        raise AuthorizationError('create_tasks')
    
    # Création avec resilience
    service = get_task_service()
    task = service.create_task_with_resilience(
        title=data['title'],
        description=data['description'],
        user_id=user.id
    )
    
    # Conversion pour la réponse
    response_data = {
        'id': task.id,
        'title': task.title,
        'description': task.description,
        'priority': task.priority,
        'created_at': task.created_at.isoformat()
    }
    
    return jsonify(response_data), 201

# Gestion d'erreurs asynchrones
@app.route('/api/tasks/async-operation', methods=['POST'])
@handle_api_errors
async def async_task_operation():
    """Endpoint avec opérations asynchrones"""
    try:
        # Opération asynchrone avec timeout
        result = await asyncio.wait_for(
            perform_async_operation(),
            timeout=30.0
        )
        return jsonify(result), 200
    except asyncio.TimeoutError:
        raise AppError(
            code=ErrorCode.INTERNAL_ERROR,
            message="Operation timed out"
        )

async def perform_async_operation():
    """Opération asynchrone simulée"""
    await asyncio.sleep(1)
    
    if random.random() < 0.1:  # 10% de chance d'échec
        raise ExternalServiceError("async_service", "data_processing")
    
    return {"status": "completed", "result": "success"}
```

**Démonstration pratique (15 min)**
Implémentation de gestion d'erreurs robuste avec patterns de resilience.

**Exercices guidés (10 min)**
1. Créer une hiérarchie d'erreurs personnalisées
2. Implémenter un circuit breaker
3. Ajouter la gestion d'erreurs à une API

**QCM d'auto-évaluation (3 min)**
1. Quel pattern pour gérer les timeouts ?
2. Quand utiliser un circuit breaker ?
3. Quelle différence entre retry et fallback ?

**Devoir**
Implémenter une gestion d'erreurs complète avec resilience pour l'application "Tâches".

---

## Cours 24 - Sécurité applicative
**Objectifs**
- Appliquer les principes OWASP
- Sécuriser les APIs REST
- Implémenter la protection contre les attaques courantes

**Leçon (30 min - détaillée)**
La sécurité doit être intégrée à toutes les couches de l'application.

**OWASP Top 10 et protections**
```python
# owasp_protections.py
import re
import hashlib
import hmac
import secrets
from typing import Dict, Any, Optional
import bleach
from flask_limiter import Limiter
from flask_limiter.util import get_remote_address

# 1. Injection - Prévention des injections SQL/NoSQL
class SQLInjectionProtection:
    @staticmethod
    def sanitize_input(value: str) -> str:
        """Nettoie les entrées pour prévenir les injections SQL"""
        if not isinstance(value, str):
            return str(value)
        
        # Supprimer les caractères dangereux
        dangerous_chars = ["'", '"', ';', '--', '/*', '*/']
        sanitized = value
        for char in dangerous_chars:
            sanitized = sanitized.replace(char, '')
        
        return sanitized
    
    @staticmethod
    def validate_query_structure(query: str, allowed_tables: list) -> bool:
        """Valide la structure d'une requête personnalisée"""
        # Vérifier que seules les tables autorisées sont utilisées
        for table in allowed_tables:
            if table.lower() in query.lower():
                return True
        return False

# 2. Broken Authentication - Gestion sécurisée de l'authentification
class SecureAuthentication:
    def __init__(self, secret_key: str):
        self.secret_key = secret_key
    
    def hash_password(self, password: str) -> str:
        """Hash sécurisé des mots de passe"""
        salt = secrets.token_hex(16)
        hashed = hashlib.pbkdf2_hmac(
            'sha256',
            password.encode('utf-8'),
            salt.encode('utf-8'),
            100000  # Nombre d'itérations
        )
        return f"{salt}:{hashed.hex()}"
    
    def verify_password(self, password: str, hashed_password: str) -> bool:
        """Vérification sécurisée des mots de passe"""
        try:
            salt, hash_value = hashed_password.split(':')
            computed_hash = hashlib.pbkdf2_hmac(
                'sha256',
                password.encode('utf-8'),
                salt.encode('utf-8'),
                100000
            )
            return hmac.compare_digest(computed_hash.hex(), hash_value)
        except:
            return False
    
    def generate_secure_token(self, user_id: str, expiration: int = 3600) -> str:
        """Génère un token sécurisé"""
        import jwt
        import datetime
        
        payload = {
            'user_id': user_id,
            'exp': datetime.datetime.utcnow() + datetime.timedelta(seconds=expiration),
            'iat': datetime.datetime.utcnow(),
            'jti': secrets.token_hex(16)  # JWT ID unique
        }
        
        return jwt.encode(payload, self.secret_key, algorithm='HS256')

# 3. Sensitive Data Exposure - Protection des données sensibles
class DataProtection:
    @staticmethod
    def mask_sensitive_data(data: Dict[str, Any], sensitive_fields: list) -> Dict[str, Any]:
        """Masque les données sensibles dans les logs/réponses"""
        protected_data = data.copy()
        
        for field in sensitive_fields:
            if field in protected_data:
                value = str(protected_data[field])
                if len(value) > 4:
                    protected_data[field] = f"{value[:2]}****{value[-2:]}"
                else:
                    protected_data[field] = "****"
        
        return protected_data
    
    @staticmethod
    def encrypt_sensitive_data(data: str, key: str) -> str:
        """Chiffre les données sensibles"""
        from cryptography.fernet import Fernet
        f = Fernet(key.encode())
        return f.encrypt(data.encode()).decode()
    
    @staticmethod
    def decrypt_sensitive_data(encrypted_data: str, key: str) -> str:
        """Déchiffre les données sensibles"""
        from cryptography.fernet import Fernet
        f = Fernet(key.encode())
        return f.decrypt(encrypted_data.encode()).decode()

# 4. XML External Entities (XXE) - Protection contre les entités externes
class XXEProtection:
    @staticmethod
    def safe_xml_parsing(xml_content: str) -> Any:
        """Parse XML en sécurité"""
        from defusedxml import ElementTree as ET
        
        # Utiliser defusedxml au lieu de xml.etree.ElementTree
        try:
            root = ET.fromstring(xml_content)
            return root
        except Exception as e:
            raise ValueError(f"Invalid XML: {e}")

# 5. Broken Access Control - Contrôle d'accès robuste
class AccessControl:
    def __init__(self):
        self.permissions = {
            'admin': ['read', 'write', 'delete', 'manage_users'],
            'manager': ['read', 'write', 'manage_team'],
            'user': ['read', 'write_own'],
            'guest': ['read_public']
        }
    
    def check_permission(self, user_role: str, required_permission: str, resource_owner: Optional[str] = None, user_id: Optional[str] = None) -> bool:
        """Vérifie les permissions avec contrôle d'accès"""
        if user_role not in self.permissions:
            return False
        
        user_permissions = self.permissions[user_role]
        
        # Vérifier la permission de base
        if required_permission not in user_permissions:
            return False
        
        # Contrôle d'accès basé sur la propriété
        if required_permission == 'write_own' and resource_owner != user_id:
            return False
        
        return True
    
    def enforce_resource_ownership(self, resource_id: str, user_id: str) -> bool:
        """Vérifie que l'utilisateur possède la ressource"""
        # Simulation - en vrai, vérifier en base
        return True  # Placeholder

# 6. Security Misconfiguration - Configuration sécurisée
class SecurityConfiguration:
    @staticmethod
    def get_secure_flask_config() -> Dict[str, Any]:
        """Configuration Flask sécurisée"""
        return {
            'SECRET_KEY': secrets.token_hex(32),
            'SESSION_COOKIE_SECURE': True,
            'SESSION_COOKIE_HTTPONLY': True,
            'SESSION_COOKIE_SAMESITE': 'Lax',
            'PERMANENT_SESSION_LIFETIME': 3600,  # 1 heure
            'MAX_CONTENT_LENGTH': 16 * 1024 * 1024,  # 16MB max
            'UPLOAD_FOLDER': '/tmp/secure_uploads',
            
            # Headers de sécurité
            'SECURITY_HEADERS': {
                'X-Content-Type-Options': 'nosniff',
                'X-Frame-Options': 'DENY',
                'X-XSS-Protection': '1; mode=block',
                'Strict-Transport-Security': 'max-age=31536000; includeSubDomains',
                'Content-Security-Policy': "default-src 'self'",
                'Referrer-Policy': 'strict-origin-when-cross-origin'
            }
        }
    
    @staticmethod
    def validate_cors_settings(cors_origins: list) -> list:
        """Valide les paramètres CORS"""
        allowed_origins = []
        for origin in cors_origins:
            if origin.startswith('https://') and not origin.endswith('.local'):
                allowed_origins.append(origin)
        return allowed_origins

# 7. Cross-Site Scripting (XSS) - Protection XSS
class XSSProtection:
    @staticmethod
    def sanitize_html(content: str) -> str:
        """Nettoie le HTML pour prévenir XSS"""
        allowed_tags = ['p', 'br', 'strong', 'em', 'u', 'h1', 'h2', 'h3']
        allowed_attributes = {}
        
        return bleach.clean(content, tags=allowed_tags, attributes=allowed_attributes)
    
    @staticmethod
    def escape_javascript_string(value: str) -> str:
        """Échappe les chaînes JavaScript"""
        return value.replace('\\', '\\\\').replace('"', '\\"').replace("'", "\\'")

# 8. Insecure Deserialization - Désérialisation sécurisée
class SafeDeserialization:
    @staticmethod
    def safe_json_loads(json_str: str) -> Any:
        """Désérialisation JSON sécurisée"""
        import json
        
        # Limiter la taille
        if len(json_str) > 10 * 1024 * 1024:  # 10MB max
            raise ValueError("JSON payload too large")
        
        try:
            return json.loads(json_str, parse_float=lambda x: float(x) if abs(float(x)) < 1e10 else 0)
        except json.JSONDecodeError as e:
            raise ValueError(f"Invalid JSON: {e}")
    
    @staticmethod
    def safe_pickle_load(data: bytes) -> Any:
        """Désérialisation pickle sécurisée (déconseillé, utiliser JSON)"""
        # NE PAS UTILISER pickle pour les données non fiables
        # Utiliser json ou un format structuré
        raise NotImplementedError("Pickle deserialization is not safe")

# 9. Vulnerable Components - Gestion des dépendances
class DependencySecurity:
    @staticmethod
    def check_vulnerabilities() -> list:
        """Vérifie les vulnérabilités dans les dépendances"""
        import subprocess
        
        try:
            result = subprocess.run(
                ['safety', 'check', '--json'],
                capture_output=True,
                text=True,
                timeout=30
            )
            
            if result.returncode == 0:
                return []
            else:
                # Parser les vulnérabilités
                return result.stdout.split('\n')
        except:
            return ["Unable to check vulnerabilities"]

# 10. Insufficient Logging & Monitoring - Logging sécurisé
class SecureLogging:
    def __init__(self):
        self.sensitive_fields = ['password', 'token', 'secret', 'key', 'ssn']
    
    def log_safe(self, message: str, extra_data: Optional[Dict[str, Any]] = None, level: str = 'info'):
        """Log en masquant les données sensibles"""
        safe_data = {}
        if extra_data:
            for key, value in extra_data.items():
                if any(sensitive in key.lower() for sensitive in self.sensitive_fields):
                    safe_data[key] = "***MASKED***"
                else:
                    safe_data[key] = value
        
        if level == 'error':
            app.logger.error(message, extra=safe_data)
        elif level == 'warning':
            app.logger.warning(message, extra=safe_data)
        else:
            app.logger.info(message, extra=safe_data)
```

**Rate limiting et protection DDoS**
```python
# rate_limiting.py
from flask_limiter import Limiter
from flask_limiter.util import get_remote_address
from redis import Redis
import time

# Configuration du rate limiting
limiter = Limiter(
    app=app,
    key_func=get_remote_address,
    storage_uri="redis://localhost:6379",
    storage_options={"socket_connect_timeout": 30},
    strategy="fixed-window"  # ou "moving-window"
)

# Limites par endpoint
@app.route('/api/auth/login', methods=['POST'])
@limiter.limit("5 per minute")
def login():
    # Logique de connexion
    pass

@app.route('/api/tasks', methods=['GET'])
@limiter.limit("100 per minute")
def get_tasks():
    # Récupération des tâches
    pass

@app.route('/api/tasks', methods=['POST'])
@limiter.limit("10 per minute")
def create_task():
    # Création de tâche
    pass

# Limites dynamiques basées sur l'utilisateur
def get_user_limit():
    """Limite basée sur le rôle de l'utilisateur"""
    user = get_current_user()
    if user and user.role == 'premium':
        return "1000 per hour"
    else:
        return "100 per hour"

@app.route('/api/advanced-feature')
@limiter.limit(get_user_limit)
def advanced_feature():
    pass

# Protection contre les attaques par déni de service
class DOSProtection:
    def __init__(self, redis_client: Redis):
        self.redis = redis_client
        self.block_duration = 3600  # 1 heure
    
    def is_blocked(self, ip: str) -> bool:
        """Vérifie si une IP est bloquée"""
        key = f"blocked:{ip}"
        return self.redis.exists(key)
    
    def record_request(self, ip: str, endpoint: str):
        """Enregistre une requête pour analyse"""
        # Compteur de requêtes par IP
        ip_key = f"requests:{ip}"
        self.redis.incr(ip_key)
        self.redis.expire(ip_key, 60)  # Expire en 1 minute
        
        # Compteur par endpoint
        endpoint_key = f"endpoint:{endpoint}"
        self.redis.incr(endpoint_key)
        self.redis.expire(endpoint_key, 60)
    
    def check_suspicious_activity(self, ip: str) -> bool:
        """Détecte une activité suspecte"""
        ip_key = f"requests:{ip}"
        request_count = int(self.redis.get(ip_key) or 0)
        
        if request_count > 100:  # Plus de 100 requêtes/minute
            self.block_ip(ip)
            return True
        
        return False
    
    def block_ip(self, ip: str):
        """Bloque une IP"""
        key = f"blocked:{ip}"
        self.redis.setex(key, self.block_duration, "1")
        app.logger.warning(f"IP blocked due to suspicious activity: {ip}")

# Middleware de protection
@app.before_request
def dos_protection():
    ip = get_remote_address()
    dos_protector = get_dos_protector()
    
    if dos_protector.is_blocked(ip):
        abort(429)  # Too Many Requests
    
    dos_protector.record_request(ip, request.endpoint)
    
    if dos_protector.check_suspicious_activity(ip):
        abort(429)

# Validation d'entrée robuste
from webargs import fields, validate
from webargs.flaskparser import FlaskParser
from marshmallow import Schema, ValidationError

class TaskCreateSchema(Schema):
    title = fields.Str(required=True, validate=[
        validate.Length(min=1, max=200),
        validate.Regexp(r'^[a-zA-Z0-9\s\-_\.]+$', error="Title contains invalid characters")
    ])
    description = fields.Str(validate=validate.Length(max=1000))
    priority = fields.Int(validate=validate.Range(min=1, max=5), default=1)
    
    class Meta:
        unknown = validate.EXCLUDE  # Ignorer les champs inconnus

parser = FlaskParser()

@app.route('/api/tasks', methods=['POST'])
def create_task_secure():
    try:
        args = parser.parse(TaskCreateSchema(), request)
        
        # Validation métier supplémentaire
        if args['priority'] > 3 and not args.get('description'):
            return jsonify({'error': 'High priority tasks require description'}), 400
        
        # Création de la tâche
        task = create_task_logic(args)
        return jsonify(task), 201
        
    except ValidationError as err:
        return jsonify({'error': 'Validation failed', 'details': err.messages}), 400
```

**Démonstration pratique (15 min)**
Implémentation des protections OWASP dans une API Flask.

**Exercices guidés (10 min)**
1. Implémenter la protection contre les injections SQL
2. Configurer le rate limiting
3. Ajouter la validation d'entrée sécurisée

**QCM d'auto-évaluation (3 min)**
1. Quel OWASP Top 10 pour l'authentification ?
2. Comment prévenir XSS ?
3. Pourquoi utiliser des tokens JWT sécurisés ?

**Devoir**
Sécuriser complètement l'application "Tâches" selon les principes OWASP.

---

## Cours 25 - Performance monitoring
**Objectifs**
- Implémenter l'APM (Application Performance Monitoring)
- Tracer les requêtes distribuées
- Optimiser les performances en production

**Leçon (30 min - détaillée)**
L'APM permet d'identifier et résoudre les problèmes de performance en temps réel.

**APM avec OpenTelemetry**
```python
# apm_setup.py
from opentelemetry import trace
from opentelemetry.sdk.trace import TracerProvider
from opentelemetry.sdk.trace.export import BatchSpanProcessor
from opentelemetry.exporter.jaeger import JaegerExporter
from opentelemetry.instrumentation.flask import FlaskInstrumentor
from opentelemetry.instrumentation.sqlalchemy import SQLAlchemyInstrumentor
from opentelemetry.instrumentation.redis import RedisInstrumentor
import time

# Configuration OpenTelemetry
def setup_opentelemetry():
    # Tracer provider
    trace.set_tracer_provider(TracerProvider())
    
    # Jaeger exporter
    jaeger_exporter = JaegerExporter(
        agent_host_name="localhost",
        agent_port=6831,
    )
    
    # Span processor
    span_processor = BatchSpanProcessor(jaeger_exporter)
    trace.get_tracer_provider().add_span_processor(span_processor)
    
    # Instrumentation automatique
    FlaskInstrumentor().instrument_app(app)
    SQLAlchemyInstrumentor().instrument(engine=db.engine)
    RedisInstrumentor().instrument()

# Métriques personnalisées
from opentelemetry import metrics
from opentelemetry.sdk.metrics import MeterProvider
from opentelemetry.sdk.metrics.export import PeriodicExportingMetricReader
from opentelemetry.exporter.prometheus import PrometheusMetricReader

def setup_metrics():
    # Configuration des métriques
    reader = PrometheusMetricReader()
    meter_provider = MeterProvider(metric_readers=[reader])
    metrics.set_meter_provider(meter_provider)
    
    # Meter pour les métriques personnalisées
    meter = metrics.get_meter("task-app")
    
    # Compteurs
    task_created_counter = meter.create_counter(
        "tasks_created_total",
        description="Total number of tasks created"
    )
    
    # Histogrammes
    request_duration = meter.create_histogram(
        "http_request_duration_seconds",
        description="HTTP request duration"
    )
    
    return meter, task_created_counter, request_duration

# Utilisation dans l'application
meter, task_created_counter, request_duration = setup_metrics()

@app.route('/api/tasks', methods=['POST'])
def create_task_with_tracing():
    start_time = time.time()
    
    # Créer un span personnalisé
    tracer = trace.get_tracer(__name__)
    with tracer.start_as_current_span("create_task") as span:
        # Ajouter des attributs au span
        span.set_attribute("task.title", request.json.get('title', ''))
        span.set_attribute("user.id", get_current_user_id())
        
        # Logique métier avec sous-spans
        with tracer.start_as_current_span("validate_input") as child_span:
            # Validation
            child_span.set_attribute("validation.result", "success")
        
        with tracer.start_as_current_span("save_to_database") as child_span:
            # Sauvegarde
            task = create_task_logic(request.json)
            child_span.set_attribute("task.id", task.id)
        
        # Enregistrer la métrique
        task_created_counter.add(1, {"priority": str(task.priority)})
        
        # Mesurer la durée
        duration = time.time() - start_time
        request_duration.record(duration, {"method": "POST", "endpoint": "/api/tasks"})
        
        return jsonify(task), 201

# Middleware de tracing personnalisé
@app.before_request
def start_request_span():
    tracer = trace.get_tracer(__name__)
    span = tracer.start_span("http_request")
    span.set_attribute("http.method", request.method)
    span.set_attribute("http.url", request.url)
    span.set_attribute("http.user_agent", request.headers.get('User-Agent', ''))
    
    # Stocker le span dans le contexte Flask
    g.request_span = span

@app.after_request
def end_request_span(response):
    if hasattr(g, 'request_span'):
        span = g.request_span
        span.set_attribute("http.status_code", response.status_code)
        span.end()
    
    return response

# Tracing des erreurs
@app.errorhandler(Exception)
def handle_error_with_tracing(error):
    tracer = trace.get_tracer(__name__)
    with tracer.start_as_current_span("error_handler") as span:
        span.set_attribute("error.type", type(error).__name__)
        span.set_attribute("error.message", str(error))
        span.set_status(trace.Status(trace.StatusCode.ERROR, str(error)))
        
        # Log de l'erreur avec le span context
        app.logger.error(f"Unhandled error: {error}", exc_info=True)
    
    # Gestion d'erreur normale
    return handle_error(error)
```

**Profiling en production**
```python
# production_profiling.py
import cProfile
import pstats
import io
import threading
import time
from functools import wraps

class ProductionProfiler:
    def __init__(self, sample_rate=0.01):  # 1% des requêtes
        self.sample_rate = sample_rate
        self.profiles = {}
        self.lock = threading.Lock()
        self.max_profiles = 50
    
    def should_profile(self, request):
        """Détermine si cette requête doit être profilée"""
        import random
        
        # Profiler seulement certains endpoints
        if request.endpoint in ['static', 'health']:
            return False
        
        return random.random() < self.sample_rate
    
    def profile_request(self, f):
        @wraps(f)
        def wrapper(*args, **kwargs):
            if not self.should_profile(request):
                return f(*args, **kwargs)
            
            profiler = cProfile.Profile()
            profiler.enable()
            
            try:
                result = f(*args, **kwargs)
                return result
            finally:
                profiler.disable()
                
                # Stocker le profil
                profile_id = f"{request.endpoint}_{int(time.time())}"
                with self.lock:
                    self.profiles[profile_id] = profiler
                    
                    # Limiter le nombre de profils stockés
                    if len(self.profiles) > self.max_profiles:
                        oldest = min(self.profiles.keys())
                        del self.profiles[oldest]
        
        return wrapper
    
    def get_profile_stats(self, profile_id):
        """Récupère les statistiques d'un profil"""
        profiler = self.profiles.get(profile_id)
        if not profiler:
            return None
        
        s = io.StringIO()
        ps = pstats.Stats(profiler, stream=s).sort_stats('cumulative')
        ps.print_stats(20)
        
        return s.getvalue()
    
    def get_hotspots(self):
        """Identifie les hotspots de performance"""
        hotspots = {}
        
        for profile_id, profiler in self.profiles.items():
            stats = pstats.Stats(profiler)
            
            # Extraire les fonctions les plus lentes
            for func, (cc, nc, tt, ct, callers) in list(stats.stats.items())[:10]:
                func_name = str(func)
                if func_name not in hotspots:
                    hotspots[func_name] = {'count': 0, 'total_time': 0}
                
                hotspots[func_name]['count'] += 1
                hotspots[func_name]['total_time'] += ct
        
        # Trier par temps total
        sorted_hotspots = sorted(
            hotspots.items(),
            key=lambda x: x[1]['total_time'],
            reverse=True
        )
        
        return sorted_hotspots[:10]

# Intégration Flask
profiler = ProductionProfiler()

@app.route('/api/tasks')
@profiler.profile_request
def get_tasks_profiled():
    # Logique normale
    pass

# Endpoint pour consulter les profils
@app.route('/debug/profiles')
def view_profiles():
    if not app.debug:
        return jsonify({'error': 'Debug only'}), 403
    
    hotspots = profiler.get_hotspots()
    return jsonify({
        'hotspots': hotspots,
        'profile_count': len(profiler.profiles)
    })

@app.route('/debug/profile/<profile_id>')
def view_profile(profile_id):
    if not app.debug:
        return jsonify({'error': 'Debug only'}), 403
    
    stats = profiler.get_profile_stats(profile_id)
    if not stats:
        return jsonify({'error': 'Profile not found'}), 404
    
    return Response(stats, mimetype='text/plain')
```

**Monitoring des ressources système**
```python
# system_monitoring.py
import psutil
import time
from threading import Thread
import GPUtil

class SystemMonitor:
    def __init__(self, interval=60):
        self.interval = interval
        self.running = False
        self.thread = None
        self.metrics = {
            'cpu_percent': [],
            'memory_percent': [],
            'disk_usage': [],
            'network_io': []
        }
    
    def start(self):
        """Démarre le monitoring en arrière-plan"""
        self.running = True
        self.thread = Thread(target=self._monitor_loop, daemon=True)
        self.thread.start()
    
    def stop(self):
        """Arrête le monitoring"""
        self.running = False
        if self.thread:
            self.thread.join(timeout=5)
    
    def _monitor_loop(self):
        """Boucle de monitoring"""
        while self.running:
            self._collect_metrics()
            time.sleep(self.interval)
    
    def _collect_metrics(self):
        """Collecte les métriques système"""
        # CPU
        cpu_percent = psutil.cpu_percent(interval=1)
        self.metrics['cpu_percent'].append((time.time(), cpu_percent))
        
        # Mémoire
        memory = psutil.virtual_memory()
        self.metrics['memory_percent'].append((time.time(), memory.percent))
        
        # Disque
        disk = psutil.disk_usage('/')
        self.metrics['disk_usage'].append((time.time(), disk.percent))
        
        # Réseau
        net = psutil.net_io_counters()
        self.metrics['network_io'].append((time.time(), {
            'bytes_sent': net.bytes_sent,
            'bytes_recv': net.bytes_recv
        }))
        
        # GPU (si disponible)
        try:
            gpus = GPUtil.getGPUs()
            if gpus:
                gpu = gpus[0]
                self.metrics.setdefault('gpu_usage', []).append((time.time(), gpu.load * 100))
        except:
            pass
        
        # Limiter l'historique (garder seulement les 1000 dernières mesures)
        for metric_name in self.metrics:
            if len(self.metrics[metric_name]) > 1000:
                self.metrics[metric_name] = self.metrics[metric_name][-1000:]
    
    def get_current_metrics(self):
        """Retourne les métriques actuelles"""
        return {
            'cpu_percent': psutil.cpu_percent(),
            'memory_percent': psutil.virtual_memory().percent,
            'disk_usage': psutil.disk_usage('/').percent,
            'network_io': psutil.net_io_counters()._asdict()
        }
    
    def get_metrics_history(self, metric_name, hours=1):
        """Retourne l'historique d'une métrique"""
        if metric_name not in self.metrics:
            return []
        
        cutoff_time = time.time() - (hours * 3600)
        return [point for point in self.metrics[metric_name] if point[0] >= cutoff_time]
    
    def detect_anomalies(self):
        """Détecte les anomalies dans les métriques"""
        anomalies = []
        
        # CPU élevé
        current_cpu = psutil.cpu_percent()
        if current_cpu > 90:
            anomalies.append({
                'type': 'high_cpu',
                'value': current_cpu,
                'threshold': 90
            })
        
        # Mémoire faible
        memory = psutil.virtual_memory()
        if memory.available < 100 * 1024 * 1024:  # Moins de 100MB
            anomalies.append({
                'type': 'low_memory',
                'value': memory.available,
                'threshold': 100 * 1024 * 1024
            })
        
        # Disque plein
        disk = psutil.disk_usage('/')
        if disk.percent > 95:
            anomalies.append({
                'type': 'disk_full',
                'value': disk.percent,
                'threshold': 95
            })
        
        return anomalies

# Intégration avec Prometheus
from prometheus_client import Gauge

class PrometheusSystemMonitor(SystemMonitor):
    def __init__(self):
        super().__init__()
        
        # Métriques Prometheus
        self.cpu_gauge = Gauge('system_cpu_percent', 'CPU usage percentage')
        self.memory_gauge = Gauge('system_memory_percent', 'Memory usage percentage')
        self.disk_gauge = Gauge('system_disk_percent', 'Disk usage percentage')
    
    def _collect_metrics(self):
        super()._collect_metrics()
        
        # Mettre à jour les métriques Prometheus
        current = self.get_current_metrics()
        self.cpu_gauge.set(current['cpu_percent'])
        self.memory_gauge.set(current['memory_percent'])
        self.disk_gauge.set(current['disk_usage'])

# Démarrage du monitoring
system_monitor = PrometheusSystemMonitor()
system_monitor.start()

# Endpoint de health check avec métriques système
@app.route('/health')
def health_check():
    anomalies = system_monitor.detect_anomalies()
    
    health_data = {
        'status': 'healthy' if not anomalies else 'unhealthy',
        'timestamp': time.time(),
        'system': system_monitor.get_current_metrics(),
        'anomalies': anomalies
    }
    
    status_code = 200 if not anomalies else 503
    return jsonify(health_data), status_code
```

**Optimisation basée sur les métriques**
```python
# performance_optimizer.py
from typing import Dict, List, Any
import time

class PerformanceOptimizer:
    def __init__(self, system_monitor: SystemMonitor):
        self.system_monitor = system_monitor
        self.optimization_suggestions = []
    
    def analyze_performance(self) -> List[Dict[str, Any]]:
        """Analyse les performances et suggère des optimisations"""
        suggestions = []
        current_metrics = self.system_monitor.get_current_metrics()
        
        # Analyse CPU
        if current_metrics['cpu_percent'] > 80:
            suggestions.append({
                'type': 'cpu_optimization',
                'severity': 'high',
                'title': 'High CPU Usage',
                'description': f'CPU usage is {current_metrics["cpu_percent"]}%',
                'suggestions': [
                    'Consider adding more CPU cores',
                    'Optimize database queries',
                    'Implement caching for expensive operations',
                    'Use async processing for I/O operations'
                ]
            })
        
        # Analyse mémoire
        if current_metrics['memory_percent'] > 85:
            suggestions.append({
                'type': 'memory_optimization',
                'severity': 'high',
                'title': 'High Memory Usage',
                'description': f'Memory usage is {current_metrics["memory_percent"]}%',
                'suggestions': [
                    'Check for memory leaks',
                    'Implement pagination for large datasets',
                    'Use streaming for large file processing',
                    'Optimize data structures'
                ]
            })
        
        # Analyse disque
        if current_metrics['disk_usage'] > 90:
            suggestions.append({
                'type': 'disk_optimization',
                'severity': 'critical',
                'title': 'Low Disk Space',
                'description': f'Disk usage is {current_metrics["disk_usage"]}%',
                'suggestions': [
                    'Clean up old log files',
                    'Implement log rotation',
                    'Move large files to external storage',
                    'Add more disk space'
                ]
            })
        
        # Analyse réseau
        network_io = current_metrics['network_io']
        if network_io['bytes_sent'] > 100 * 1024 * 1024:  # 100MB
            suggestions.append({
                'type': 'network_optimization',
                'severity': 'medium',
                'title': 'High Network Usage',
                'description': 'High network traffic detected',
                'suggestions': [
                    'Implement compression for API responses',
                    'Use CDN for static assets',
                    'Optimize database connection pooling',
                    'Implement caching to reduce API calls'
                ]
            })
        
        return suggestions
    
    def get_optimization_plan(self) -> Dict[str, Any]:
        """Génère un plan d'optimisation complet"""
        suggestions = self.analyze_performance()
        
        # Prioriser les suggestions
        priority_order = {'critical': 0, 'high': 1, 'medium': 2, 'low': 3}
        suggestions.sort(key=lambda x: priority_order.get(x['severity'], 4))
        
        # Estimer l'effort et l'impact
        for suggestion in suggestions:
            suggestion['estimated_effort'] = self._estimate_effort(suggestion['type'])
            suggestion['expected_impact'] = self._estimate_impact(suggestion['severity'])
        
        return {
            'timestamp': time.time(),
            'total_suggestions': len(suggestions),
            'critical_count': len([s for s in suggestions if s['severity'] == 'critical']),
            'high_count': len([s for s in suggestions if s['severity'] == 'high']),
            'suggestions': suggestions,
            'implementation_priority': ['critical', 'high', 'medium', 'low']
        }
    
    def _estimate_effort(self, suggestion_type: str) -> str:
        """Estime l'effort pour une optimisation"""
        effort_map = {
            'cpu_optimization': 'high',
            'memory_optimization': 'medium',
            'disk_optimization': 'low',
            'network_optimization': 'medium'
        }
        return effort_map.get(suggestion_type, 'unknown')
    
    def _estimate_impact(self, severity: str) -> str:
        """Estime l'impact d'une optimisation"""
        impact_map = {
            'critical': 'high',
            'high': 'high',
            'medium': 'medium',
            'low': 'low'
        }
        return impact_map.get(severity, 'unknown')

# Endpoint d'optimisation
@app.route('/admin/performance-analysis')
def performance_analysis():
    if not current_user.is_admin():
        return jsonify({'error': 'Admin access required'}), 403
    
    optimizer = PerformanceOptimizer(system_monitor)
    analysis = optimizer.get_optimization_plan()
    
    return jsonify(analysis)

# Optimisations automatiques
class AutoOptimizer:
    def __init__(self, optimizer: PerformanceOptimizer):
        self.optimizer = optimizer
        self.last_optimization = 0
        self.optimization_interval = 3600  # 1 heure
    
    def run_auto_optimization(self):
        """Exécute les optimisations automatiques si nécessaire"""
        current_time = time.time()
        
        if current_time - self.last_optimization < self.optimization_interval:
            return
        
        self.last_optimization = current_time
        
        # Analyser les performances
        suggestions = self.optimizer.analyze_performance()
        
        # Appliquer les optimisations automatiques sûres
        for suggestion in suggestions:
            if suggestion['severity'] == 'critical':
                self._apply_critical_optimization(suggestion)
    
    def _apply_critical_optimization(self, suggestion):
        """Applique une optimisation critique"""
        if suggestion['type'] == 'disk_optimization':
            # Nettoyer automatiquement les logs anciens
            self._cleanup_old_logs()
        elif suggestion['type'] == 'memory_optimization':
            # Forcer le garbage collection
            import gc
            gc.collect()
    
    def _cleanup_old_logs(self):
        """Nettoie les anciens fichiers de log"""
        import os
        import glob
        
        log_files = glob.glob('logs/*.log.*')
        for log_file in log_files:
            if os.path.getsize(log_file) > 100 * 1024 * 1024:  # 100MB
                try:
                    os.remove(log_file)
                    app.logger.info(f'Cleaned up old log file: {log_file}')
                except:
                    pass

# Démarrage de l'optimisation automatique
auto_optimizer = AutoOptimizer(PerformanceOptimizer(system_monitor))

# Vérification périodique (dans un thread séparé)
def optimization_worker():
    while True:
        auto_optimizer.run_auto_optimization()
        time.sleep(300)  # Vérifier toutes les 5 minutes

optimization_thread = Thread(target=optimization_worker, daemon=True)
optimization_thread.start()
```

**Démonstration pratique (15 min)**
Configuration d'APM complet avec OpenTelemetry et optimisation automatique.

**Exercices guidés (10 min)**
1. Configurer OpenTelemetry pour tracer les requêtes
2. Implémenter le monitoring système
3. Créer des métriques de performance personnalisées

**QCM d'auto-évaluation (3 min)**
1. Quel outil pour l'APM distribué ?
2. Quelle différence entre tracing et metrics ?
3. Quand utiliser le profiling en production ?

**Devoir**
Implémenter un système complet d'APM et d'optimisation des performances.

---

## Cours 26 - Scalabilité horizontale
**Objectifs**
- Comprendre l'architecture microservices
- Implémenter la communication inter-services
- Gérer la découverte de services et le load balancing

**Leçon (30 min - détaillée)**
La scalabilité horizontale permet de gérer la croissance en ajoutant des instances.

**Architecture microservices**
```python
# microservices_architecture.py
from typing import Dict, List, Optional, Any
from abc import ABC, abstractmethod
import asyncio
import aiohttp
from dataclasses import dataclass

@dataclass
class ServiceInstance:
    id: str
    name: str
    host: str
    port: int
    health_check_url: str
    metadata: Dict[str, Any]
    last_heartbeat: float
    
    @property
    def url(self) -> str:
        return f"http://{self.host}:{self.port}"
    
    def is_healthy(self) -> bool:
        # Simulation - en vrai, vérifier le health check
        import time
        return time.time() - self.last_heartbeat < 30

class ServiceRegistry:
    """Registre de services pour la découverte"""
    
    def __init__(self):
        self.services: Dict[str, List[ServiceInstance]] = {}
    
    def register_service(self, instance: ServiceInstance):
        """Enregistre une instance de service"""
        if instance.name not in self.services:
            self.services[instance.name] = []
        
        # Éviter les doublons
        existing = next((i for i in self.services[instance.name] 
                        if i.id == instance.id), None)
        if existing:
            existing.last_heartbeat = instance.last_heartbeat
            existing.metadata = instance.metadata
        else:
            self.services[instance.name].append(instance)
    
    def deregister_service(self, service_name: str, instance_id: str):
        """Désenregistre une instance de service"""
        if service_name in self.services:
            self.services[service_name] = [
                i for i in self.services[service_name] if i.id != instance_id
            ]
    
    def get_service_instances(self, service_name: str) -> List[ServiceInstance]:
        """Récupère les instances saines d'un service"""
        if service_name not in self.services:
            return []
        
        return [i for i in self.services[service_name] if i.is_healthy()]
    
    def get_service_url(self, service_name: str) -> Optional[str]:
        """Récupère l'URL d'une instance de service (round-robin)"""
        instances = self.get_service_instances(service_name)
        if not instances:
            return None
        
        # Round-robin simple
        import random
        instance = random.choice(instances)
        return instance.url

# Registre global
service_registry = ServiceRegistry()

class ServiceClient:
    """Client pour communiquer avec les microservices"""
    
    def __init__(self, service_name: str, timeout: float = 5.0):
        self.service_name = service_name
        self.timeout = timeout
        self.session: Optional[aiohttp.ClientSession] = None
    
    async def __aenter__(self):
        self.session = aiohttp.ClientSession(timeout=aiohttp.ClientTimeout(total=self.timeout))
        return self
    
    async def __aexit__(self, exc_type, exc_val, exc_tb):
        if self.session:
            await self.session.close()
    
    async def call_service(self, endpoint: str, method: str = 'GET', 
                          data: Optional[Dict] = None, headers: Optional[Dict] = None) -> Dict:
        """Appelle un endpoint d'un microservice"""
        if not self.session:
            raise RuntimeError("Client not opened with async context manager")
        
        service_url = service_registry.get_service_url(self.service_name)
        if not service_url:
            raise RuntimeError(f"Service {self.service_name} not available")
        
        url = f"{service_url}{endpoint}"
        
        try:
            if method.upper() == 'GET':
                async with self.session.get(url, headers=headers) as response:
                    return await self._handle_response(response)
            elif method.upper() == 'POST':
                async with self.session.post(url, json=data, headers=headers) as response:
                    return await self._handle_response(response)
            elif method.upper() == 'PUT':
                async with self.session.put(url, json=data, headers=headers) as response:
                    return await self._handle_response(response)
            elif method.upper() == 'DELETE':
                async with self.session.delete(url, headers=headers) as response:
                    return await self._handle_response(response)
            else:
                raise ValueError(f"Unsupported HTTP method: {method}")
                
        except aiohttp.ClientError as e:
            raise RuntimeError(f"Service call failed: {e}")
    
    async def _handle_response(self, response: aiohttp.ClientResponse) -> Dict:
        """Gère la réponse HTTP"""
        if response.status >= 400:
            error_text = await response.text()
            raise RuntimeError(f"Service error {response.status}: {error_text}")
        
        return await response.json()

# Exemple d'utilisation
async def create_task_with_microservices():
    """Crée une tâche en utilisant des microservices"""
    
    async with ServiceClient('task-service') as task_client:
        # Créer la tâche
        task_data = await task_client.call_service(
            '/tasks',
            method='POST',
            data={
                'title': 'Microservice Task',
                'description': 'Created via microservices'
            }
        )
        
        # Notifier le service de notifications
        async with ServiceClient('notification-service') as notif_client:
            await notif_client.call_service(
                '/notifications',
                method='POST',
                data={
                    'type': 'task_created',
                    'task_id': task_data['id'],
                    'message': f'Task "{task_data["title"]}" has been created'
                }
            )
        
        return task_data

# Service de tâches en tant que microservice
from flask import Flask, request, jsonify

task_app = Flask('task-service')

@task_app.route('/health')
def health():
    return jsonify({'status': 'healthy'})

@task_app.route('/tasks', methods=['POST'])
def create_task():
    data = request.get_json()
    
    # Logique de création de tâche
    task = {
        'id': generate_id(),
        'title': data['title'],
        'description': data.get('description'),
        'status': 'pending',
        'created_at': datetime.now().isoformat()
    }
    
    # Enregistrer dans la base de données
    # ...
    
    return jsonify(task), 201

@task_app.route('/tasks/<task_id>')
def get_task(task_id):
    # Récupérer la tâche
    # ...
    return jsonify({'id': task_id, 'title': 'Sample Task'})

# Enregistrement du service
def register_task_service():
    """Enregistre le service de tâches dans le registre"""
    import socket
    import time
    
    hostname = socket.gethostname()
    instance = ServiceInstance(
        id=f"task-service-{hostname}",
        name="task-service",
        host="localhost",  # En vrai, IP réelle
        port=5001,
        health_check_url="/health",
        metadata={"version": "1.0.0"},
        last_heartbeat=time.time()
    )
    
    service_registry.register_service(instance)

# Service de notifications
notification_app = Flask('notification-service')

@notification_app.route('/notifications', methods=['POST'])
def send_notification():
    data = request.get_json()
    
    # Logique d'envoi de notification
    print(f"Sending notification: {data['message']}")
    
    # Ici, envoi d'email, SMS, etc.
    
    return jsonify({'status': 'sent'}), 200

# Pattern Saga pour les transactions distribuées
@dataclass
class SagaStep:
    service: str
    action: str
    compensation: str
    data: Dict[str, Any]

class SagaOrchestrator:
    """Orchestrateur de sagas pour les transactions distribuées"""
    
    def __init__(self):
        self.steps: List[SagaStep] = []
        self.completed_steps: List[SagaStep] = []
    
    def add_step(self, service: str, action: str, compensation: str, data: Dict[str, Any]):
        """Ajoute une étape à la saga"""
        self.steps.append(SagaStep(service, action, compensation, data))
    
    async def execute_saga(self) -> bool:
        """Exécute la saga"""
        try:
            for step in self.steps:
                async with ServiceClient(step.service) as client:
                    await client.call_service(step.action, method='POST', data=step.data)
                    self.completed_steps.append(step)
            
            return True
            
        except Exception as e:
            # Compensation en cas d'échec
            await self._compensate_saga()
            return False
    
    async def _compensate_saga(self):
        """Annule les étapes déjà exécutées"""
        for step in reversed(self.completed_steps):
            try:
                async with ServiceClient(step.service) as client:
                    await client.call_service(step.compensation, method='POST', data=step.data)
            except Exception as e:
                # Log l'échec de compensation
                print(f"Compensation failed for {step.service}: {e}")

# Exemple de saga pour créer une tâche avec notification
async def create_task_saga():
    """Crée une tâche avec saga pour garantir la cohérence"""
    orchestrator = SagaOrchestrator()
    
    # Étape 1: Créer la tâche
    orchestrator.add_step(
        service='task-service',
        action='/tasks',
        compensation='/tasks/cancel',  # Endpoint de compensation
        data={'title': 'Saga Task', 'description': 'Created with saga'}
    )
    
    # Étape 2: Envoyer la notification
    orchestrator.add_step(
        service='notification-service',
        action='/notifications',
        compensation='/notifications/cancel',
        data={'type': 'task_created', 'message': 'Task created via saga'}
    )
    
    success = await orchestrator.execute_saga()
    return success
```

**Load balancing et découverte de services**
```python
# load_balancing.py
from typing import List, Optional
import hashlib
import random
import time

class LoadBalancer:
    """Load balancer pour les microservices"""
    
    def __init__(self, service_name: str):
        self.service_name = service_name
        self.last_index = 0
    
    def get_next_instance(self) -> Optional[ServiceInstance]:
        """Stratégie Round-Robin"""
        instances = service_registry.get_service_instances(self.service_name)
        if not instances:
            return None
        
        instance = instances[self.last_index % len(instances)]
        self.last_index += 1
        return instance
    
    def get_instance_by_hash(self, key: str) -> Optional[ServiceInstance]:
        """Stratégie basée sur le hash (pour sticky sessions)"""
        instances = service_registry.get_service_instances(self.service_name)
        if not instances:
            return None
        
        hash_value = int(hashlib.md5(key.encode()).hexdigest(), 16)
        index = hash_value % len(instances)
        return instances[index]
    
    def get_least_loaded_instance(self) -> Optional[ServiceInstance]:
        """Stratégie basée sur la charge (simple)"""
        instances = service_registry.get_service_instances(self.service_name)
        if not instances:
            return None
        
        # Simulation: choisir l'instance avec le moins de connexions actives
        # En vrai, utiliser des métriques réelles
        return min(instances, key=lambda i: i.metadata.get('active_connections', 0))

class ServiceDiscovery:
    """Découverte automatique de services"""
    
    def __init__(self, registry: ServiceRegistry):
        self.registry = registry
    
    def discover_services(self) -> Dict[str, List[str]]:
        """Découvre tous les services disponibles"""
        services = {}
        for service_name, instances in self.registry.services.items():
            healthy_instances = [i for i in instances if i.is_healthy()]
            services[service_name] = [i.url for i in healthy_instances]
        
        return services
    
    def watch_service_changes(self, service_name: str, callback):
        """Surveille les changements d'un service"""
        # Simulation d'un watcher
        # En vrai, utiliser Consul, etcd, ou Kubernetes API
        pass

# Circuit breaker pour la communication inter-services
class ServiceCircuitBreaker:
    """Circuit breaker pour les appels de service"""
    
    def __init__(self, service_name: str, failure_threshold: int = 5, timeout: float = 60.0):
        self.service_name = service_name
        self.failure_threshold = failure_threshold
        self.timeout = timeout
        self.failures = 0
        self.last_failure = 0
        self.state = 'closed'  # closed, open, half-open
    
    def _should_attempt_call(self) -> bool:
        if self.state == 'closed':
            return True
        
        if self.state == 'open':
            if time.time() - self.last_failure > self.timeout:
                self.state = 'half-open'
                return True
            return False
        
        return True  # half-open
    
    async def call(self, func, *args, **kwargs):
        if not self._should_attempt_call():
            raise Exception(f"Circuit breaker open for {self.service_name}")
        
        try:
            result = await func(*args, **kwargs)
            self._on_success()
            return result
        except Exception as e:
            self._on_failure()
            raise e
    
    def _on_success(self):
        self.failures = 0
        self.state = 'closed'
    
    def _on_failure(self):
        self.failures += 1
        self.last_failure = time.time()
        
        if self.failures >= self.failure_threshold:
            self.state = 'open'

# Client avec circuit breaker
class ResilientServiceClient(ServiceClient):
    def __init__(self, service_name: str):
        super().__init__(service_name)
        self.circuit_breaker = ServiceCircuitBreaker(service_name)
    
    async def call_service_safe(self, endpoint: str, method: str = 'GET', 
                               data: Optional[Dict] = None, headers: Optional[Dict] = None):
        """Appelle un service avec circuit breaker"""
        return await self.circuit_breaker.call(
            self.call_service, endpoint, method, data, headers
        )

# Health checks automatiques
class HealthChecker:
    """Vérificateur de santé automatique des services"""
    
    def __init__(self, registry: ServiceRegistry, check_interval: int = 30):
        self.registry = registry
        self.check_interval = check_interval
        self.running = False
    
    def start(self):
        """Démarre les health checks"""
        self.running = True
        import threading
        thread = threading.Thread(target=self._check_loop, daemon=True)
        thread.start()
    
    def stop(self):
        """Arrête les health checks"""
        self.running = False
    
    def _check_loop(self):
        """Boucle de vérification de santé"""
        while self.running:
            self._perform_health_checks()
            time.sleep(self.check_interval)
    
    def _perform_health_checks(self):
        """Effectue les vérifications de santé"""
        for service_name, instances in self.registry.services.items():
            for instance in instances:
                self._check_instance_health(instance)
    
    async def _check_instance_health(self, instance: ServiceInstance):
        """Vérifie la santé d'une instance"""
        try:
            async with aiohttp.ClientSession(timeout=aiohttp.ClientTimeout(total=5)) as session:
                url = f"{instance.url}{instance.health_check_url}"
                async with session.get(url) as response:
                    is_healthy = response.status == 200
        except:
            is_healthy = False
        
        # Mettre à jour le timestamp du dernier heartbeat
        if is_healthy:
            instance.last_heartbeat = time.time()
        # Si pas healthy, l'instance sera considérée comme telle dans get_service_instances

# Démarrage des composants
def setup_microservices_infrastructure():
    """Configure l'infrastructure microservices"""
    
    # Enregistrer les services
    register_task_service()
    
    # Démarrer les health checks
    health_checker = HealthChecker(service_registry)
    health_checker.start()
    
    return {
        'registry': service_registry,
        'health_checker': health_checker
    }
```

**Démonstration pratique (15 min)**
Configuration d'une architecture microservices avec découverte de services.

**Exercices guidés (10 min)**
1. Créer un registre de services simple
2. Implémenter un client de service avec circuit breaker
3. Configurer le load balancing entre instances

**QCM d'auto-évaluation (3 min)**
1. Quel pattern pour les transactions distribuées ?
2. Pourquoi utiliser un circuit breaker ?
3. Quelle stratégie de load balancing pour les sessions ?

**Devoir**
Implémenter une architecture microservices pour l'application "Tâches".

---

## Cours 27 - Gestion de projet
**Objectifs**
- Maîtriser les méthodologies agiles
- Estimer les tâches et planifier les sprints
- Gérer les risques et les changements

**Leçon (30 min - détaillée)**
La gestion de projet détermine le succès des développements logiciels.

**Méthodologies agiles**
```python
# agile_methodologies.py
from typing import List, Dict, Any, Optional
from dataclasses import dataclass
from datetime import datetime, timedelta
from enum import Enum

class StoryStatus(Enum):
    TODO = "todo"
    IN_PROGRESS = "in_progress"
    REVIEW = "review"
    DONE = "done"

class StoryType(Enum):
    FEATURE = "feature"
    BUG = "bug"
    TECHNICAL_DEBT = "technical_debt"
    SPIKE = "spike"

@dataclass
class UserStory:
    id: str
    title: str
    description: str
    story_type: StoryType
    status: StoryStatus
    story_points: int
    priority: int  # 1-5, 1 étant la plus haute
    assignee: Optional[str]
    created_at: datetime
    updated_at: datetime
    acceptance_criteria: List[str]
    dependencies: List[str]  # IDs des stories dépendantes
    
    def is_ready(self) -> bool:
        """Vérifie si la story est prête à être travaillée"""
        return all(dep in self.dependencies for dep in [])  # Simulation
    
    def can_be_completed(self) -> bool:
        """Vérifie si la story peut être marquée comme terminée"""
        return all(self._check_criterion(criterion) for criterion in self.acceptance_criteria)
    
    def _check_criterion(self, criterion: str) -> bool:
        """Vérifie un critère d'acceptation (simulation)"""
        # En vrai, cela nécessiterait des tests automatisés
        return True

@dataclass
class Sprint:
    id: str
    name: str
    start_date: datetime
    end_date: datetime
    goal: str
    committed_stories: List[UserStory]
    completed_stories: List[UserStory]
    
    @property
    def total_story_points(self) -> int:
        return sum(story.story_points for story in self.committed_stories)
    
    @property
    def completed_story_points(self) -> int:
        return sum(story.story_points for story in self.completed_stories)
    
    @property
    def velocity(self) -> float:
        """Vélocité du sprint (story points par jour)"""
        days_elapsed = (datetime.now() - self.start_date).days
        if days_elapsed <= 0:
            return 0
        return self.completed_story_points / days_elapsed
    
    @property
    def burndown_data(self) -> List[Dict[str, Any]]:
        """Données pour le graphique burndown"""
        # Simulation simplifiée
        return [
            {'day': 1, 'remaining': self.total_story_points},
            {'day': 2, 'remaining': self.total_story_points - 10},
            # ...
        ]

class ScrumBoard:
    """Tableau Scrum pour gérer les tâches"""
    
    def __init__(self):
        self.stories: Dict[str, UserStory] = {}
    
    def add_story(self, story: UserStory):
        self.stories[story.id] = story
    
    def move_story(self, story_id: str, new_status: StoryStatus):
        """Déplace une story dans une nouvelle colonne"""
        if story_id not in self.stories:
            raise ValueError(f"Story {story_id} not found")
        
        story = self.stories[story_id]
        story.status = new_status
        story.updated_at = datetime.now()
    
    def get_stories_by_status(self, status: StoryStatus) -> List[UserStory]:
        """Récupère les stories par statut"""
        return [s for s in self.stories.values() if s.status == status]
    
    def get_board_summary(self) -> Dict[str, Any]:
        """Résumé du tableau"""
        summary = {}
        for status in StoryStatus:
            stories = self.get_stories_by_status(status)
            summary[status.value] = {
                'count': len(stories),
                'story_points': sum(s.story_points for s in stories)
            }
        return summary

# Planning poker pour l'estimation
class PlanningPoker:
    """Session de planning poker"""
    
    FIBONACCI_SEQUENCE = [1, 2, 3, 5, 8, 13, 21, 34, 55, 89]
    
    def __init__(self, participants: List[str]):
        self.participants = participants
        self.votes: Dict[str, Optional[int]] = {p: None for p in participants}
        self.revealed = False
    
    def vote(self, participant: str, estimate: int):
        """Enregistre un vote"""
        if participant not in self.participants:
            raise ValueError(f"Participant {participant} not in session")
        
        if estimate not in self.FIBONACCI_SEQUENCE:
            raise ValueError(f"Estimate {estimate} not in Fibonacci sequence")
        
        self.votes[participant] = estimate
    
    def reveal_votes(self) -> Dict[str, int]:
        """Révéle tous les votes"""
        self.revealed = True
        return {k: v for k, v in self.votes.items() if v is not None}
    
    def get_consensus_estimate(self) -> Optional[int]:
        """Calcule l'estimation consensuelle"""
        if not self.revealed:
            return None
        
        valid_votes = [v for v in self.votes.values() if v is not None]
        if not valid_votes:
            return None
        
        # Médiane pour éviter les extrêmes
        sorted_votes = sorted(valid_votes)
        mid = len(sorted_votes) // 2
        return sorted_votes[mid]

# Gestion des risques
@dataclass
class Risk:
    id: str
    description: str
    probability: float  # 0.0 à 1.0
    impact: float  # 0.0 à 1.0
    mitigation_strategy: str
    status: str  # identified, mitigated, occurred
    created_at: datetime
    
    @property
    def risk_score(self) -> float:
        """Calcule le score de risque (probabilité × impact)"""
        return self.probability * self.impact

class RiskRegister:
    """Registre des risques"""
    
    def __init__(self):
        self.risks: Dict[str, Risk] = {}
    
    def add_risk(self, risk: Risk):
        self.risks[risk.id] = risk
    
    def get_high_risks(self, threshold: float = 0.7) -> List[Risk]:
        """Récupère les risques à haut score"""
        return [r for r in self.risks.values() if r.risk_score >= threshold]
    
    def update_risk_status(self, risk_id: str, status: str):
        """Met à jour le statut d'un risque"""
        if risk_id in self.risks:
            self.risks[risk_id].status = status

# Métriques de projet
class ProjectMetrics:
    """Métriques pour suivre l'avancement du projet"""
    
    def __init__(self, scrum_board: ScrumBoard, sprint: Sprint):
        self.board = scrum_board
        self.sprint = sprint
    
    def calculate_burndown(self) -> List[Dict[str, Any]]:
        """Calcule les données de burndown"""
        # Simulation
        total_points = self.sprint.total_story_points
        days = (self.sprint.end_date - self.sprint.start_date).days
        
        burndown = []
        remaining = total_points
        
        for day in range(days + 1):
            # Simulation d'une progression linéaire
            progress = (day / days) * total_points
            remaining = max(0, total_points - progress)
            
            burndown.append({
                'day': day,
                'ideal': total_points - (day * total_points / days),
                'actual': remaining
            })
        
        return burndown
    
    def calculate_velocity_trend(self, previous_sprints: List[Sprint]) -> List[float]:
        """Calcule la tendance de vélocité"""
        velocities = [s.velocity for s in previous_sprints]
        velocities.append(self.sprint.velocity)
        return velocities
    
    def get_team_productivity(self) -> Dict[str, Any]:
        """Mesure la productivité de l'équipe"""
        completed_points = self.sprint.completed_story_points
        total_days = (datetime.now() - self.sprint.start_date).days or 1
        
        return {
            'story_points_per_day': completed_points / total_days,
            'sprint_completion_percentage': (completed_points / self.sprint.total_story_points) * 100,
            'remaining_work': self.sprint.total_story_points - completed_points
        }

# Gestion des changements
class ChangeRequest:
    """Demande de changement"""
    
    def __init__(self, id: str, title: str, description: str, impact: str, 
                 requester: str, priority: str):
        self.id = id
        self.title = title
        self.description = description
        self.impact = impact
        self.requester = requester
        self.priority = priority
        self.status = 'pending'  # pending, approved, rejected
        self.created_at = datetime.now()
    
    def approve(self):
        self.status = 'approved'
    
    def reject(self, reason: str):
        self.status = 'rejected'
        self.rejection_reason = reason

class ChangeManagement:
    """Gestion des demandes de changement"""
    
    def __init__(self):
        self.change_requests: Dict[str, ChangeRequest] = {}
    
    def submit_change_request(self, request: ChangeRequest):
        self.change_requests[request.id] = request
    
    def review_change_request(self, request_id: str, approved: bool, reason: str = ""):
        """Revue d'une demande de changement"""
        if request_id not in self.change_requests:
            raise ValueError(f"Change request {request_id} not found")
        
        request = self.change_requests[request_id]
        
        if approved:
            request.approve()
        else:
            request.reject(reason)
    
    def get_pending_requests(self) -> List[ChangeRequest]:
        """Récupère les demandes en attente"""
        return [r for r in self.change_requests.values() if r.status == 'pending']

# Exemple d'utilisation
def setup_project_management():
    """Configure la gestion de projet"""
    
    # Créer le tableau Scrum
    board = ScrumBoard()
    
    # Ajouter des user stories
    story1 = UserStory(
        id="US-001",
        title="User can create tasks",
        description="As a user, I want to create new tasks",
        story_type=StoryType.FEATURE,
        status=StoryStatus.TODO,
        story_points=5,
        priority=1,
        assignee=None,
        created_at=datetime.now(),
        updated_at=datetime.now(),
        acceptance_criteria=[
            "User can access task creation form",
            "Form validates input",
            "Task is saved to database",
            "Success message is shown"
        ],
        dependencies=[]
    )
    
    board.add_story(story1)
    
    # Créer un sprint
    sprint = Sprint(
        id="SPRINT-001",
        name="Sprint 1",
        start_date=datetime.now(),
        end_date=datetime.now() + timedelta(days=14),
        goal="Implement basic task management",
        committed_stories=[story1],
        completed_stories=[]
    )
    
    # Planning poker
    poker = PlanningPoker(["alice", "bob", "charlie"])
    poker.vote("alice", 5)
    poker.vote("bob", 8)
    poker.vote("charlie", 5)
    poker.reveal_votes()
    consensus = poker.get_consensus_estimate()  # 5
    
    # Gestion des risques
    risk_register = RiskRegister()
    risk_register.add_risk(Risk(
        id="RISK-001",
        description="Database performance degradation",
        probability=0.3,
        impact=0.8,
        mitigation_strategy="Implement query optimization and indexing",
        status="identified",
        created_at=datetime.now()
    ))
    
    return {
        'board': board,
        'sprint': sprint,
        'poker': poker,
        'risks': risk_register
    }
```

**Démonstration pratique (15 min)**
Configuration d'un système de gestion de projet agile.

**Exercices guidés (10 min)**
1. Créer des user stories avec critères d'acceptation
2. Configurer un sprint avec estimation
3. Identifier et gérer les risques du projet

**QCM d'auto-évaluation (3 min)**
1. Quelle séquence pour l'estimation agile ?
2. Quel graphique pour suivre l'avancement ?
3. Comment gérer les demandes de changement ?

**Devoir**
Mettre en place une gestion de projet complète pour l'application "Tâches".

---

## Cours 28 - Revue finale du code
**Objectifs**
- Effectuer un audit complet du code
- Identifier les problèmes de maintenabilité
- Préparer le code pour la production

**Leçon (30 min - détaillée)**
La revue finale garantit la qualité et la maintenabilité du code produit.

**Audit de code automatisé**
```python
# code_audit.py
import os
import ast
import re
from typing import List, Dict, Any, Set
from pathlib import Path

class CodeAuditor:
    """Auditeur de code automatisé"""
    
    def __init__(self, project_path: str):
        self.project_path = Path(project_path)
        self.issues: List[Dict[str, Any]] = []
    
    def audit_project(self) -> List[Dict[str, Any]]:
        """Audit complet du projet"""
        self.issues = []
        
        # Analyser tous les fichiers Python
        for py_file in self.project_path.rglob("*.py"):
            if self._should_analyze_file(py_file):
                self._audit_file(py_file)
        
        # Analyses globales
        self._audit_project_structure()
        self._audit_dependencies()
        
        return self.issues
    
    def _should_analyze_file(self, file_path: Path) -> bool:
        """Détermine si un fichier doit être analysé"""
        # Exclure certains répertoires
        excluded = {'__pycache__', '.venv', 'migrations', 'tests'}
        return not any(part in excluded for part in file_path.parts)
    
    def _audit_file(self, file_path: Path):
        """Audit d'un fichier individuel"""
        try:
            with open(file_path, 'r', encoding='utf-8') as f:
                content = f.read()
            
            # Analyse statique
            self._audit_code_complexity(file_path, content)
            self._audit_code_quality(file_path, content)
            self._audit_security_issues(file_path, content)
            self._audit_best_practices(file_path, content)
            
        except Exception as e:
            self.issues.append({
                'file': str(file_path),
                'type': 'error',
                'severity': 'high',
                'message': f'Could not analyze file: {e}'
            })
    
    def _audit_code_complexity(self, file_path: Path, content: str):
        """Analyse la complexité du code"""
        try:
            tree = ast.parse(content)
            
            for node in ast.walk(tree):
                if isinstance(node, ast.FunctionDef):
                    complexity = self._calculate_cyclomatic_complexity(node)
                    
                    if complexity > 10:
                        self.issues.append({
                            'file': str(file_path),
                            'line': node.lineno,
                            'type': 'complexity',
                            'severity': 'medium' if complexity > 15 else 'low',
                            'message': f'Function {node.name} has high complexity ({complexity})'
                        })
                        
                    if len(node.body) > 50:
                        self.issues.append({
                            'file': str(file_path),
                            'line': node.lineno,
                            'type': 'complexity',
                            'severity': 'low',
                            'message': f'Function {node.name} is too long ({len(node.body)} lines)'
                        })
        
        except SyntaxError:
            self.issues.append({
                'file': str(file_path),
                'type': 'syntax',
                'severity': 'critical',
                'message': 'File contains syntax errors'
            })
    
    def _calculate_cyclomatic_complexity(self, node: ast.FunctionDef) -> int:
        """Calcule la complexité cyclomatique"""
        complexity = 1  # Base complexity
        
        for child in ast.walk(node):
            if isinstance(child, (ast.If, ast.For, ast.While, ast.Try)):
                complexity += 1
            elif isinstance(child, ast.BoolOp):
                complexity += len(child.values) - 1
        
        return complexity
    
    def _audit_code_quality(self, file_path: Path, content: str):
        """Audit de la qualité du code"""
        lines = content.split('\n')
        
        for i, line in enumerate(lines, 1):
            # Lignes trop longues
            if len(line) > 88:
                self.issues.append({
                    'file': str(file_path),
                    'line': i,
                    'type': 'style',
                    'severity': 'low',
                    'message': f'Line too long ({len(line)} characters)'
                })
            
            # Utilisation de print en production
            if re.search(r'\bprint\s*\(', line) and 'debug' not in str(file_path).lower():
                self.issues.append({
                    'file': str(file_path),
                    'line': i,
                    'type': 'logging',
                    'severity': 'medium',
                    'message': 'Using print() instead of logging'
                })
            
            # Variables non utilisées
            # (Analyse plus complexe nécessaire pour détecter vraiment)
    
    def _audit_security_issues(self, file_path: Path, content: str):
        """Audit des problèmes de sécurité"""
        lines = content.split('\n')
        
        for i, line in enumerate(lines, 1):
            # Injection SQL potentielle
            if re.search(r'execute\s*\(.+?\%', line) or re.search(r'execute\s*\(.+?format', line):
                self.issues.append({
                    'file': str(file_path),
                    'line': i,
                    'type': 'security',
                    'severity': 'high',
                    'message': 'Potential SQL injection vulnerability'
                })
            
            # Secrets en dur
            if re.search(r'password\s*=\s*[\'"][^\'"]*[\'"]', line, re.IGNORECASE):
                self.issues.append({
                    'file': str(file_path),
                    'line': i,
                    'type': 'security',
                    'severity': 'critical',
                    'message': 'Hardcoded password detected'
                })
            
            # eval() usage
            if 'eval(' in line:
                self.issues.append({
                    'file': str(file_path),
                    'line': i,
                    'type': 'security',
                    'severity': 'high',
                    'message': 'Use of eval() is dangerous'
                })
    
    def _audit_best_practices(self, file_path: Path, content: str):
        """Audit des bonnes pratiques"""
        # Vérifier la présence de docstrings
        if not re.search(r'""".*"""', content, re.DOTALL):
            self.issues.append({
                'file': str(file_path),
                'type': 'documentation',
                'severity': 'low',
                'message': 'Missing module docstring'
            })
        
        # Vérifier l'import de typing
        if 'from typing import' not in content and 'import typing' not in content:
            # Seulement si le fichier définit des fonctions
            if 'def ' in content:
                self.issues.append({
                    'file': str(file_path),
                    'type': 'typing',
                    'severity': 'medium',
                    'message': 'Consider adding type hints'
                })
    
    def _audit_project_structure(self):
        """Audit de la structure du projet"""
        required_files = ['README.md', 'requirements.txt', '.gitignore']
        
        for required_file in required_files:
            if not (self.project_path / required_file).exists():
                self.issues.append({
                    'file': required_file,
                    'type': 'structure',
                    'severity': 'medium',
                    'message': f'Missing required file: {required_file}'
                })
        
        # Vérifier la structure des répertoires
        expected_dirs = ['app', 'tests', 'docs']
        for expected_dir in expected_dirs:
            if not (self.project_path / expected_dir).is_dir():
                self.issues.append({
                    'file': expected_dir,
                    'type': 'structure',
                    'severity': 'low',
                    'message': f'Missing recommended directory: {expected_dir}'
                })
    
    def _audit_dependencies(self):
        """Audit des dépendances"""
        req_file = self.project_path / 'requirements.txt'
        if req_file.exists():
            try:
                with open(req_file, 'r') as f:
                    deps = f.read().split('\n')
                
                # Vérifier les versions épinglées
                unpinned = []
                for dep in deps:
                    dep = dep.strip()
                    if dep and not re.search(r'==[\d\.]+', dep):
                        unpinned.append(dep)
                
                if unpinned:
                    self.issues.append({
                        'file': 'requirements.txt',
                        'type': 'dependencies',
                        'severity': 'medium',
                        'message': f'Unpinned dependencies: {", ".join(unpinned[:3])}'
                    })
            
            except Exception as e:
                self.issues.append({
                    'file': 'requirements.txt',
                    'type': 'dependencies',
                    'severity': 'low',
                    'message': f'Could not analyze requirements: {e}'
                })

class CodeReviewReport:
    """Rapport de revue de code"""
    
    def __init__(self, issues: List[Dict[str, Any]]):
        self.issues = issues
    
    def generate_report(self) -> str:
        """Génère un rapport de revue"""
        if not self.issues:
            return "✅ Code review passed - No issues found!"
        
        report = "# 📋 Code Review Report\n\n"
        report += f"**Total Issues:** {len(self.issues)}\n\n"
        
        # Grouper par type
        by_type = {}
        by_severity = {'critical': 0, 'high': 0, 'medium': 0, 'low': 0}
        
        for issue in self.issues:
            issue_type = issue['type']
            severity = issue['severity']
            
            if issue_type not in by_type:
                by_type[issue_type] = []
            by_type[issue_type].append(issue)
            
            by_severity[severity] += 1
        
        # Statistiques
        report += "## 📊 Summary\n\n"
        report += "| Severity | Count |\n"
        report += "|----------|-------|\n"
        for severity, count in by_severity.items():
            if count > 0:
                report += f"| {severity.title()} | {count} |\n"
        report += "\n"
        
        # Détails par type
        for issue_type, type_issues in by_type.items():
            report += f"## 🔍 {issue_type.title().replace('_', ' ')}\n\n"
            
            for issue in type_issues:
                severity_emoji = {
                    'critical': '🔴',
                    'high': '🟠',
                    'medium': '🟡',
                    'low': '🔵'
                }.get(issue['severity'], '❓')
                
                location = f"{issue['file']}"
                if 'line' in issue:
                    location += f":{issue['line']}"
                
                report += f"- {severity_emoji} **{location}**: {issue['message']}\n"
            
            report += "\n"
        
        # Recommandations
        report += "## 💡 Recommendations\n\n"
        
        if by_severity['critical'] > 0:
            report += "- 🔴 **Critical issues must be fixed before production**\n"
        
        if by_severity['high'] > 0:
            report += "- 🟠 **High priority issues should be addressed soon**\n"
        
        if by_severity['medium'] > 0:
            report += "- 🟡 **Medium priority issues improve code quality**\n"
        
        if by_severity['low'] > 0:
            report += "- 🔵 **Low priority issues are style/best practice suggestions**\n"
        
        return report
    
    def get_score(self) -> float:
        """Calcule un score de qualité (0-100)"""
        if not self.issues:
            return 100.0
        
        # Poids par sévérité
        weights = {
            'critical': 10,
            'high': 5,
            'medium': 2,
            'low': 1
        }
        
        total_weight = sum(weights[issue['severity']] for issue in self.issues)
        
        # Score basé sur une échelle arbitraire
        # Moins de 10 points = 90+, 10-50 points = 70-90, etc.
        if total_weight == 0:
            return 100.0
        elif total_weight < 10:
            return 95.0
        elif total_weight < 50:
            return 85.0
        elif total_weight < 100:
            return 75.0
        else:
            return max(0, 100 - total_weight / 10)

# Utilisation
def perform_final_code_review(project_path: str) -> str:
    """Effectue une revue finale du code"""
    auditor = CodeAuditor(project_path)
    issues = auditor.audit_project()
    
    report = CodeReviewReport(issues)
    
    print(f"Code Quality Score: {report.get_score():.1f}/100")
    
    return report.generate_report()
```

**Démonstration pratique (15 min)**
Audit complet du code avec génération de rapport.

**Exercices guidés (10 min)**
1. Créer un auditeur de code personnalisé
2. Analyser un projet et générer un rapport
3. Identifier les principales améliorations

**QCM d'auto-évaluation (3 min)**
1. Quel outil pour mesurer la complexité ?
2. Pourquoi auditer la sécurité ?
3. Comment calculer un score de qualité ?

**Devoir**
Effectuer un audit complet du code de l'application "Tâches".

---

## Cours 29 - Préparation production
**Objectifs**
- Finaliser le hardening de l'application
- Configurer les environnements de production
- Préparer le déploiement final

**Leçon (30 min - détaillée)**
La préparation production garantit un lancement réussi et stable.

**Configuration production**
```python
# production_config.py
import os
from typing import Dict, Any

class ProductionConfig:
    """Configuration pour l'environnement de production"""
    
    # Sécurité
    SECRET_KEY = os.getenv('SECRET_KEY')
    if not SECRET_KEY or len(SECRET_KEY) < 32:
        raise ValueError("SECRET_KEY must be set and at least 32 characters long")
    
    # Base de données
    SQLALCHEMY_DATABASE_URI = os.getenv('DATABASE_URL')
    if not SQLALCHEMY_DATABASE_URI:
        raise ValueError("DATABASE_URL must be set")
    
    SQLALCHEMY_TRACK_MODIFICATIONS = False
    SQLALCHEMY_ENGINE_OPTIONS = {
        'pool_size': 20,
        'pool_recycle': 3600,
        'pool_pre_ping': True,
        'max_overflow': 30
    }
    
    # Sessions
    SESSION_TYPE = 'redis'
    SESSION_REDIS = os.getenv('REDIS_URL', 'redis://localhost:6379')
    SESSION_PERMANENT = True
    PERMANENT_SESSION_LIFETIME = 3600  # 1 heure
    
    # Cache
    CACHE_TYPE = 'redis'
    CACHE_REDIS_URL = os.getenv('REDIS_URL', 'redis://localhost:6379')
    CACHE_DEFAULT_TIMEOUT = 300
    
    # Logging
    LOG_LEVEL = 'WARNING'
    LOG_FORMAT = '%(asctime)s - %(name)s - %(levelname)s - %(message)s'
    
    # Email
    MAIL_SERVER = os.getenv('MAIL_SERVER', 'smtp.gmail.com')
    MAIL_PORT = int(os.getenv('MAIL_PORT', 587))
    MAIL_USE_TLS = True
    MAIL_USERNAME = os.getenv('MAIL_USERNAME')
    MAIL_PASSWORD = os.getenv('MAIL_PASSWORD')
    
    # Monitoring
    SENTRY_DSN = os.getenv('SENTRY_DSN')
    PROMETHEUS_METRICS_ENABLED = True
    
    # Feature flags
    MAINTENANCE_MODE = os.getenv('MAINTENANCE_MODE', 'false').lower() == 'true'
    
    # Sécurité
    SECURITY_HEADERS = {
        'X-Content-Type-Options': 'nosniff',
        'X-Frame-Options': 'DENY',
        'X-XSS-Protection': '1; mode=block',
        'Strict-Transport-Security': 'max-age=31536000; includeSubDomains',
        'Content-Security-Policy': "default-src 'self'; script-src 'self' 'unsafe-inline'; style-src 'self' 'unsafe-inline'",
        'Referrer-Policy': 'strict-origin-when-cross-origin'
    }
    
    # Limites
    MAX_CONTENT_LENGTH = 16 * 1024 * 1024  # 16MB
    RATELIMIT_DEFAULT = "100 per hour"
    RATELIMIT_STORAGE_URL = os.getenv('REDIS_URL', 'redis://localhost:6379')

def validate_production_config() -> bool:
    """Valide la configuration de production"""
    issues = []
    
    # Vérifier les variables d'environnement critiques
    required_env_vars = [
        'SECRET_KEY',
        'DATABASE_URL',
        'REDIS_URL',
        'MAIL_USERNAME',
        'MAIL_PASSWORD'
    ]
    
    for var in required_env_vars:
        if not os.getenv(var):
            issues.append(f"Missing required environment variable: {var}")
    
    # Vérifier la longueur de SECRET_KEY
    secret_key = os.getenv('SECRET_KEY', '')
    if len(secret_key) < 32:
        issues.append("SECRET_KEY must be at least 32 characters long")
    
    # Vérifier le format de DATABASE_URL
    db_url = os.getenv('DATABASE_URL', '')
    if db_url and not db_url.startswith(('postgresql://', 'mysql://')):
        issues.append("DATABASE_URL must use PostgreSQL or MySQL")
    
    if issues:
        print("❌ Production configuration issues:")
        for issue in issues:
            print(f"  - {issue}")
        return False
    
    print("✅ Production configuration validated")
    return True

# Middleware de sécurité
def setup_security_middleware(app):
    """Configure les middlewares de sécurité"""
    from flask_talisman import Talisman
    from flask_limiter import Limiter
    from flask_limiter.util import get_remote_address
    
    # Headers de sécurité
    talisman = Talisman(
        app,
        content_security_policy=app.config['SECURITY_HEADERS'].get('Content-Security-Policy'),
        strict_transport_security=app.config['SECURITY_HEADERS'].get('Strict-Transport-Security'),
        x_content_type_options=app.config['SECURITY_HEADERS'].get('X-Content-Type-Options'),
        x_frame_options=app.config['SECURITY_HEADERS'].get('X-Frame-Options'),
        referrer_policy=app.config['SECURITY_HEADERS'].get('Referrer-Policy')
    )
    
    # Rate limiting
    limiter = Limiter(
        app=app,
        key_func=get_remote_address,
        storage_uri=app.config['RATELIMIT_STORAGE_URL'],
        default_limits=[app.config['RATELIMIT_DEFAULT']]
    )
    
    return talisman, limiter

# Monitoring et logging production
def setup_production_monitoring(app):
    """Configure le monitoring de production"""
    import logging
    from logging.handlers import RotatingFileHandler
    
    # Logging
    if not app.debug:
        # Handler pour les erreurs
        error_handler = RotatingFileHandler(
            'logs/error.log', 
            maxBytes=10*1024*1024,  # 10MB
            backupCount=5
        )
        error_handler.setLevel(logging.ERROR)
        error_formatter = logging.Formatter(app.config['LOG_FORMAT'])
        error_handler.setFormatter(error_formatter)
        app.logger.addHandler(error_handler)
        
        # Handler général
        general_handler = RotatingFileHandler(
            'logs/app.log',
            maxBytes=10*1024*1024,
            backupCount=5
        )
        general_handler.setLevel(logging.WARNING)
        general_formatter = logging.Formatter(app.config['LOG_FORMAT'])
        general_handler.setFormatter(general_formatter)
        app.logger.addHandler(general_handler)
    
    # Sentry pour le monitoring d'erreurs
    sentry_dsn = app.config.get('SENTRY_DSN')
    if sentry_dsn:
        import sentry_sdk
        from sentry_sdk.integrations.flask import FlaskIntegration
        
        sentry_sdk.init(
            dsn=sentry_dsn,
            integrations=[FlaskIntegration()],
            traces_sample_rate=0.1,  # 10% des requêtes
            environment='production'
        )
    
    # Métriques Prometheus
    if app.config.get('PROMETHEUS_METRICS_ENABLED'):
        from prometheus_flask_exporter import PrometheusMetrics
        metrics = PrometheusMetrics(app)

# Gestion du mode maintenance
def maintenance_mode_middleware(app):
    """Middleware pour le mode maintenance"""
    
    @app.before_request
    def check_maintenance_mode():
        if app.config.get('MAINTENANCE_MODE'):
            from flask import render_template, request
            
            # Permettre l'accès aux admins ou aux health checks
            if request.path.startswith('/health') or request.path.startswith('/admin'):
                return
            
            return render_template('maintenance.html'), 503
    
    return app

# Optimisations production
def apply_production_optimizations(app):
    """Applique les optimisations pour la production"""
    
    # Compression des réponses
    from flask_compress import Compress
    compress = Compress()
    compress.init_app(app)
    
    # Cache des templates et assets statiques
    app.config['TEMPLATES_AUTO_RELOAD'] = False
    
    # Optimisations SQLAlchemy
    app.config['SQLALCHEMY_ECHO'] = False
    
    # Préchargement des templates fréquents
    with app.app_context():
        # Cache des templates couramment utilisés
        pass

# Script de déploiement
def create_deployment_script():
    """Crée un script de déploiement pour la production"""
    
    deployment_script = '''#!/bin/bash
set -e

echo "🚀 Déploiement en production..."

# Variables
APP_NAME="tasks-app"
DOCKER_IMAGE="myregistry/$APP_NAME:latest"
ENV_FILE=".env.production"

# Validation
if [ ! -f "$ENV_FILE" ]; then
    echo "❌ Fichier $ENV_FILE manquant"
    exit 1
fi

# Backup de la base de données
echo "💾 Backup de la base..."
docker exec tasks-db pg_dump -U postgres tasks > backup_$(date +%Y%m%d_%H%M%S).sql

# Build de l'image
echo "🏗️  Build de l'image..."
docker build -t $DOCKER_IMAGE .

# Tests pré-déploiement
echo "🧪 Tests pré-déploiement..."
docker run --rm --env-file $ENV_FILE $DOCKER_IMAGE python -m pytest tests/ -v

# Déploiement
echo "🚀 Déploiement..."
docker-compose -f docker-compose.prod.yml up -d --scale web=3

# Health checks
echo "🏥 Vérification santé..."
sleep 30

if curl -f http://localhost/health; then
    echo "✅ Déploiement réussi!"
    
    # Nettoyage
    echo "🧹 Nettoyage..."
    docker image prune -f
    
    # Notification
    echo "📢 Notification équipe..."
    # Envoyer notification Slack/email
    
else
    echo "❌ Échec déploiement - Rollback..."
    docker-compose -f docker-compose.prod.yml up -d --scale web=0
    exit 1
fi
'''
    
    with open('deploy.sh', 'w') as f:
        f.write(deployment_script)
    
    # Rendre exécutable
    os.chmod('deploy.sh', 0o755)

# Checklist de production
PRODUCTION_CHECKLIST = {
    'security': [
        '🔒 SECRET_KEY configurée et sécurisée',
        '🔒 Variables d\'environnement validées',
        '🔒 Headers de sécurité activés',
        '🔒 Rate limiting configuré',
        '🔒 Logs d\'audit activés'
    ],
    
    'performance': [
        '⚡ Cache Redis configuré',
        '⚡ Pool de connexions DB optimisé',
        '⚡ Compression activée',
        '⚡ Assets statiques optimisés',
        '⚡ Monitoring des performances'
    ],
    
    'reliability': [
        '🛡️ Health checks configurés',
        '🛡️ Gestion d\'erreurs robuste',
        '🛡️ Circuit breakers en place',
        '🛡️ Backup automatique',
        '🛡️ Monitoring et alertes'
    ],
    
    'deployment': [
        '🚀 Script de déploiement créé',
        '🚀 Configuration Docker validée',
        '🚀 Tests automatisés passent',
        '🚀 Rollback planifié',
        '🚀 Documentation de déploiement'
    ]
}

def run_production_checklist() -> Dict[str, Any]:
    """Exécute la checklist de production"""
    results = {}
    
    for category, checks in PRODUCTION_CHECKLIST.items():
        results[category] = []
        for check in checks:
            # Simulation - en vrai, vérifier réellement
            results[category].append({
                'check': check,
                'status': '✅ Simulated OK'
            })
    
    return results

# Initialisation complète
def initialize_production_app(config_class=ProductionConfig):
    """Initialise l'application pour la production"""
    
    app = create_app(config_class)
    
    # Validation de configuration
    if not validate_production_config():
        raise RuntimeError("Production configuration validation failed")
    
    # Middlewares de sécurité
    setup_security_middleware(app)
    
    # Monitoring
    setup_production_monitoring(app)
    
    # Mode maintenance
    maintenance_mode_middleware(app)
    
    # Optimisations
    apply_production_optimizations(app)
    
    # Créer le script de déploiement
    create_deployment_script()
    
    # Vérifier la checklist
    checklist_results = run_production_checklist()
    
    print("🎯 Application prête pour la production!")
    print("📋 Checklist de production exécutée")
    
    return app
```

**Démonstration pratique (15 min)**
Configuration complète pour l'environnement de production.

**Exercices guidés (10 min)**
1. Configurer les variables d'environnement de production
2. Mettre en place les headers de sécurité
3. Créer un script de déploiement automatisé

**QCM d'auto-évaluation (3 min)**
1. Quel middleware pour la sécurité Flask ?
2. Pourquoi valider la configuration ?
3. Quel outil pour le monitoring d'erreurs ?

**Devoir**
Préparer complètement l'application "Tâches" pour la production.

---

## Cours 30 - Soutenance module 7
**Objectifs**
- Présenter l'architecture complète et les optimisations
- Démontrer la qualité du code et les bonnes pratiques
- Répondre aux questions techniques avancées

**Leçon (30 min - détaillée)**
La soutenance finale valide la maîtrise complète du développement professionnel.

**Démonstration de l'architecture**
```python
# final_demo.py
from typing import Dict, List, Any
import asyncio
import time
from concurrent.futures import ThreadPoolExecutor

class FinalDemo:
    """Démonstration finale de l'application complète"""
    
    def __init__(self):
        self.metrics = {
            'requests_processed': 0,
            'errors_handled': 0,
            'cache_hits': 0,
            'db_queries': 0
        }
    
    async def demonstrate_scalability(self):
        """Démontre la scalabilité de l'application"""
        print("🔄 Test de scalabilité...")
        
        # Simuler une charge importante
        tasks = []
        for i in range(100):
            tasks.append(self._simulate_user_request(i))
        
        start_time = time.time()
        results = await asyncio.gather(*tasks, return_exceptions=True)
        end_time = time.time()
        
        successful_requests = sum(1 for r in results if not isinstance(r, Exception))
        failed_requests = len(results) - successful_requests
        
        print(f"✅ {successful_requests} requêtes réussies, {failed_requests} échouées")
        print(f"⏱️  Temps total: {end_time - start_time:.2f}s")
        print(f"📊 Débit: {len(results) / (end_time - start_time):.1f} req/s")
    
    async def _simulate_user_request(self, user_id: int) -> Dict[str, Any]:
        """Simule une requête utilisateur complète"""
        try:
            # Création de tâche
            task_data = await self._create_task_simulation(user_id)
            
            # Lecture avec cache
            cached_data = await self._read_task_simulation(task_data['id'])
            
            # Mise à jour
            await self._update_task_simulation(task_data['id'])
            
            # Recherche
            search_results = await self._search_tasks_simulation(user_id)
            
            self.metrics['requests_processed'] += 1
            
            return {
                'user_id': user_id,
                'task_created': True,
                'cache_used': True,
                'search_performed': True
            }
            
        except Exception as e:
            self.metrics['errors_handled'] += 1
            raise e
    
    async def _create_task_simulation(self, user_id: int) -> Dict[str, Any]:
        """Simulation de création de tâche"""
        # Simuler latence DB
        await asyncio.sleep(0.01)
        self.metrics['db_queries'] += 1
        
        return {
            'id': f"task_{user_id}_{int(time.time())}",
            'title': f"Task for user {user_id}",
            'user_id': user_id
        }
    
    async def _read_task_simulation(self, task_id: str) -> Dict[str, Any]:
        """Simulation de lecture avec cache"""
        # Vérifier le cache d'abord
        cache_hit = (hash(task_id) % 10) < 7  # 70% hit rate
        
        if cache_hit:
            self.metrics['cache_hits'] += 1
            await asyncio.sleep(0.001)  # Cache très rapide
        else:
            await asyncio.sleep(0.01)  # DB plus lent
            self.metrics['db_queries'] += 1
        
        return {'id': task_id, 'cached': cache_hit}
    
    async def _update_task_simulation(self, task_id: str):
        """Simulation de mise à jour"""
        await asyncio.sleep(0.005)
        self.metrics['db_queries'] += 1
    
    async def _search_tasks_simulation(self, user_id: int) -> List[Dict[str, Any]]:
        """Simulation de recherche"""
        await asyncio.sleep(0.02)  # Recherche plus coûteuse
        self.metrics['db_queries'] += 2  # Index + recherche
        
        return [
            {'id': f"task_{user_id}_1", 'title': f"Task 1 for user {user_id}"},
            {'id': f"task_{user_id}_2", 'title': f"Task 2 for user {user_id}"}
        ]
    
    def demonstrate_architecture_quality(self):
        """Démontre la qualité de l'architecture"""
        print("🏗️  Analyse de l'architecture...")
        
        # Métriques de qualité simulées
        quality_metrics = {
            'cyclomatic_complexity_avg': 3.2,
            'test_coverage': 92.5,
            'maintainability_index': 78.3,
            'technical_debt_ratio': 8.7,
            'security_score': 9.1
        }
        
        for metric, value in quality_metrics.items():
            status = "✅" if value >= 80 else "⚠️" if value >= 60 else "❌"
            print(f"  {status} {metric}: {value}")
    
    def demonstrate_performance_optimizations(self):
        """Démontre les optimisations de performance"""
        print("⚡ Analyse des performances...")
        
        performance_results = {
            'response_time_p95': 245,  # ms
            'throughput': 1250,  # req/s
            'memory_usage': 89,  # MB
            'cpu_usage': 23,  # %
            'cache_hit_rate': 87.5,  # %
            'db_query_time_avg': 12,  # ms
        }
        
        for metric, value in performance_results.items():
            unit = {
                'response_time_p95': 'ms',
                'throughput': 'req/s',
                'memory_usage': 'MB',
                'cpu_usage': '%',
                'cache_hit_rate': '%',
                'db_query_time_avg': 'ms'
            }.get(metric, '')
            
            status = "✅" if self._is_performance_good(metric, value) else "⚠️"
            print(f"  {status} {metric}: {value}{unit}")
    
    def _is_performance_good(self, metric: str, value: float) -> bool:
        """Détermine si une métrique de performance est bonne"""
        thresholds = {
            'response_time_p95': 500,  # < 500ms
            'throughput': 1000,         # > 1000 req/s
            'memory_usage': 200,        # < 200MB
            'cpu_usage': 70,            # < 70%
            'cache_hit_rate': 80,       # > 80%
            'db_query_time_avg': 20     # < 20ms
        }
        
        threshold = thresholds.get(metric, 0)
        
        if metric in ['response_time_p95', 'memory_usage', 'cpu_usage', 'db_query_time_avg']:
            return value < threshold
        else:
            return value > threshold
    
    def demonstrate_security_measures(self):
        """Démontre les mesures de sécurité"""
        print("🔒 Vérification des mesures de sécurité...")
        
        security_checks = [
            ("OWASP Top 10 compliance", True),
            ("Input validation", True),
            ("SQL injection protection", True),
            ("XSS prevention", True),
            ("CSRF protection", True),
            ("Rate limiting", True),
            ("Audit logging", True),
            ("Data encryption", True),
            ("Secure headers", True),
            ("Dependency scanning", True)
        ]
        
        for check, passed in security_checks:
            status = "✅" if passed else "❌"
            print(f"  {status} {check}")
    
    def demonstrate_best_practices(self):
        """Démontre l'application des bonnes pratiques"""
        print("📋 Vérification des bonnes pratiques...")
        
        best_practices = [
            ("SOLID principles", True),
            ("Clean Architecture", True),
            ("Type hints", True),
            ("Comprehensive tests", True),
            ("Documentation", True),
            ("Code review process", True),
            ("CI/CD pipeline", True),
            ("Monitoring & logging", True),
            ("Performance profiling", True),
            ("Security audits", True)
        ]
        
        for practice, implemented in best_practices:
            status = "✅" if implemented else "❌"
            print(f"  {status} {practice}")
    
    async def run_complete_demo(self):
        """Exécute la démonstration complète"""
        print("🎬 Démonstration Finale - Module 7")
        print("=" * 60)
        
        # Tests de scalabilité
        await self.demonstrate_scalability()
        print()
        
        # Qualité d'architecture
        self.demonstrate_architecture_quality()
        print()
        
        # Performances
        self.demonstrate_performance_optimizations()
        print()
        
        # Sécurité
        self.demonstrate_security_measures()
        print()
        
        # Bonnes pratiques
        self.demonstrate_best_practices()
        print()
        
        # Métriques finales
        print("📊 Métriques de la démonstration:")
        for metric, value in self.metrics.items():
            print(f"  {metric}: {value}")
        
        print("\n🎯 Démonstration terminée avec succès!")
        print("🏆 L'application est prête pour la production!")

# Points de discussion pour la soutenance
DISCUSSION_POINTS = {
    'architecture': [
        "Quelle architecture avez-vous choisie et pourquoi ?",
        "Comment assurez-vous la séparation des préoccupations ?",
        "Quelle est votre stratégie de testabilité ?"
    ],
    
    'performance': [
        "Quelles optimisations de performance avez-vous implémentées ?",
        "Comment mesurez-vous et surveillez-vous les performances ?",
        "Quelle est votre stratégie de cache ?"
    ],
    
    'scalability': [
        "Comment l'application scale-t-elle horizontalement ?",
        "Quelle est votre stratégie de déploiement ?",
        "Comment gérez-vous la haute disponibilité ?"
    ],
    
    'security': [
        "Quelles mesures de sécurité avez-vous mises en place ?",
        "Comment protégez-vous contre les attaques courantes ?",
        "Quelle est votre stratégie de gestion des secrets ?"
    ],
    
    'quality': [
        "Comment assurez-vous la qualité du code ?",
        "Quelle est votre stratégie de tests ?",
        "Comment gérez-vous la dette technique ?"
    ],
    
    'devops': [
        "Quelle est votre chaîne CI/CD ?",
        "Comment surveillez-vous l'application en production ?",
        "Quelle est votre stratégie de rollback ?"
    ]
}

def prepare_soutenance_answers():
    """Prépare les réponses aux questions de soutenance"""
    answers = {}
    
    for category, questions in DISCUSSION_POINTS.items():
        answers[category] = []
        for question in questions:
            # Réponses préparées (simulées)
            answer = f"Réponse détaillée à: {question}"
            answers[category].append({
                'question': question,
                'answer': answer,
                'key_points': [
                    "Point clé 1",
                    "Point clé 2",
                    "Point clé 3"
                ]
            })
    
    return answers

# Exécution de la démonstration
async def main():
    demo = FinalDemo()
    await demo.run_complete_demo()

if __name__ == "__main__":
    asyncio.run(main())
```

**Démonstration pratique (15 min)**
Exécution de la démonstration finale complète.

**Exercices guidés (10 min)**
1. Préparer les points de discussion pour la soutenance
2. Créer un script de démonstration
3. Pratiquer les réponses aux questions

**QCM d'auto-évaluation (3 min)**
1. Quel est l'objectif de la soutenance finale ?
2. Combien de temps pour la démo ?
3. Que faut-il préparer à l'avance ?

**Réponses et explications**
- Objectif : démontrer la qualité architecturale, les optimisations appliquées, la couverture de tests et la production readiness.
- Temps : 12-15 min (démo) + 8 min Q&A.
- Préparation : script de démo, environnement propre, jeux de données, slides architecture, métriques de perf.

**Devoir**
Préparer et réaliser la soutenance complète du Module 7.

---

**Félicitations !** 🎉

Vous venez de terminer le **Module 7** sur le **projet complet et optimisation : architecture, performance, bonnes pratiques**.

## Annexes enseignant
### Clés de correction et réponses rapide
- Cours 1,2 (SOLID, patterns) : exemple proposé (SRP, OCP, DIP, singleton, factory, strategy). Vérifier la séparation des responsabilités.
- Cours 6 (profiling) : réponse = utiliser cProfile + py-spy, repérer les fonctions > 200 ms, appliquer cache + vectorisation.
- Cours 8 (async) : réponse attendue `asyncio.gather`, éviter `for await` bloquant; utiliser `ThreadPoolExecutor` si I/O.
- Cours 11 (tests avancés) : mutation testing avec `pytest-mutation` ou `mutmut`, couverture > 85%.
- Cours 14 (documentation) : Sphinx `autodoc`, `napoleon`, générer `make html`, publier sur Read the Docs.
- Cours 17 (CI/CD) : pipeline avec quality gates (pytest, pylint, mypy) + déploiement canary + feature flags.

### Erreurs fréquentes + corrections
- Omission des type hints : demander `mypy --strict`.
- Pas de gestion d’exception centralisée : ajouter global handler et logging structured.
- Cache invalide après update : démontrer invalidation (`redis.delete(key)` ou `stale-while-revalidate`).

### Critères de notation
- Architecture propre (layers, découplage et DI)
- Performance (profiling avant/après, latence réduite)
- Code quality (pylint, black, mypy passés)
- Tests (unitaire, intégration, end-to-end)
- Documentation (README + Sphinx + changelog)
- CI/CD (build vert et pipeline complet)
- Infrastructure (Docker + k8s/Cloud ou équivalent)

---

**Feedback enseignant**
- Évaluez la rigueur des élèves à fournir un `CHANGELOG.md`, un `CONTRIBUTING.md` et un `SECURITY.md`.
- Privilégiez le pair-programming sur les exercices 9-12 pour renforcer les patterns.
- Validez les choix d’architecture et leur documentation technique.

**Ce que vous maîtrisez maintenant :**
- ✅ **Architecture avancée** : SOLID, Clean Architecture, DDD, Hexagonal
- ✅ **Performance** : Profiling, optimisation algorithmique, cache, concurrence
- ✅ **Qualité** : Type hints, tests avancés, documentation, code review
- ✅ **Production** : Sécurité OWASP, monitoring APM, scalabilité horizontale
- ✅ **Méthodologie** : Agile, gestion de projet, gestion des risques
- ✅ **DevOps complet** : CI/CD avancé, feature flags, gestion d'erreurs

**L'application "Tâches" est maintenant :**
- 🏗️ **Architecturée proprement** selon les meilleures pratiques
- ⚡ **Optimisée** pour les performances et la scalabilité  
- 🔒 **Sécurisée** selon les standards OWASP
- 📊 **Monitorée** avec métriques et observabilité complètes
- 🧪 **Testée** avec couverture complète et tests avancés
- 🚀 **Prête pour la production** avec déploiement automatisé

**Vous êtes maintenant un développeur full-stack professionnel capable de :**
- Concevoir des architectures maintenables et évolutives
- Optimiser les performances des applications
- Appliquer les bonnes pratiques de développement
- Gérer des projets complexes avec méthodologie agile
- Déployer et maintenir des applications en production
- Travailler efficacement en équipe avec code review et CI/CD

**Prochaines étapes :**
Continuez à développer vos compétences en explorant de nouvelles technologies, contributez à des projets open source, et partagez vos connaissances avec la communauté !

**Ressources recommandées :**
- [Clean Architecture](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)
- [Domain-Driven Design](https://dddcommunity.org/)
- [OWASP](https://owasp.org/)
- [Performance Python](https://github.com/TheAlgorithms/Python)
- [Type hints](https://mypy.readthedocs.io/)

Félicitations pour avoir terminé cette formation complète ! 🚀✨
```