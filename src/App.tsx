import { useEffect, useState } from "react";
import TodoItem from "./TodoItem";
import { Construction } from "lucide-react";

type Priority = "Urgente" | "Moyenne" | "Basse";

type Todo = {
  id: number;
  text: string;
  priority: Priority;
};

function App() {
  const [input, setInput] = useState<string>("");
  const [priority, setPriority] = useState<Priority>("Moyenne");
  const savedTodos = localStorage.getItem("todos");
  const initialTodos = savedTodos ? JSON.parse(savedTodos) : [];
  const [todos, setTodos] = useState<Todo[]>(initialTodos);
  const [filter, setFilter] = useState<Priority | "Tous">("Tous");
  const [selectedTodos, setSelectedTodos] = useState<Set<number>>(new Set());

  useEffect(() => {
    localStorage.setItem("todos", JSON.stringify(todos));
  }, [todos]);

  function addToDo() {
    if (input.trim() === "") return;
    const newToDo: Todo = {
      id: Date.now(),
      text: input.trim(),
      priority,
    };
    setTodos([newToDo, ...todos]);
    setInput("");
    setPriority("Moyenne");
  }

  function deleteTodo(id: number) {
    const newTodos = todos.filter((todo) => todo.id !== id);
    setTodos(newTodos);
  }

  function toggleSelectedTodo(id: number) {
    const newSelected = new Set(selectedTodos);
    newSelected.has(id) ? newSelected.delete(id) : newSelected.add(id);
    setSelectedTodos(newSelected);
  }

  function finishSelected() {
    const newTodos = todos.filter((todo) => !selectedTodos.has(todo.id));
    setTodos(newTodos);
    setSelectedTodos(new Set());
  }

  const filteredTodos: Todo[] =
    filter === "Tous" ? todos : todos.filter((todo) => todo.priority === filter);

  const urgentCount = todos.filter((t) => t.priority === "Urgente").length;
  const mediumCount = todos.filter((t) => t.priority === "Moyenne").length;
  const lowCount = todos.filter((t) => t.priority === "Basse").length;
  const totalCount = todos.length;

  return (
    <><button
      className="btn btn-outline center mx-200"
      onClick={() => {
        const html = document.documentElement;
        const current = html.getAttribute("data-theme");
        html.setAttribute("data-theme", current === "dark" ? "light" : "dark");
      }}
    >
      Switch Thème
    </button><div className="flex justify-center">
        <div className="w-2/3 flex flex-col gap-4 my-15 bg-base-300 p-5 rounded-2xl">
          <div className="flex gap-4">
            <input
              type="text"
              className="input w-full"
              placeholder="Ajouter une tâche"
              value={input}
              onChange={(e) => setInput(e.target.value)} />
            <select
              className="select w-full"
              value={priority}
              onChange={(e) => setPriority(e.target.value as Priority)}
            >
              <option value="Urgente">Urgente</option>
              <option value="Moyenne">Moyenne</option>
              <option value="Basse">Basse</option>
            </select>
            <button onClick={addToDo} className="btn btn-primary">
              Ajouter
            </button>
            <button
              className="btn btn-primary"
              disabled={selectedTodos.size === 0}
              onClick={finishSelected}
            >
              Finir la sélection
            </button>
          </div>
          <div className="space-y-2 flex-1 h-fit">
            <div className="flex flex-wrap gap-4">
              <button
                className={`btn btn-soft ${filter === "Tous" ? "btn-primary" : ""}`}
                onClick={() => setFilter("Tous")}
              >
                Tous ({totalCount})
              </button>
              <button
                className={`btn btn-soft ${filter === "Urgente" ? "btn-error" : ""}`}
                onClick={() => setFilter("Urgente")}
              >
                Urgentes ({urgentCount})
              </button>
              <button
                className={`btn btn-soft ${filter === "Basse" ? "btn-success" : ""}`}
                onClick={() => setFilter("Basse")}
              >
                Basses ({lowCount})
              </button>
              <button
                className={`btn btn-soft ${filter === "Moyenne" ? "btn-warning" : ""}`}
                onClick={() => setFilter("Moyenne")}
              >
                Moyennes ({mediumCount})
              </button>
            </div>
            {filteredTodos.length > 0 ? (
              <ul className="divide-y divide-primary/20">
                {filteredTodos.map((todo) => (
                  <li key={todo.id} className="py-2">
                    <TodoItem
                      todo={todo}
                      isSelected={selectedTodos.has(todo.id)}
                      onDelete={() => deleteTodo(todo.id)}
                      onToggleSelect={() => toggleSelectedTodo(todo.id)} />
                  </li>
                ))}
              </ul>
            ) : (
              <div className="flex justify-center items-center flex-col p-5">
                <Construction strokeWidth={1} className="w-40 h-40 text-primary" />
                <p className="text-sm">Aucune tâche pour ce filtre</p>
              </div>
            )}
          </div>
        </div>
      </div></>
  );
}

export default App;
