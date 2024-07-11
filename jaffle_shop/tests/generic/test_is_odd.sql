{% test is_odd(model, column_name) %}

with validation as (

    select
        {{ column_name }} as even_field

    from {{ model }}

),

validation_errors as (

    select
        even_field

    from validation
    -- if this is true, then even_field is actually even!
    where (even_field % 2) = 0

)

select *
from validation_errors

{% endtest %}