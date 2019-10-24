import { ValidationModel } from "./validation";

function CategoryModel(category) {
  const constraints = {
    name: {
      presence: true,
      type: "string",
      length: {
        minimum: 1,
        message: "Please enter a name."
      }
    },
    parentId: {
      presence: false,
      type: "string"
    }
  };

  const validation = ValidationModel(category, constraints);
  const fields = validation.fields();

  function valid() {
    return validation.valid(fields);
  }

  function validValues() {
    return validation.validValues(fields);
  }

  return Object.freeze({
    fields,
    valid,
    validValues
  });
}

export { CategoryModel };