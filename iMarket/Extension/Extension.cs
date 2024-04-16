using System.Text.RegularExpressions;

namespace iMarket.Extension
{
    public static class Extension
    {

        //---------------- CHUYỂN SỐ THÀNH VNĐ
        public static string toVND(this double unitPrice)
        {
            return unitPrice.ToString("#,##0") + " vnđ";
        }        
    }
}
