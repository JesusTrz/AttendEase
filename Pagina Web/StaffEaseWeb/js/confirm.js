document.addEventListener('DOMContentLoaded', () => {
    const searchForm = document.getElementById('searchForm');
    const editForm = document.getElementById('editForm');
    const deleteForm = document.getElementById('deleteForm');

    searchForm.addEventListener('submit', (event) => {
        const userId = document.getElementById('usuario_id').value;
        if (userId) {
            if (!confirm('¿Estás seguro de que quieres buscar este usuario?')) {
                event.preventDefault();
            }
        }
    });

    editForm.addEventListener('submit', (event) => {
        if (confirm('¿Estás seguro de que quieres guardar los cambios?')) {
            return true;
        } else {
            event.preventDefault();
        }
    });

    deleteForm.addEventListener('submit', (event) => {
        if (!confirm('¿Estás seguro de que quieres eliminar este usuario?')) {
            event.preventDefault();
        }
    });
});
