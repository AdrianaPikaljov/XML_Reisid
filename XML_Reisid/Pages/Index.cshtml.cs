using Microsoft.AspNetCore.Mvc.RazorPages;

namespace XML_Reisid.Pages;

public class IndexModel : PageModel
{
    public string TransformedXml { get; private set; }
    private readonly IWebHostEnvironment _env;

    public IndexModel(IWebHostEnvironment env) => _env = env;

    public void OnGet()
    {
        TransformedXml = XsltHelper.Transform(_env, "ElisavetaSugupuu.xml", "SugupuuParing.xslt");
    }
}
