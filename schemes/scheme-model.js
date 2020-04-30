const db = require("../data/config")

function find() {
    return db('schemes');
}

function findById(id) {
    return db('schemes')
        .where({ id })
        .first();
}

//{ id: 17, scheme_name: 'Find the Holy Grail', step_number: 1, 
// instructions: 'quest'}
function findSteps(id) {
    return db('steps as st')
        .join('schemes as s', 's.id', 'st.scheme_id')
        .where('st.scheme_id', id)
        .select('s.id', 's.scheme_name', 'st.step_number', 'st.instructions')
        .orderBy('st.step_number')
}

function add(scheme) {
    return db('schemes')
        .insert(scheme)
        .then(id => {
            return findById(id[0]);
        })
}

function update(changes, id) {
    return db('schemes')
        .where({ id })
        .update(changes);
}

function remove(id) {
    return db('schemes')
        .where("id", id)
        .del();
}

module.exports = {
    find,
    findById,
    findSteps,
    add,
    update,
    remove
};