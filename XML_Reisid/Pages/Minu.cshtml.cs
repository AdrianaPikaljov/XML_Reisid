using Microsoft.AspNetCore.Mvc.RazorPages;

namespace XML_Reisid.Pages;

public class MinuModel : PageModel
{
    public string TransformedXml { get; private set; }
    private readonly IWebHostEnvironment _env;

    public MinuModel(IWebHostEnvironment env) => _env = env;

    public void OnGet()
    {
        TransformedXml = XsltHelper.Transform(_env, "MinuSugupuu.xml", "SugupuuParing.xslt");
    }
}
