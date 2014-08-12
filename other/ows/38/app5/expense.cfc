<cfcomponent persistent="true" table="expenses">

    <cfproperty name="id" column="expenseid" fieldType="id" generator="increment">
    <cfproperty name="amount" column="expenseamount" ormtype="float">
    <cfproperty name="description" ormtype="text">
    <cfproperty name="date" column="expensedate" ormtype="date">

    <cfproperty name="film" fieldtype="many-to-one" cfc="film" fkcolumn="filmid">

</cfcomponent>