using System.Xml.Xsl;

namespace XML_Reisid;

public static class XsltHelper
{
    public static string Transform(IWebHostEnvironment env, string xmlFile, string xsltFile)
    {
        try
        {
            var xmlPath = Path.Combine(env.ContentRootPath, "wwwroot", xmlFile);
            var xsltPath = Path.Combine(env.ContentRootPath, "wwwroot", xsltFile);

            if (!File.Exists(xmlPath) || !File.Exists(xsltPath))
                return "<p class='text-danger'>Error: XML or XSLT file not found.</p>";

            var xslt = new XslCompiledTransform();
            xslt.Load(xsltPath);

            using var sw = new StringWriter();
            xslt.Transform(xmlPath, null, sw);
            return sw.ToString();
        }
        catch (Exception ex)
        {
            return $"<p class='text-danger'>An error occurred during XML transformation: {ex.Message}</p>";
        }
    }
}
