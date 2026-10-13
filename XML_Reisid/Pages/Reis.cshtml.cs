using Microsoft.AspNetCore.Mvc.RazorPages;

namespace XML_Reisid.Pages;

public class ReisModel : PageModel
{
    public string TransformedXml { get; private set; }
    private readonly IWebHostEnvironment _env;

    public ReisModel(IWebHostEnvironment env) => _env = env;

    public void OnGet()
    {
        TransformedXml = XsltHelper.Transform(_env, "XMLreis.xml", "ReisiParing.xslt");
    }
}
