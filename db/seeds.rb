User.create(
  [
    { name: 'admin', email: 'admin@teste.com', password: '1234' },
    { name: 'Usuário 1', email: 'user1@teste.com', password: '1234' },
    { name: 'Usuário 2', email: 'user2@teste.com', password: '1234' }
  ]
)

Task.create(
  [
    { name: 'Tarefa 1', description: 'Primeira tarefa', status: 2, due_at: Time.zone.now + 1.weeks, priority: 1, user_id: 2 },
    { name: 'Tarefa 2', description: 'Segunda tarefa', status: 0, due_at: Time.zone.now + 2.weeks, priority: 0, user_id: 2 },
    { name: 'Tarefa 3', description: 'Tarefa urgente', status: 1, due_at: Time.zone.now + 3.weeks, priority: 2, user_id: 2 },
    { name: 'Tarefa 4', description: 'Outra tarefa', status: 0, due_at: Time.zone.now + 4.weeks, priority: 0, user_id: 3 }
  ]
)