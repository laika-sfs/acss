List<string> formulaList = new() {
    "OUTPUT = AddHeightMap(Perlin,19030.8016515536, 35)",
    "OUTPUT = AddHeightMap(Perlin,2452.54445075783, 5)",
    "OUTPUT = AddHeightMap(Perlin,1319.46891450771, 1)",
    "OUTPUT = AddHeightMap(Venus, 1884955.592153875, 4000)",
    "PLAINS = AddHeightMap(Venus_Plains, 1884955.5921538759, 1)",
    "OUTPUT = AddHeightMap( Perlin,6283.18530717959, 8, Curve1, PLAINS)",
    "OUTPUT = AddHeightMap( Perlin,3490.65850398866, 5, Curve1, PLAINS)",
    "OUTPUT = AddHeightMap( Perlin,1449.96584011837, 1.6, Curve1)",
    "OUTPUT = AddHeightMap( Perlin,942.477796076938, 1.5, Curve1, PLAINS)",
    "M = AddHeightMap( Perlin,47123.8898038469, 1, Curve2, PLAINS)",
    "OUTPUT = AddHeightMap( Perlin,26927.9370307697, 200, Curve1, M)",
    "M2 = AddHeightMap( Perlin,269279.370307697, 1, Curve2, PLAINS)",
    "OUTPUT = AddHeightMap( Perlin,94247.7796076938, 1300, Curve1, M2)",
    "OUTPUT = AddHeightMap(Perlin,15079.644737231, 1, Curve8)",
    "OUTPUT = ApplyCurve(Curve8)",
    "OUTPUT = ApplyCurve(Curve8)"
};

const string TAB = "    ";

foreach (string formula in formulaList) {
    Console.WriteLine($"Formula: {formula}");
    string name = formula.Split("=")[0].Trim();
    Console.WriteLine($"{TAB}Name: {name}");
    string parameters = formula.Split("(")[1].Replace(")", "").Replace(" ", "").Trim();
    Console.WriteLine($"{TAB}Parameters: {parameters}");
    string[] parametersSplit = parameters.Split(",");
    string heightmap;
    decimal width, height;
    string? modifier, addOnFormula;
    if (parametersSplit.Length == 1) {
        modifier = parameters;
        Console.WriteLine($"{TAB}{TAB}Modifier: {modifier}");
    }
    else if (parametersSplit.Length >= 3) {
        heightmap = parametersSplit[0];
        decimal.TryParse(parametersSplit[1], out width);
        decimal.TryParse(parametersSplit[2], out height);
        modifier = parametersSplit.Length >= 4 ? parametersSplit[3] : null;
        addOnFormula = parametersSplit.Length >= 5 ? parametersSplit[4] : null;
        Console.WriteLine($"{TAB}{TAB}Heightmap: {heightmap}");
        Console.WriteLine($"{TAB}{TAB}Width: {width}");
        Console.WriteLine($"{TAB}{TAB}Height: {height}");
        Console.WriteLine($"{TAB}{TAB}Modifier: {modifier}");
        Console.WriteLine($"{TAB}{TAB}Add-On Formula: {addOnFormula}");
    }
}