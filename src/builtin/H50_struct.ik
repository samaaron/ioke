
Struct = fn(+attributes, +:attributesWithDefaultValues,
  attributeNames = attributes + attributesWithDefaultValues map(key)
  val = fn(+values, +:keywordValues,
    Struct internal:createInitial(val, attributeNames, attributes, attributesWithDefaultValues, values, keywordValues)
  )
  val attributeNames = attributeNames
  val mimic!(Struct)
  val)

Struct internal:createInitial = method(val, attributeNames, attributes, attributesWithDefaultValues, values, keywordValues,
  result = fn(+newVals, +:newKeywordVals,
    Struct internal:createDerived(result, attributeNames, newVals, newKeywordVals))
  result mimic!(val)
  (attributesWithDefaultValues seq +
    attributes zipped(values) +
    keywordValues seq) each(vv,
    result cell(vv first) = vv second)
  result)

Struct internal:createDerived = method(orig, attributeNames, newValues, newKeywordValues,
  res = orig mimic
  (newValues zipped(attributeNames) mapped(reverse) +
    newKeywordValues seq) each(vv,
    res cell(vv first) = vv second)
  res
)

Struct create = method(+values, +:keywordValues,
  @ call(*values, *keywordValues)
)

Struct mimic!(Mixins Sequenced)
Struct seq = method(
  attributeNames mapped(name, name => @cell(name))
)

Struct attributes = method(
  attributeNames fold({}, d, x, d[x] = @cell(x). d)
)