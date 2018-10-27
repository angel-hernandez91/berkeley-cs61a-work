def do_and_form(expressions, env, tail = False):
    """Evaluate a short-circuited and form."""
    if expressions is nil:
        return True
    exp = scheme_eval(expressions.first, env)
    if scheme_false(exp) or len(expressions) == 1:
        return exp
    else:
        return do_and_form(expressions.second, env)

def do_or_form(expressions, env, tail = False):
    """Evaluate a short-circuited or form."""
    if expressions is nil:
        return False
    exp = scheme_eval(expressions.first, env)

    if scheme_true(exp) or len(expressions) == 1:
        return exp
    else:
        return do_or_form(expressions.second, env)