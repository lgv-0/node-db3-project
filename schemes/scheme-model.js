const DB = require("knex")(require("../knexfile").development);

function find()
{
    return DB("schemes").select("*");
}

function findById(id)
{
    return DB("schemes").select("*").where("id", id).first();
}

function findSteps(id)
{
    return DB("steps")
        .join("schemes", "steps.scheme_id", "=", "schemes.id").where("schemes.id", id)
        .select("steps.id", "schemes.scheme_name", "step_number", "steps.instructions").orderBy("step_number");
}

function add(scheme)
{
    return DB("schemes").insert(scheme);
}

function update(scheme, id)
{
    return DB("schemes").update(scheme).where("id", id);
}

function remove(id)
{
    return DB("schemes").where("id", id).first().del();
}

module.exports =
    {
        find,
        findById,
        findSteps,
        add,
        update,
        remove
    }