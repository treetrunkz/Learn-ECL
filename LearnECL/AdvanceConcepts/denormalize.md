# Denormalize

This function is used to combine parent and child recordset.

## Transform

- `LEFT` Combined layout of parent and child layout.
- `RIGHT` Take the child layout.
  `COUNTER` Can be added as an optional parameter
- Transform result outcome is usually the same format as your LEFT record layout.

```java
ParentResultLayout out xFormName (ParentResultLayout L,
                                  childLayout     R,
                                  INTEGER            C) := TRANSFORM
        ....
        ....
END;

AttibName := DENORMALIZE(Parent Dataset, child Dataset,
                        LEFT.fieldName = RIGHT.fieldName,
                        xFormName(LEFT,
                                   RIGHT,
                                   COUNTER //Optional
                                   ));
```

## Resources

Put it into practice [denormalize.ecl](https://ide.hpccsystems.com/workspaces/share/291d17d9-e5cb-4fac-83c2-ac5997c28a31)

Please visit [DATASET](https://hpccsystems.com/training/documentation/ecl-language-reference/html/DENORMALIZE.html) for more information.
