set global max_allowed_packet=4194304;

DROP DATABASE IF EXISTS `gestion_produit`;
CREATE database gestion_produit;

USE gestion_produit;

CREATE TABLE categorie (
  id int(11) NOT NULL,
  nom varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO categorie (id, nom) VALUES
(1, 'Quincaillerie'),
(2, 'Peinture'),
(3, 'Electricité'),
(4, 'Plomberie'),
(5, 'Outillage'),
(6, 'Matériaux');


CREATE TABLE `produit` (
  `id` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `description` varchar(2500) NOT NULL,
  `prix` float NOT NULL,
  `image` longtext NOT NULL,
  `id_categorie` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO `produit` (`id`, `nom`, `description`, `prix` , `image` , `id_categorie`) VALUES
(4, 'Fixman 365265 Coffret de 780 Vis à tête fraisée Bichromatées', 'Matière : Acier allié\r\nMarque : Fixman\r\nDimension : 26 x 10.6 x 4 cm\r\n\r\nAcier zingué jaune passivé pour résister à la corrosion', 16.1, '/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkJCggKCAsLCQsKCwsLDhAMCgsNExcVEBQPFhISDhYSDxQPDxQSFBgTFhQZIBoeGRgrIRwkExwdMiIzKjclIjABBgsKCw0OCwwMDg4MDRAOHRQNDCIUFRcOHggXDBAWEBEXCxATFAsRGREeCRkMCCIYHRQPHRANDA8WEAsUFSMWGP/CABEIAjkDMwMBIgACEQEDEQH/xAAbAAEAAgMBAQAAAAAAAAAAAAAABAUCAwYBB//aAAgBAQAAAAD7iDyNvzAAAAAAAAAAAAAAAAECqxlTZmYAAAAAAAAAAAAAAAHP6sXnsmbPyAAAAAAAAAAAAAAAItI8eMSVOm7AAAAAAAAAAAAAAARqnT4PPMT2TKlycgAAAAAAAAAAAAADyogvcTzxj7jqxsrPfu9AAAAAAAAAAAAAApY/mDHwZao+id7nskT92/0AAAAAAAAAAAAA1xImlj7rw8ePGv3TX+2siZNmegAAAAAAAAAAAAGEXdWxHnmPhrwx1R5+zWynz52QAAAAAAAAAAAAAwq4Xh5jhh5g8y9PHs6fP2AAAAAAAAAAAAAGNdWvRH045sNWvZtyyJdjN3gAAAAAAAAAAAAPK2ux999e6NGrzHR62Z7NvuyXJlyfQAAAAAAAAAAAAeV1VzOFvbHumLqxxZm3dv3MJkqZ6AAAAAAAAAAAAIHx+glbp3RX009xjR9fvuzPdnikZa9thMyAAAAAAAAAAABVfIaHV5YyvfbPor7b68w06cPdmXuO73HRj7Nsp2wAAAAAAAAAABSfHa2LT/aed5e1Pd150Vq8yyx1x9eTP2PrbPXsuzn7QAAAAAAAAADznPj1dph6exqoFzonbT2XdXFrvPdUfViw04Nuez17LsLLcAAAAAAAAADkvkEKLHn2sCtvYOm2jZTd7Jssba1st/mOGvRF16tm70z9ZzrGduAAAAAAAAAcJ8njRI87melj7a7rt1But91X7N37dfnu6bc21ln5lqiRvM9mWPjPyPts7Gw2gAAAAAAAHnzjhNlBXTvai6o5detsbibWYWG6Nqqul25SajRa3d/cbmeqHCbNmbyLolZ5T7SftAAAAAAADH5h8zrelsUfnNdlLnUtdcbZ+vdWcrv6HkMOikXEflOh355zbe8t5O3bFhRMs/TDVhp9lW1jYbQAAAAAANXyvhK2j6K0y2WFfhMq7WrkY+SIcuN1PP8AFeT5s/n63ru/+bR+k2e7La8uJmecOBqz2MYsXT7vkyrKxnbQAAAAADR8j5CNW0kvo5mTLZNrqOgzvNWrQ82bZ3T8/spK7qu1ifM8eqlYeTc8rS9uZ2eMKKzy0wtU7PRqkz5s6fsAAAAACJ8g5uJUdz846Guny9vvvuafV0lPtuJdl7FqbmLQwYv0uVXclZyrLmOsqbrXK142PQ3Vgw0acM9cfCVKzyi+ezrKdsAAAAAr/j9HoqKvv+S7n5vJtdsSXIkUlszlwaekgz8vpvM0NdcN2qwnzamt09jQa73ZTe9BzF3Z3l9Y57o8bDTW+XknPRT+yJM6bP2AAAAFT8hqdFZr8qbyFYVk6twx6PXW2swZSvIlRZ83jVweltMN0/CDWdDhnUT4sHpItXZXvnky8ubqXjF1xvN3uz3Rtx1vZ86bn6AAAKP5bR6YEWRU1nVVd9Ei9VwN/PrKiR0G3Lw9lxJlVzU/CPol79FxBsaTbcVsaF0mEKv3dBZevfd9ze3MrCJh57lltzNerHCfZTsgAAec78eruo1Q+SrtE1b5Ue2x0zJmnk9F1byWrbNhcnYX0zCnp9SfznSbLSriT6SVaeV8W7n8pY323TlN26t9tezrLzVrarP3AaNXmV5YegADlflNXS21jJm1lLzNrUX6Rz0u20z6Su32U6squ71c9XW0iaky42ugorG9o84N9rmqautbmt9u9VZhD7TTEsmeFn0d1KacNsv33Xo2Qtnu68kgAON+ZUvQ+cBe2ObbYRubrrDmbe2h1snGrnX/ADGm46SlrtvS50UKdaepeqvq4lV0UnTOp4lVs6C4saGXUZTJsOx1b52mXSS+i6K8zyza8NciJt9wxsbbcAPOF+c6eZgS+8pqKdY7XudjhylCsbHVR7rG1kR5dXAzn6PJMHfP4+4s8ZO/OFV42NPorKybf3cSZzc6tuazfJ8lVXU+83v6Tzdf9Bbbs9OjDVKe+YeW1n6Bj874TRordEHTZ9Jhz0m02vWdhhQcdp6vkungdhnTx6r6Lydb2PJedLlWTuUtNybnIz1VnO54R+l3wbXDk5vYY0E7m7qN01JUauosWOUzoL222ZxI0nLzzHHbcTQw+Y8drjaUCk+k+/NPeotqLRaSMzzbKq6Cgv5HQ1VdZQJVXe1tzUSPdWW2tua3dDvuSu7TdVUmdtC15dDyOm+iyZdfZWVFogxpvQbzLLKXdXlvujYSHmTyTc7Hnyjk9cfXtp+r4dY9bxUbRddDSwbOcMfN8rTZcrEp9td0ltV+VF9OrZtxxlZ00LDqudpPOhmbN++lpd2jfb8X1fMWfcRZ/OxNOjDZYy5HmeWWTLdY3dnM2bMvGSxssPjtDXVPY0nIbOpic9YX0us8gY9XAq51i8wT9lbdwec562hy6rplzFrLOktoNb1mqnj2XD/TI2XuvHbMr6Sl6zntMvqbuhgxtevXlNlSffW3LP33PL3fadDZ5+5ebOjfHt0SrgWVVX9DzMiqy09PprL2HTXG6n2WeVhIoqPr9e+RU1PO28Kxq/d1pAkc90f0fhaup6eqv66RX7IHU7NEmXp0cXv7PREhxtPRc7b69e/Pf5ssYddlKk7duGNz08zflZXFB82w25b8eW5mdN5Tod9Wy6erw6SujT6vmuovKirqba13+Nm/Cn5W3opevtOYndPSRIcq138hhhpl7rzfBiXPuUrCbRQtVdB+j8P5PuKjVKk6/JdhUxbapsLJl7c9NZ382m+Uwpm/3P3dX48zH37NkPLRq3VOmzi3PS1sbtfkmno5ezPLHzfuh1XG7p99axKPD6F8/t4FNd6LPleok66i3qarobbbz3TYwOHresuea3a7dRz9uOuzst9ZWaejpt1tZ9j1dx64Xi4+mRM99Zb6D5qxTp8TyXQau/v6rRQdBbR+e1z5Gfob91Bsl+V+uF01vVcdh0VFdYWPlTpsqeo6DsOe5roLDbIq6Sw287nV3NzXVtj0Wmbylnb+cxEk2P0Of9MFB8x389jde7PfXtNxurPdAh3GU3b1Nbqr+Q+i87s7qw5WgznbMwTpUTl4OzpNHQcbM3RIdnjD1bq3sKfoamLzci/k+pExU8xp2bbG0r90nKu5yVZXXLSvo6k+/wDpE+P+09ZY7JG3brwsuJ5aw2YY+U/SdtV69PL132CLr46u6S53c1XTp2zJjizlbqitpvJ/Ta6BcbtMuPGp+rwr48jlpt5v9k+w7GTTxYsOq6uw4iyvue2V1lt+hSOe6P676efIIFVYaK7HbYU++2vfnXMV9pY43/SRNcSFxse5rLzsLPDk6i0usOf1T5mXj3zJJ2VVbJ0QO8g1VD2Mjiuv9h1EVc8z7f2lc5/qs/ZW6pp+fttlVc0dxhYWfZ0mn7RbBznzbXjszi1kriOpk9P784qquv6v6bXN+32LC1VMGPok2lnLp6W8l48/lPkZgSZNVzULp9EXoLLlemg13Ndro3fOl59F5y54OzssvcvNk3ZXU/J2OiRafTa2n6L7GBo5Lkq3145GfdZXkf5pU3vfUevyXv8AR5u3YVmFXSa+jnY1VhLrqrfYbT3E9lIvHa/LrsIEfnK2xk9j8+pul7n559B5m60wNE6DJ35ZSN/tfy303Lm+jk/XQBT8ly0fLVlYQJFlp4y22exYWUrft2nr03ZxeY5KL01zN0SMK6BNl++ngl+VPT1WupsOOtEP6vX8nf8Azj6JylrNibq6isrfZlk8y6pQWsyx+ogAw5zlOaTttRLsc+Cqu900+jLdI3bs9h7488z2U/K8vlc9FZ71PFwsM8jx5neVU/RI4O0j9jO4GHWdlyfTaI3R4TVdlsjwNMyZbW1Vpu8O360AAj8rztZsop1jnyFF1sqiPd+zbt2Z5evPPPPNnnLctXSJXY7p8Xi58/dsYugp+U6KXP31VZBr9uuj7jj+6mcR09PK6fmp3TVPGWdlj3NZV9D5K+s+gAB58yp8qKTZ5w+Iselq4Zu837NuWeeRj55j7Ji8tC1RZVvhx8223yfb+Jz1H91+Vy5vm6Z7Bgc7cTa6r6K4q+r4eTT9nQUttF+iaqG9zw+j9CAABp+VQ86bXb7dnNc900+o04tmzbs2Z7MmTzHzH2Xz9f5qnT4ddR5zOkmXHyyf3MHhryxwN0zfHoqqxs+R7Osr+xouO6aN732/n7Gbj0H0b0AABA+Vx8NNVcSM8OYrulkVkP3PLPZns2ZZZ5PMfGyRX8pov+B3dzphdNSdxy3P9HYUXPSM98nZ7lKkxMOa3w+p52l6roOV1dF1NPquPJf1r0AAAUnzCF5No5Flns0c3A6OVBrXuzPLZnlszzy9eYpFbwejdzu67+i1nOU9/c1q1kc5WyfJ0rdnkk762kzrLe1o7Tb2dfUdBjJ+ozgAAAc78t0TZNbW2MvPPyhqbO31VcX3LLPZnnszy25PMfN/CcvunfQYOqi52Xl0+6uqru8ixqfRMmyGefs3Ks5eJIrvsygvc530ix9AAAAruTm9TynE1MWxk55SKuni3MyPWwvctuWzPZt2Z5mG+i5LvIenXRcz1Vjz8e26CPQbLS2r9HR83z9zaZes5mFJ0ltRTpu365uAAAAAQ/n/AD1bHnSc8tvtZUx7WXq0QomzPPPbu25Ze+TamPpwg8/T2vdcLuhY33Sb+dqd9xY01KsZ8nPLzC6tq2Nd4dr2YAAAAA8ouHqIMWRLzz9k41UKDssJenDHToxz27M9tpzWGMbl5mW7feY0mmXEx6edyfP6L64301ZnZzvZ3Vwae/8AN32D0AAAAADneJq48TyTuyz9y3RocaNpylSdz0m0Vdlpp9u+t6Dk90rrKynurGrr76042FKynWql0RvqGqkt9uPfdWAAAAAAKbiqBHi+79mR7ls3a42nToxg5XFNqxoLHnsOok0tAtOl28povOv8+ddX5zXRyuYt7Ln+6sajdPwtvqYAAAAAAGjkuSh+6Y2nLdll6ZM89nvrXj5GzkaGWzPXui8LWz6fpaXblZyK+s565ubzrayLceZfVbEAAAAAAAU/M81Dz1x4+pu2e+5evccssvffPR4w9279XP8APVl3xO21s4UTOFe/UoVN0WjL6F04AAAAAAAHlZznPUrPHVo16nuWfueWWXvr3zx5jltz9SNFbzHKwpnc8xhq+u+0N3t09x2foAAAAAAAAeVFFSUcHPa8a9erP3x69yz9y16sJO/09kROL5Xsrzkezt6OZNz7brgAAAAAAAAAa6qBV1tfCia3r09NcTHpeOud+Xp6z8op8yfVQ7zHtezAAAAAAAAAAAOR+c4eHvvuMeJlecpa47tmzP3Fk2Z66XofN31/YAAAAAAAAAAAc98u1AY6YudtynZV2jVnt36PduWeyptZGHcdmAAAAAAAAAAAI3xqP54e+eadPkzXM3otTh0VNZxNGftjJ1yvruYAAAAAAAAAAAVPzyqweeeeY4tez1ltUd7wfWT8m3Zhh9K6IAAAAAAAAAAAAAGvmOV57ES+Wu83u+TrvvpnoAAAAAAAAAAAAABo5TlaNnqyPd+7f9YlgAAAAAAAAAAAAAAQ+S5Os8Mt276T0QAAAAAAAAAAAAAAA8q+V5OCk932oAAAAAAAAAAAAAAADyip7m9AAAAAAAAAAAAAAAAAAAAD/8QAGQEBAAMBAQAAAAAAAAAAAAAAAAECAwQF/9oACAECEAAAABWUgAAAAAAAZE2mQAAAAAABSoTaZAAAAAAAUqQktMyAAAAAACIrUkTNpAAAAAABWhEgm0yAAAAAAMsryBWbXmQAAAAAZ4Z22iUoiUrWmQAAAAGWdeLfWuskzUvBa0yAAAAM81ObSjDptpdEgTNrTIAAAMV65c9aVjWvXeuMdMiCbStaQAAGGeXTorFM6Zw7Xgd2zbRKYiwteZAAIxrHJXfsc/QRjN8sMWmV7doIm0Whe0gBGdKZ15uqOfo7SaWyzrFKWvrfPfO1ZlaaQm97AIw5eyYzzwtR05dSuPRaIyrTXVxU12xvfUQiZvpIVxinNbrurTCb8nZPNec97aWzsee0pNrdFpiAL6SrgjDj6aW6dxlM451tEb010uxypS8c3fqmYQEW0vSnn5axpkpp09SsTWlKWTOvJpjOttubXHonKm9pw0mJlO1DPLmyvW0OnoyttEUiaWnmw1vbnp2dVZivm9OV4rSeqdpvetZgzxrNdb2xy110mFYz4uftyvhrHVveYw598cqztlfp11mKLKuSc79EzhSIy36LkVry54X5+3vnm688eiM7cutE9F9StSLU5uibIic8cb5316LEVyy5/Rthxenx031vZSK3te4RWqYraYBFbZZYab72FHLFa11jnr166pmNLgK0tEAAjLCj0iI4uic8ZRlF+bs16InYAVpZEAA5+XH0L6cLyvY6NGFOewv1mtgApSbKgBNaXtWOLCNdOu0qUynbSmtwAKzEFQAQl5vTljW0dnTZFJjS4AAKJVgARTliKW556qU26dYNgAACsJhAgYK74Vc/RjffPpNbAAABEQSRMQiSI5uiuW0zXTQAAAAREBE1TMFXF0axfQAAAAAVrMRKLTBFUbgAAAABFKi0ExKtdbgAAAAAAitSYhsAAAAAAAIrERrIAAAAAAAEJAD/xAAZAQEBAQEBAQAAAAAAAAAAAAAAAQIDBAX/2gAIAQMQAAAAFQAAAAAAAB0RmAAAAAAABrQTKAAAAAAANaFhmQAAAAAABdaIMxAAAAAAAXRqIEyAAAAAAG+mLBZqTOQAAAAAN9dOViVSSZgAAAABvrfTnhrnCKZqTMAAAADXS721OvPjnM0AkzIAAAB0vO77dsXXO8JrvfNItXOEkAAAO3Tr5uS6dGrvg+p5+c44spYTOUAAHbd9meHld/OXsxvr6Jy688eZKtkZ1M5AA3vffp14N8fJizeOvW6upOGbjUozN1mYgC9fZ4sa9HW3py464410489b3rpz4vVvly64ximqzJiBerr0z58tXvp28WOu8b4zGekt9NxZM85Kti5zgvVr0Wax5+Vl64dW4mdcs4u+u7LeGLIthbOeda9i1u3hy8+dVd3RnOO2tznnl6M3E69PPmducslnOy769+8s3PJ5+vLNK3h19OeV3vycS9Pdz6YujzYxiZBevZbjln1b5cOY26+nfHed85y4SXv3z21qc98/LyyVmnq0nCXv11OWOOY1vfXeq5+Oejz63yvaenG8482YVLc69fPjk1d9dzeOHJDfTpry57dfN6GOeJdb3xwgLC6kAu3Xp1x5+EG8+jXQ5a6XjyxZm5ALcXSBFNdd9OflhrvzdOudZ6Xl248+FZAFSbIVJU7988WN9Po/P44dt9bnB5pcAAaYtUqSGtzNvp7MZ4YmddOuOWLIABUitECVtL9Dhrrc78vmyqWQAACFtEGrr2au1nBePLnmyAAACClLZ31eHp09HHfLlryy5gAAABCLRYu/Ty3183OXMAAAAAIspKa16McLMgAAAACwKyWaVkAAAAAFAlli6zAAAAAAAKljTIAAAAAAAVNZAAAAAAAAAAP/xAAxEAACAQMCBQIFBAIDAQAAAAABAgMAERIEIRATIjEyIEEjMDNCURRAUGBDUiRTcWH/2gAIAQEAAQgC9eYrY/2WQ8QxoOPfb+xHdvUGNZj3BB/rzmw+Vk1CT8gg9v6063ogj5gYiuZ+Q6/1pwB2+bc0HNZ1kP6u3kfmH0XNZVnQasl/qZUVh+LH55q9XoMbVlQkNB1/qdhWFFVNFD8y1Y0O3ovQkNCRfcEH+psAaKH29W9beq9bekSNQkHvcHt/USAe5jPt6sasa/8AfTer+kMaEn5yU/1E2NFPwbjv6sRVjW/vt6r+kZe2Z9wyn+omP8N0eR1I9v1NLNGfTYVj+N+FvkXrat/bmH3zX+nO6oLmaVpDV6B4K7L2Wf8A2EiN2o8bCsasflXrau3YSH3DrW39JlkWMbyytId+AoH0LK60s6nyBB7enGrH5m9CRqEi+4IPb+iTSrGKkkZzc0ayN607D9GbFFKXKNuVPoBI7LOw7rMh9W1Wrf5F/SHahL+Qyn+gzzrGKdy5uavXeiNq02WBqeYttQQqwyrOgQfSHYdhqG9xMhoEHt6LVbhv6t6v6Q7UJPyGU9v5yfUBBZWYsd6JrvSY5DLUCM/TfpQVCuTgnB5GJo5L5LIhFpOUjkCLGVQDWf8AsGB9NzQmcUNR+RNGaDKe3osKxPtv7+i1b+m9ByKEg9wVPb+Y1OpC9Kkk7miaG/DI3qM5gCtQRtQaNYOlZCKXUIU62iikzZW08iWIWaeMrlzImWzNCnWY7Sp3zF7UD6r0JHFCc2uRMhoEHtxxU1gfbfjfhat/QTag1BzQk/IIPb+U1Op+1FaNx1cq/g6unkBxMdQiwJpyS9PC4XIkhl3ifBr0Y9rxrPMGWw1CESB+XA7IIWjkXOl1MgYXWSBwgbkgqXTCZRcyNiAKEh7UDxAv3kfKoztWRFLM4pZkPcEHtxxFYH2/99RUGgtjfjlQc+wk/IIPb+PO1ajU36UNIbNQNCRhXwW7mE/Y+S+SsMCa8IBWiS+T1LYzAK8Azs2Edg1IsO60EgwQ1hpc2BtpMUoSaVS9O+lxRWtEQbWljIpJJXBZ3LSOTV6Rtq5ljuAr7q75EIuQ5hDqifYCTlQNZb0CRSzuKE6+4KntV+GC1gfbf5WRFB6Dn2En5BB7fxZIG51Goy6Vo0T1Ujcb1zD9xi071NFIV+HH8LT2OEv2xx/YeQpTOv0a5KlfplObV+lUKlfpRzCtcheXnR0q5qo/TJeQ1Hp40sxbdJLdYchbfkKQAWSPM07i2CX+IKk+obJHCEEkqPHPCVkD7bqd/Rc0szilnX3DIe1XrY0UHtiw4X9FvRv75VkKDtQkHuCD2/h2YKLnUTmQ2HA5U1IaB9NyKz/2MUDeLaeUeJyB6vasAXNuVPZawl3NWlrq7Ella9cxhQbpaoytjcRKd3VTKxNSOLYJer9daaDnSEuZIObyjq2dY1jjOy2pMibAXAa+QtesxWXoWVxSzj7g6HtV6spoqKsavxtRHAVYVj+LMKBPAMwoSD3BB7fwbsqC5mmaQ8DQbenbLSLkC9+kafI14NasqB9V7Vn/ALGLTtTaaQeFpVNq5soBUjWSZZMNSMArc7TMzE46RsQraXInlCFx3QTc0U77YIavQ8q0LB0lirkYyBa1bLiqRJm/ZmWNcVi+i14MP08gJsZMRJp8GxXMDajsbG9DhellcUJ97MJIz6MRWLCr/nasasayNZCtvawq1bir1eg5oSfkEH+AkdYxcyytId+Db1iaEpkjxeN+TLes1k642uZLUoGeMmDx71esqB4NcRU53HG9Zn3MenbudL/1mKZPIG53x/AxYWrlhUUGSS/StE0jw2bNo4fsPw49hq9QCCThM3MVMScBLp4ImYUjfCNRtjE1Qo5kyXO92qFS8jNXxGkNsGsCzMuPTzKU19MVkcr0DSu69hqD9yyxmv8Ay9dJ7mMe1nFXFFb1ahe+wuO962plvW473q9XFBmoSfkEHt+7lkWMbySNIbngTXYU3TsQ9nuZRmuQ05KsaluCTUSmVwoctHIcRJc01KaBqb7VqWkO3qyYUeU/nyU7KNOTL1zSEnGiaAZvFgw70vQKl7qtLFc/FZyNkiXlLm85tixRvhNQBZURZWCRiNXOEQFLisBpTlsHkAHTvy6UEh6jXljN2N6NI1DiHYdhO3uJkNBr9r10msPxv79ND0d++KUFFY1Y1erig7DsJPyCD2/bzSrGKk5r71/7XejStGlnYhiWI994yB0FwY5KcZJUNo43ao4+c2TOUQWXdjZUg8ciYwbU4+9WNxSN8hRfctMAdskcdTQK3gYplNcxrWkxRjdbsJQx8r149BhU2yMj5Ptq7X2U205qEYx8w/UlAqdrm1RH7FfbqVsVRQQaiUBc3ZixuaahmO6sPUCRSzuKWdT3DKe162q2/r342q1dVXpXb25g9/2k8wjG0jF73ic0JP8AYpA1NC4HSVc3FYr90bODs+DksjX5amgebDaoTtiW2NirkLgvKkuMuYEFotPfm8xnWktyqKtVmpHt3yHC9XHBVv3ke+weom4BjTCJ/N9PfeNuav1FbFg8Sh5DvI32rbrrVtdtkF40Wp2u+IR4o91IyOYTpieSlcUXLPlUUVheR3LGr02VIY7bvMpHBC1XHZtw2JJoNw29q3pZJBQm/KyXPG1W4jhat+JoDemvSkjelkB7/sZ5wgsrMTuVu5sG6DSPfgGI7cz2Yw6Vuz6WW3QUKg5rvE1RuUam6WVxOPes44vAu72B6B4iSTYRLz9hUl8IwQSaEjqa5o9/gG9mjxFxOcThQNrGo1y3Mj32BNDc3pY3K0qyp5Xq/DJqKQN35XTaMRFTeUkX2nu77L8NBl1EZnp2Kn3qRbFIqfl5bQ3IJqRyx4HvUUgXZ8IX6aaJl7J+KEQAu7qrZ2VpbEC5rI0hxjzodqJ3oFeG9b0srrQn26g6Hjat6v8An0j0BmWlYH5884XZSSac7VA0cSANLFG/0yHjO6uD6ASO3M9mwgN8TpH+3qS8br1xUDi26vEw6sLeDPKtc6Wo3a126VuauppY8/EoiIVDe+MhycsYYuZuzvfZTXLd6jjdZgGJBupU4p1bDI0A53AYjyvVxwDtTCJ/JoATdP08gO8zDsBaoQOdlSdnkqMczu732WjXvXvurY9EgzXExkhL0ers4DC4vbarMbUsRNryMM7FWj2yz0oArmp9rE8tDV7jgq+5lfKkalmdaWdT3BB7cLVvV+Pt6lkI7gg9vlz6j7VJvwlO9Zm9B2XvztPJazwbCQHmJ3D/AJv6LkduZtZsYMriXSP3TlOO9pFtS6hgLH/jPTxOVADJsuJjRDY6Zf8AkCmbc0I2soMcaNcs7DxWiRcCpRLdanzSOOlk5oIMUfMkxGqR4JLAWfqiWZ8gktoiRRa5YlCSK7d8h70CRRKt58pbWQxSKjAIjNiocgDBeDcBvtUdz0scY1tQV26meeFEwiQu2TCysL00clqjsgJJ6uyJdS5Dxg9BCd4kCyx40GaNrMI8mDCR77K1RniGIpdQ33LLGeF+GIrE01D1bjsJP9vkzz32XgTRW/ewB2l9qiRnfpyaI9KzozNzTCrYmIq6bUJPzf0gkduYfuxjY7PBOAMW2uGDkdl1DHy9605tlRaxvUbyyginb7Vq9CzNuY5MByp2UbCDLqtH8JtpZW5nUyhFzRXedGamazk0IxJk1GRYo/hgPILgPZsNTiVF4w4NX4Le+2aBqKRt2aKQUxtQEJ78pftWPq3UljhHeKKxIkkJBpoYyLCPlqzR0bB+pJHiN6WSBo7llFliBkYIIwFWLTln3vUyLFYVGGlaxcgDBKalNK3pDsOy6g/cssZq/wCOBX8esEjsHB9TEAXM85bZeBPA8GN60/LgFm1MCtvFfelZ18V1B6w2EEpUQNHIh2Eh9wwPqBI7Z3FnMGnfs2mmXxO2xi+iwVNOXPWzC2K0Wrkm15ekNZFkLGxMbvNs5SCOwjLlejGK15WlQlgsYdY+oNnABUDImJMylJOtOwVHKvL0kJHZFUNKeuVOV3HOyApjiMQ9I1xQJFEhvM6eJvAwSLvQVj3OIVhReEZBW1D9VLJKcmBAn3VlHlIrAkqSuOnAETsZqvjLYTc+I2aHIybWiLhQcY1wSjRq1LQ9Ydh2E7+4nQ9wynsat8gMRSlT6NRMzNbiTw2omoXh5TRtyza5LE70k1iKeOCb6ZjKHayt2IdaXUPgYzfTTtRgfDMZOnkrg+sEjsWVvqMgxAikBwASjQ8rmSd2NR5Fr10l7Bjy+lMEQ3n5ztZYpcQcBAGw6piMDWnRhs0Tx52eQLKgxcSILOrYN0JA1mkkPMk3jwlyGTtjeu9PSGg3EEiiVbybTxt4GCdDcHllbvmosUBJ61uky0yMj7viVpNjejvKtpmHlIOTleI4RXxPpFCh8m5oSMKGo/Ikjbhf1o99jTdjTx3N0IYeTG1Dc7x4sjARRPLIwVsg+4zJAAvH9Ro+YhZQoBOYBAzRNR4LO0SSBmTKVNnxgkF0aGVKWWRNqEsErkyGC6q4+InkJB7+lEyp5LbIkrVkreZijPi8Mw7bL5jFUJji75UHkIbFit+iICNKMCeUnwRtV9JllTSRZpiTyNQJUgOcpFBnvg3wYexZ5GS8zzCyUo5Q3ftWnZMwJNUhuavX6aTlK1cifYjCW1YPesTtwzsbDIHzMMRviYJgthZk2ofG8mLKKYbBwm7g18OSxZfhqaJJ7n1Ch80MRSzMO6yI3a/pXyHE7Gg5pkgfu2mQ+KCaB8qLmKTmRSyRahrlGVDRXmRZKqP3QkHIyld7qWDm89pI7NSTq7DnvCrKr0JJofIPBJsW047raaPcLqQS3O5UbrHyyssZIAkHY8ETLu7eyml869uAJFFlbZzBCfCaGawCJfO0kcZL3MjAyi/wgtMRe6pcHmAiHzEs++0a3ObSTE3xW4br53xVxnmub0aY2FIpZhWUnTk2mkBo/qmQLQhkPlyl+7CL3WNbtf2o2B2AvXtermsvzjDe9PEXFFWj89NbKow4JLs2R4GjQp4GSISENYggGN9iyMtCr1f0ALIbI1wDWe1ZVlV/SsrDurhvG9DhH34ahyqbH0ZGjg3dtIL3jeKRPKCUq4qaMhslEjBTQeM3oxqfBc4zkmKMgsgnR+kFmDZtp+o4okyC9LzCQrGLJXNfpbAWs6krRjQ7VulQKZNy7ey0Wr3pW9IJFEq3mUjZMVfTtjSbPizBOe4qMlXqyDegOZckEYrUUcjNTaUHdQIokGJPuRduzAA/Gj+pkrgsMalx5IegXkbZ1xO/Lk71j3NK1sgY/qKKc/ENullKMtxHvG9xvkKvwzNGNJF2ILoLEMO/Bn9qDb1K5OlVaXcWpgRsVlkTZwFk3jOYNjQoAm1d6IXHKuY0fQ1oZAWBiZNjao1JBvkQFur1er8L27LOfvBB3FJ48NQmSU6ld6yq/pyNNHC/kI3XxePC5KvBXNiANuenSK/VLkWr9QuGNfqbkV+qbcj9U9gtc/Utc1+olrmsaUFrWxzNqii5nZmFsVq3MkWOp9Lt0MCtKd6B9YYiiyt5mJC2SNDMBiD3sWbbEMWJAVMwmJiUxLdyb1Kemo1MlkDIBHalOEpFKqlskku5tSOAazb3SVY5Npo+gFD7KIYniluS3UzHpC5FTzJApVgBJiSFU3RrUGpVZt6drDFVc5UHNWiajC32yBg3VUbkrgbfCFZ4V0NSo2a0s4IVZmhBUMnL3IoQmuS/TRicZGnDC2QRHjJUPMinP4LkYkSIc6kbJqVWPYC8IYs9K9XqNb7mBQZK5fo1CBNwQprA+247g+rKpdOrj4RRhe9rkVgbXFmU0JB7/BYAAxfhWljDAfClwAMbDtc1plzSnYeK8M7SEhdVLiVCcqYWkbRkbgpKtZ/m4+QGYUSj+baWNvppHLGGLRBt5JWNzRNqeJ8OY0AfPIc+YdisUo6IEZZJMndj00gyNhy4sY7yxDK0afBUZYhGDhZGORbmI31nhJ6qVlTDDJMiy8lje1mDWKL7UzWFqNfdStwvWXsxhhbx5E6HYNgcqeNS1g2S1YAXUXNJzo+tA8EoCu8LragJKCTntysMubzIVkTlShv8SwzMdlleMLe0MnUJP1C7Uj+S1/8AKl2kKiFWduEMgjcX9GpF4uAqTe9Rm9X9V7GtSn+RehzesWFrZ98rRnsYmHa7AkUJ7sDJ8JlJoxyD4aJDzmN2YWxXgxtR3NR6dl04anU1FqZouy6uCT6vJhl+nJpWXt8VO4cVf5Ct7HJLYnlqfGWOYG9Es0dRSm4WmZwLJI2AVqjcT1JZDZtPiXYhd9Nas1Xemv8ActghsqNy2WmWy51d1OSs0Uvlg+V6UTkUyqfIKkQ6Twa96U0D6AxFZK3ngmGK8trWkeLEkECC+4aAY1dSDYNPBsRy5N4i2oACjkEs3MA0seNRvkMankmO5ADXqTaRgE1LbhisM5AQo6dQOUsxwRRGgUE1e7UngvokF42HAVJsTUPvV6vV6vwvV6Q+x1EOJvWZFB1a2WKtutpUoOp2YojAlXR0O+lSR2uGYWxTjId6XyFJrSO+cc72Emj/ACdM/wBvxU7x6yZa58Mn1Dp45L8t4ZFNZOvkHFX9XvwDMKujeZ08R8Gj1K9myLgGP7r8ySchTpsRKQIPCVTCRky0QfcFFW1CVww5PLmcMThFHlfmaZbW/UPvgWd/KOMRjNib03avao7SQuh96DUDxCsaYY98hegzCskPk2nibw5BQC3xTlREKscyy9OMc/tKRp95KLZNchkFsWOXUedeQEsM5mrFrVyyAlkmfoBRFXejTtWmiyb1SDF2HCcE2soXAAFDw3rKhci4uGa1bqdxXktjLGBfNo2FiMiKEprKJ/Plm4wjSdntNbpwj5clYPRDUafyobEGugLc5VHqZk8RrCfqiTSPTaVHF1bSsKxkU3pdVMoGay6aQ9R0wYBkMciVmQbEOD6Pf0hmFEo3nyI9+WYpIlOOjvmRUJPMcUhCzXIEIks7yQJkAdS1+kvKRc4iGHKnEcouq9Z6Yl2ykY34MQWxonaoHwfKtRGcxTLakar1JdTHa7t5TIyBaU7+gMwosreZg07eLaST7WjlXuGDWFNGoYqAlgzGNr3WnXe4j54U25Egvdr/AKY30sXaRqdqjW+5gFol9Wohz6kII2PHb3KKexXHcx9mpu9RnNLFDY2IplDimDo16+G+1NGwq5rTpJIdslUWBkas3rN65jVzPyeUfLlaU0dPCRsdGft/T6hCCJFN7qJLn4i/bh+omvZxqIGHXjp5D0tpmAyrCVPFdXKp+KG0zrYtpb/SxlWhJ+ch8kMwrJT5chM8kmhlyJDPsK5pw63iWS5jQXjKkcuVbHIRQ9Wng3zdjfgTvV/uq6FRzpNNazxr8SArR78EapheNLR3zvWpF1RqPtSN6rmhIff4Rtfk9RMckc/LxoXXu24oLP2UiVfLTxmQ9VM1qUFzwXZB63VH8n0o+x45E8uJ37gb1MLNUQONOtxekbg6B96kQ/esjDakhE5uOlIRy6NXq/ru1ZtR5beRg057ch7WDQ/kxuvZZJYzsNZ/2Z6ZlNHTKfpcuaNvhjUPbF/+LMdm0z2yHxF7hxQPyQzCjyn8xDjfkyRyoajfepe96hDzNTH2HCWjbChvFUUzId+iXqSdLObVHBORnU28IrF1vTnPTBykseQD46dwcGgYdikwq5926dqLUD6AzCsgfMCH7ZE1O+OEhKJSKEQKCa3Y0BYWobsPlvDE/d9Iw8GVl8uBAPcbUKdbbhG4Ooe1fp2kf4krhUxj07B4cGKlTYn52TVkp7mONqfSn7GRlJrIik1Uw2oaiF7czHTyNty5oxlXNkv8e2mejA4sRk6+QYfKDsKIhfzlhtjgelAF4E71iJ7JTAq1mgIDWaVQt1qISnaPBuXbUg6eIfBnlL2ymP8AxhbqNaUnlkBV+LhXMHSFjUXKhpJxUL5Pky9T3LeVIav6rmlvj1U5pFxHCEXlX5pse76aE+L6WVe2478WXE7K1+HcWOoRlqJrUrhhZ3Uj03+Zcir38mggfs+lkXsbg2OXakmkXt+qbYvlpWDXETbGImQMeZjCexSRO2fsb/IFydieWtqWY3NXQ92jyHw+SOWEDrIj75LMoWouSl8laKS1POI1xTmsfEnr62tfZ2H6cUjgNcwOvMsQQuo2kHw0vG4VbhZ0UbrJC7AUREha+OmNq5Mf2jTtamhlG9ESqN8t7Eb9jjH9SJSetyaZtqjX3PDSptn+wZEbyfSJ9jRSIOqv/WBU0rcP/ZNP7xK1qjl9i0YO8f7K5FERv5vpP+topF72NBtySG6RZdROr2oTadkswRGI5LRH77lTQcVer+kDljdj3q9moHgGNEqfIwRN2bTy0A4Wxx2JGZAxp5MuDX/TClRibVHBYJzHmRMsJCS9ysT8oFpkEe1CJkS7o6SJhNLGUO+njvMAZpHXsd9KL8+e96R5pDTFIgVEUZkYl6Y7UBm3GNM3xobD9kami5bcP/hZSvZX4yRpLTJJEd0ktV0k7shXv+y3FXU7M0d9wyxX6uSp8eTMuyb2xr4bX5Z5seLLzSVsxtfpVqvV6vwjWwzZjc0zUoLvZV0qJBtJs1qRuIYis/8AayfaY9tzp42JEZ07rvSquHVzkjI5bBzAHZQzRsa08Cj4kskpBqOEhg0i9d1popAfhl8w3NEjRyK1Ny5FqTGNGRIoSQHaSWwMUcMbOdwAosCaO5tQFhx06Ypc/s3UMpDOhRrHg6W3VX439i+n94gxU2KS1ij+JBXv+zurCztph9nL1Cnp5knaTOBvNen6PNQn/kMIGkwp9K69ute4ar1El+pnb3r9MVizaQb1D0oxrT6l1Nq1C59Yvala/pDEVmD5juCjZYm7Jp2bFGDYbaZWF6llt1BXsbhJbjeeRcaSSZBZrxTb1JAe464zsEX6rvIXJxCgYsY1wXg5pBYXPDTx5tkf2ssayLaiCpINZU0YPa5XuG4sqP5vA67or0sv5wjbxZWXv+yBIrpbuwmB2mlGVkiETsRLjHGWcb2JPNkBFJPp3+rJFBcYwx5PTN7BmsRSa72kljV+pUaNBjOIoiMlycKqPKiOxwsVNjnWVXq/oDEUSjfU5SXBikEiIuFojfLlxhb1hEe0EaRdZ1EmZq7LUepb3+FLUkLUGVFBGnS/xXp2pFvueEaGR7BQFUAfttRFzN1P/wBNKbUQG7lWSler8L0yRyeTQSL4B/ystfCajG47fsgbU8Mcm4cPG/VkcCKfC1loVCjSNYGyrgtSnqrKop8ek9Dp0vE8chWhNItriWFj1YKy3VoWFWt3xcUGrKr+kOwomN/qGBT4SRzZC8b7Mlcv8hEx3xgzKuzR/ZzT4yiJJN+DGgCzcVVnayxIsa2H7jUQ59SHgODRg+N2XuG9DBH8205/x3dfNZPxmjefLU+BRh3/AGJxcWeaBk8bm9XZqVSwEaALEmC8JeCIXr3tSTujbgRSIoR4nRqGW9hqH2yvA7G/LOOSMBazMhXZb2NqDUDV6uPQHYUeU/k8F7lGWZT1d6yCjZAXYAIoRAATR3NqAxHBEdzZY41jG37qWGOTyOj/AAulUeSqqiyy6b3iP4Yx/wCuRHcN6L/kwxN4mOZKD0JDV428uUp8Sjj9gDapoVILIewiRFEKWHGSvegV7HqY7zedKrsGIj1Ei3ADaaUIKbTn7Rdb1uB0fqDtmDC77GE9xYL3E2mDCn1Ehva9IfUHaiIX7nTe6Qx4C5pzUa234KCzBQAFFh/ASxpJ5SQSR7jpbuYyPHIjuG9FzRwbzMCn6ZSZO4ehIayU+WER7GFvtKyD1Xq/qT3pEWLJqJvxY2FbsCx7GluxpUIF6bIndFLdiO3COWZeyyxSBBJyTcvFgLdbIygGlllS9l1CkDLGF36WgYUVYGg1B6y9US+/BzSLc3PDSp95/g5II33qSGWPv0nvy/8AXqHcNV/RkaPLbyMEZ8TDMO12HkHoSGuZfv8ABNctPblNXLkqzcL1fiLnt4LRNzxNSt7UCBCBQjUrUYtXNxe8XNhkTrbTNY8rNwyZJyjitcphZkdLO9ZshOA1McmHN5eV2Ro/uoqa6gKSeRbiucjIMjHE56GgcdjkDag9B6vV6jXOv/gNebV224KpdgoUAAAfwsmnjfs8M0dXHuUU9sWFXq/pvWRorEe/Jj9uS/tjKK398qzNcxq5n5yT3+FXwq+FStkLh2ufRkWeygwtlnygR023rbE2D4NtzQXuUlKkYiWOQWd4P+tGkj3pJlIVXsjjINALNa0qnZdTfDnmKOX6TRlT1BQQa5Mh8SJcrtHM4Y0kkJXq5CP4mC1OMUpcpGCKoCKFU0xvsFGI46aOy5n+IeCJ6fTSr43IrpNGP/WzDver+u5rI10Hvy4a5K+3Jf2wlFAPfctbvGOYadh4rxlb2oKFitTKb79QtUSkmnOThH5FwcCpFYmhHJ2qP9Spsl4ptic6DEGkmIwDLLE5cvLAMEIOSG1Rz3uHmiK3sGdey6t9lLamB7iS8ZfZOdGDIh1Bktec3kxEMfKTgzUi23PCFOY/8Y6Rv5vox/jeOWPyyrpNYfgqwq5q9X+Tc1kayrKumrR1jFWMNcrT1hDTiNzd8IbWrCCsIaGA7bV0+4xvemjv4PBMvYSMoxq0TivB9wkTWxzlWmcy+eMO1kk5dFdOd1w02WNSJpwOig8iginkRyrLpov8j07Ui3NzwAJNhEgjS38e8EL920Z+xo5k8sjVx74oa5f4xcVvWVXq/wC3uaYRv5tpFP02imS90coTUih1Bo7Gr0BGbVyJGvgQ/wB7KnsAEXLhp4uY+9MaAzau3HTxYjJv5J4on7tox9jaadaOS+WRrIe/RWC1yz7YvXVVzWVZVer/ADb0PTkaZYn8uRj9OWIiihHekybsqzY1KHvvKcjsiFmCqqhFCqaY3NqUYjjBD97/AMt3poIGptGv2tpJh2MUy996yNZ1ktdFYpWC1y6wrBqwasXrF6xesXrB6wesGrA1hWFYsK39x6svyUiapNK/t1RtSPetm7zRYbrp0KJdqdqjW2/Dc9oYLbv/ADhCnuYIDR0cNHRfg6OWjpZ65MwrFxW9b1dqu1XartV2q7V1V1VvVzW9bY3qQnIGh2+Rc0cG8zpk7xrHIO/LW92p2pFubnhpU7v/AEbWDoX5R4jxqXuBQ8avV6v8pjXk1dhbgqlmChQFUAf0XV/S+aD00N5AWI/BFW43439LG5pFxHHSpsXP9GkXJCtMCDY/LFWq9XqwoqaNX/Khcb0JVyIbFT2xYVer11GlS254IpdwoAAFh/R54UkptPMtYPWL1i1YtVmqz1i9YyVhJXLl9V62NOvVX2U3lS9qvV1q61f0aePBLn+qMqt5PpYj4vppV7bjv6For1UPXp482uf6w6o/k+kT7GgmX5aqXYAIoRQo/rbxxv5PpB/jeKRPL0jhBFgtz/X3hifu+kP2NG6eXAVp4fvf+xvp4Wr9GtJBEn9+/8QALBEAAgIABQMDBAIDAQAAAAAAAQIAEQMQEiExIDBBEyJQMkBRUkJxBBQjYf/aAAgBAgEBCADO5fy1y/kK6rgMv42uq87MuX8XUrtXL+Lrt3L+KNQGX2tUv4YtkzheUcPxnfXWVy/gi3gQmoaxBFUJwWPIGIICDx2L6Ll/fEystvIA1mlA3hWjcbV53vbU4gxV86hfavO5f3RMGVQrApUEksBwXB5sT2wFQJYPI8QwmgYx2UzWYOxedmXL+1LXlh4uovA6nbOpsYVEKGEYg4tvIdLo0dXtG0I2MxG/6sGwCdCuzO1WFdroriK3AIO4BB6r6Ll/ZE3kfxNIBNj2PU9RgwWAw8XEvc9BEoxVqbeXXTuAErU5N7ltxDYsAWA1FnACjDBW+1Uv83LmqX3Ll3KhMo8q3uCgvdAwC7eK1bB2JNNhsACpsZX0MoM0sJVbwLZLGqQEizqaVSgQqRVgZFyDWRYA0ZYus76rgMvskwm4cQ3AQc3W463MMEgoWYLtApPAWtQh01uNydI8GEyx4DsJrWWDwVBmmFdlBAsXGO9AL+0YAiWy8az4Ug861EVuWOsnhW1doGA9RNQm8tIjKytSLjEbOGBzAANgg+PS/AXEFW10SfTchaC1DQBtGvhtiaA2EuprrYamEVgeKmnK6hZSIdzNgfdsT7XLVR1GlCg2WpSd4BXbBl5k1lxkH3YRsN9fqAOCKbQP4h8RPqTFRuOhl2oCwKlSm3JvTwPwNNAMTuCxJ3EC+Z+dKkjYg71my3PT/OkVsoZeX2006+7ZWJXdRQrO+2DkZU/yEcqdOHiNtbMPbFcrtKuEECKf1Okn3BsQbhcZTyMyciLmm7mx9gonaaRAKXcJKNiqjinDLiOCBpLtAzRSbAJdLokczSQYRtETyZtA4a9IxBdNcuGeovkb9QyOekRsMMKgtRpcqQbW35jBzKxKqDDe/aUf+SXLjtpim9+jSIVN3KjAmpZ8ARno0XuwYgOmKW2gbVC41jSEJ1GayTtLBlSoUBBioE1LCP2phuoYHi5QPIJThsUtQANCyrBrgyAyPU2241mFv2A/T3Ddg+rkKBxGHmLZug5EDg9JFipUa9hMQHVv7wrTVSWEZw1wi5oUmpbcFm00VDa4ABBm6XUp15BEZb3Otl5J8k/+aSwtvTOxVWEW+g9bUPq9O91II+pWOwFDN9qhQ8yzwWCkbgOu6jFP8gwPHQVBhXao6mmgXfEEJY7QI/gkXbLhqCKAnmpq0vpNxmogT1CTlQhS4FHlsIAhl9rQICxDBiCQQA+5ArbpI6iAea0mBmGzUBx0lAYUmkSsQQhYrMIMYcEEHjMgEUdIu4UBjI2mp/r3RzxF4McOKiMCoIxT7khJBBHqEcjEUwsBkQJoEYHkV+ayXqqV0EQbdmgedI8f2cNTwcJhxREGKRBiqeoAZFixMssCCG20zT4DrXpxweITYWWRCxBgxx5GOkDqYzqu0snMdmvsN/Bf9icMwr+EZh03VmD/ACFLaZybmmFWG41BTbYjo2kqXdqgKoDavvqYksbIDEEFFuoxW9KIgG+Y7ZGV998MncaDPYH0wI44GJRprmKf4jXqSgV0sGRMQEQE5UI2Eh3mgiFLOpyEeAL9AKMu669W0VfAAzA7hGQP2GkQAiGjlpBO74aE+03/ADCA0U9TEXkY4gYHixLB4mkTSQdih8jDuKKzArvUJUIn9/Yg8gOuk3LpRGwkbdf+ibNqw22IQ7enZH1oyeM6lZr9nWdd0vUJuyqjVdlHHAYbAnWNwfTf6gGWtK4wOxZcODWu6DH/AGGKpoAn7msr7gVwSQVJuKhXi2jKxgUrx7WBEVbPsZQRFsCnGHhkgx0PhECknoA+4qVnfVXYqOhsOAwI3Kmri3e395gfe1Ky3yuX2iAZW1RsMg2FvzkB8GexfYHwtGXL67zvMD4upU36gPj6ldAHyVCV3P/EACgRAAICAQMEAQQDAQAAAAAAAAERAAIhEjFBAxAgMFATIkBRMkJhYP/aAAgBAwEBCADuvl1F8g/JfHvyXgvjX5LwXxj9ai+KHsUXwwHYBy1DXzfkovggO1Q5p0GI3cFOIemYQR6V4KL85R9sjY2JhJEGRGOMcmtTsaERepRd1+UBD2BMFjAciNzbZzUYYMgwxQBmVqzaaKw+heC/GFYA5fpAKHp2Afi4LRiYiMBQZLMcpioNb5sQBSrRNapw1IzNt0Y/FdlFF+GAuwBgOqoljqq4OnXSTEopcAIeIIGYbOZlS9ybMCv+TY4GVLZQgrVs2L9C7r9KKL3bRwR7C1BpJIQBw8istVnIqE69SpKsEfBRytlNQM/wEoAT+xmMAPJMJB2MRi7CrDEXPkO6ii9QEHTGhywXZynUFW6XCNTYouADeOojcD4NVuTAJzDUTRDiCxE1xskx8QCG36lSjMGaRLY20kw14mkckL1KLyA76yILMZPT/RqR31FKVIE+pHQgymlzXX7jYl9iMOAOOAPJNZpENVHNZR7JzSQYJxjbeoENYYdhD614AdwIemU4EtJ0ncM8mtTDQjwcrbd9jauwAcWcm3AfEUccIBhCHZwW/f1I/wBkgyuxYOFCJYv3EdhHOlaoM6gRMphw0Bm2wMwd9J4Na7E9Ow8AOwxNSmQGWI9ocnBK7hmspTJY6YMNQJYBMCl0DHNQIgORLW7IzSQmemU6rv8ATtwQRv4nx1GDqTVqSCP8lTkGgj6YMPU6exB6fHUilaOHHgzARHAe4q5VDEucxhokLYVdUdYGAagdsiOAwXIIh+9GDGzrb+RoRAAZkbKtt69IBkmuULVS7n0V/R0wD9Mf2COAagZhsTvKE7Q/qxpUw0IyPAFRyoEqKmuMOEfdLAICPicRCaScQ10x+FOpphtQpGCywECcbQEuPSca67WtWW9dS4SsWxwQFGe9OZ9QHB014VhEOT0/0akeDgsRNWZUhw7CVAyYbV5Bw4bFZOYjNLqCIKtmaRDHB1JrleoSCI7CWsUCMGEmsJfrBUF2Mmtd6s+AJEBIn1DBeOfbEeDQcnpnhHwc1FKC8FqufUAY702IlVCEZQYtEDNDhpYTSezI212lbDYusJ9xL3PoBmozUeB1bQdSsChoIaeRJPYVSMAAIRqyxjmtnqgIlRv2Ah6ZM+naaLQVJhHvftcFf07ianLVBh8AIenhzaOCw2iJ/jWpDemtZm008C1QAJgRpwP+1rHb8+txsTp408zE0g7aVBKfyZCsC70I8BewmsHcEAKovasJ5IIMAUJUJf4AhHd+xwWhzM9niUJG+eNX700Ox6cNVEYcbxwWHItDZQl/Bg91tKlxEkwG1d/tOQrCGw2sD+ri25I8H+W/WKuCvBJ0oQXrFzPsO+i42JBwT0yMgaoRU7npjg9MjJXwr7aqEZr1KhGW6tbb/bK3qNjcWjtXY2wNQbhAbra1hK3HN7uq+EfqFiJXqAjTY1W1bjY2GIf8+FUXivEEiapXqDa1zV/b2f8Az2e6+YH/AGn/xAA+EAABAgMEBggEBgICAgMAAAABAAIRITESQVFhECAiMnGBAzBCkaHB0fBAUrHhE1BgYoLxI3IzkrLCgNLi/9oACAEBAAk/AtePH/5TlD9VFQ5KX6oHcj3oR4I9/wCpzFS4aJfpafwc1L9Kz+GP6Tn8KUEf1QUP0nJBNUvhZfo+modB+Fl+iq3Dq5/CT/Q9dWElyXfrTUvhSgj+gd7WDp4IyCrePXqZqSI+EPeh3I/nu9q0vVDcLl3xp3KcNt3AKZMygYYpu12SKJ4Ozac5bppn/aENcoKSI+DPfoP5zXX/AJRoofx+iMXuk/IYBFTMZnJEbG6KeCvm3zW1Y3Wn6IQc4zdl9k4WWTJCFZgdSVT4IwUDwR70EfzYTTo5FA6sJd6geF6gP23oQIpggDWRRLpAvNwKMbN1yZN0YEJ9kmuMcFMMk5y2hCztYLYntu8UdkOg2Cot4zOQ+6OpRU0zUvgzoP5jTUmhZOSIcgRx0SJmuHqnEgRM8coBECUSfJOmZWcAnus1rUpwi47c6Jzdn/jRr/yougd2GGccFaJEo3IkHstK7U1QCecLlvOMZeWkRCcbI3o19CpCiiBSSfaN1nDMGahsiJKhpnoOrPrTFD8toqdRMKLOChDAKAN4Tm23SE1AWfdYo12eGafURDvZR3KtT9873so7gEseM0QZ0wmnQjRy7PZX4j8ImXgpf3Bb0blW9SjTFbo3ipNCuU1D9vR4pgGzakJcih0ZDd13UH4Dx0H8rppB6kByiwlQcMlaHFGd6Mmj5r8oob+4gRZk451QIijCzeowRdHDQDMFxOUU2AopNvd5BSaNO43xKa2zCueGSsjo34LGaEV2REqOsUEetGmekfk1NNcVvN+i7UkbBvajHXunoAK2DkiHKLPeKJgahWXSspt+0fmCH+gI+qcNvfd4wMU5mzU4oltYYQXSW+j6OVo04KTRqGBMwU2IPbN3FU6IbUM1GNy/tQMTfJQjaECr/BPjjHRXRzPrqQR6w6CvDSdB/JoFwEOWKgTco2u0NFrIt+6g9nzDzw1bO1dfDVgU2zwTxzTSpqJvyRIcFLZBcpNGlgus8fujiBgTkqm9PtQ7JpzTfwvn+X2UIDxjxTrRrPHDmiBOhrS7JS+iEhOKOUSomzdnco81SFqSJE5QGy7jHTvfTSUEYfBGKH5FVXV4qeIyU7yAKZK9X3qtydSUQpagbDKvPqWDinGFbJUA3tFv0UZS0CKBlXRG1dBOa38OUc0GSnbF/dIoen8lOO564q1Ej7owjGSjadQXLs/+WKwifugXGEeH9IOIArhfJT+YiSMSXQCE2zPBV7A8zrlTUkY6Sgpa0dEtQx+Kqp6tbm548AjaviMVVTBmG/uzUOA0CdPut0KwThhxUTwToRwQhGn3RoZ9VIIUomg5p3IppyIQtBTOC2oUj5qqo4dxxUbFQFDyRcBLevkiRG71V+ywKmiDcTefstmO9680BahM+KpFU7Ix45agPUTUkR189BUvha6ChFbK2k08L04TERCfI6NmE7N3JXe5BVG60fU6BKMVfVCyDWNVLEqn1uKmezwzQhA2STip9Ru3qg1W8wnDgmnAFOgR3qOK5DBTTi7Mq0LR5IyoMIIPJvcfRQhn5pu/LlkuBxKFrI9y3RujHTRPDOIiiXOoJQENMoytYHPJV90x1DHSUFL4GXwVdF1VLUAIUWFWXjxVppwXqucMFAB1B5q9Ta9vE81KGKMcXeibC4IRBp9FgT4w8ldRQMJJopD7ow2ZR+bNPiF2RPjVc1u3qTdAjkgpjEarYHEIg4xUcsDkcFCtyNvgg8ObNsPNXqXz2scgFOKli6tVNrJD3mjZ6O/7agtNwRsuLoZQyN6ndzyTInxURKNjtf0FIMuNTwRFj3TTEEyZx0nu0FEooc0fyKZftO9E6KGsA5RZFOa4eK2Y9qH0VyAIBjBCcyTmrLroZ/ZCz6i8eeKJHuaEQ037s7kZXjNBVKcxwMzHeJ+XJMhOMcMleYqXRj3JSaKDRAcVEXyvCIYRRFpQOXy+wp6zBxC6SCPFwwUlEDFDZYLWSgLRlwqeCJstqfRSaKDV2ujiHEX8k4ObEuaw90xihEztA5pxJxV0n/S0OKBV9F2sETZbWM0TC9Ne7O5dEKxmrNSZaaKl2mSMfyCSFkmRwVDQD6aJawBUWFQcEwjFBwjMRU1smgw4pwc1sbEPqUDwN6Np14FBlmrgXSKs0reoGF2KF5ifIKTRdovM0IfKc0f8kYprG45rwVktxH/tgjB47OaZEmiaR8wv0yUjgdLQU9zMrkwOtHeHkEwCE3KQbq8kIjDwWY/pbAIJBN/BDZvN553K5PAJUwq7qiQmuLRWFYIOd0fba77UT/4Pr6FSe2mf30Fp6I9/Aqg1pqXx904qMYxjmmxcYTHCiIc5/eLyonHqACiWFWOkAomWT7po7DTZ43d2hsZQtLH3FGHR9r0UmimnknBuEbxiOCnmanNbxuC2n7xcqGqtB0a5LoxsbcQPoobW9DvgqsgSzEUV4hm1TdGHJDDa7UEQ9tTC7iq6pIKnw0Ep4jmrqqZMiVtvnaBopgDdNLKtAjf/AGjBbrhBpzqqFQITdq9Sc/a5Qj4qeIHco/iOk0YcdBDn1MLjgv8At6qQv6kqal1stemvcpucAX87uSMb4KRRMqEIB1qdq+KlEX14K6UepAcFsFbQyQ70Hkk/x58FJorNSaLtOzGjL+eCAV0vsEYitrJb3uaBc503Hy4KEZSH1Q2XXfQpxZEf4+PlmibTZQ8yjEu2Xi+zgp5eRX+znKY+YqDXu92nJs8U4phmuZ1Ggo2ckLXBbsQE6Atbg/8AsmRwN6AEagURwtKNoHc8Yhcm4+ik03Jsavj4ImLu9CzHxKPmjAt2ohNBJvXPrSpqSPVT1aDXq7tKkZqi8EYk/wDZTbijPBSgpsrA96/xiEo0io2LlTqWhyk3tISvbqe+OhsXnNC0+sbiPsjacIbKEIRgpm93kqAxZxxRFqEbM/pCqaf8m4KR+yY3BxaJwUoxMsMxmjsULm+aM+yU6F4tVKBjR0KcfVFhMd1VNVDXaCnEZFbXBAg3MHuSbYhmhD8Obj7xUGPAHOf1URO+qjSuKIwno2zRDjdyQ2nfBhGHWTjOF6BGgwUIwXZEVGSiSaC9f9R53KQFyBs34o7I70Itb35J0Gg0v4kZposfu+gRsHB2iMAYgFCzFuzBQNqQAxwXcpHWpeVQIpoKdDiha4JscQZKMKEXg+YVy2GwgTiok/MVNzsDAhdK20a8V0jcofZPcTGMcvv4KJcDAkoRGGSNmJi053ApsXCWdYklbTqg3K3Mwlhkuje0UY2Hot8+GinH6rebvcMdAuiSqGis0tVTuiEwKrpOiFb8F03Re7k61mKeKaCjZioOEYyQIKh+ILzgiVS/ij6KThIj0xUJ+5/DzRngerbDhJRb4oRheFQiYQDHYo7Z33ZYBQgEYQqfFMJ+WCMTCMAohxEiMaz4rtUh3qcWwiFAxo0fTJTHyrZOa5QopziIJtpzhXMBODnukRfGqjEVVdO7eVQazQUSxCLB3qIELM7kN3D6qbfGGaBJvy4IQhMRmg03OCk2MhemiEL/ALK4ibVidrtc1RCQ3UIGEIakxCzPBWTGmK/1Tx3rpGiM+a6Q5wCJIY2Lo+Cx56d06JoWSiHfKKJpsn3FQwHFUbT3lrFsDcrlJ+N0VMCp14h2DvLFXdTtBHlfrX6wT+RTXcRRETllzUsWqsVXFEG8u80YwqTSaBHSOdW6EfCCMLJk+5dE627c/rALs77vNPruTn/JBpMKj3NN3You2iJ4XyT94AxcK3RVkWTZLskbQyW4KnyCk0aKdQ0ORse6KbryNB2YSJQiLwnWcGif9IQaIRd7vKneIicMrl/jxMJ+K6SPzRTRH5u1oLRxQd+2yU7dugnbs0YEQbDEqMr1aApaKmMUZA1yuRkVSpU6XQUA4KnumsA3EruQ1ZgX6dvow7dU3nsYK6pRTgnjal910kIx9804EwiBzgnDpGtdu+KMDQNJ09qIZxXLVqp5iurcqdQ2eITrYhZg7BCA998UxsG9nzXb+ijszu9EDSBEfsmyOZ8Exuz7mmsBOX0ULOCMx7gnHMIlOEc0YNqeC2OiFcSpNGgwtVOSoLuraCnWHKFmpIqTmq5qQ9zWC2Sbyt43aSADvHBDmUJGRA+qMsB7iqDeddFRs5VUHsKiejdvsU270s8c1M+aPCzMqMzImqlcT5NVKhqs4H1HNOtP9100pHTNCzwRDkCNHdmpFt3qpjBRbGacGxmD4pssRXmjGPZHmjRGiEY0+6aZbyDhH6KIeDTEfZC02nArZOBU4TaqVAwvhodCy4jwiNSlywR1KG7q5O+XFA/dX6Lk1uRwKMMbS3Ret19Wlf45TteRzzVBfooTtHIXDmpNGngozTmtfcDfzQPG5CPVtBToZFCK/g3z0ybcmnJA5U8FAPvaff8AaDAQ2zh7Kl84xOJQi43K6LT90DHCqc1zHf8AIBOEFMG9RcGULaqUavHmEYjFtAKKP4gN6hMUw/pDgqqZN3rkq36wiFsFbWbVIP2XNNeKvofdFSiN1FdNSxX+OXefJUMwrUbkTAyiukILRsq1aHiU52fdTkgTK0UQ9puwRgYwgU0EK/HHR2ZBbvaOjtS1bj1lDvjzXv8ApcckIgK65TXNCMBZW+XU94J1pu+RctljakXlSaNUb8yqhOMMEyeLU9rsjVRb9EOq5Kad3ppIyTjFvZQYM0KT98FJ0rP2Wy9u6cPt4pphd7KtUMSfsro7MPqhad8ooBgv/wA4wU2V6RvmEIkkWZ85cV2DZd5IiBFogU4IWHE1u5KeCDWyTouoA2q3jXTfTXaCnSrBAn97a4BuQV0pU7050BQwvTXE9vDkui4OjRCRbejZLRadGsVszjHNPaICJjSKJdKLx96IkNBt87grQBkPSSN8ApQ2YcFtSvUiRFUqF25++GphqYalOooUZGmgIzNApw3jchK9cm6C5rRvu8gpNGGrjNAQuGSAbaMk0jMIgq0EbQwKFnMJwIGHfFSFw+nWNCdZyUS26C2iL/7RhgfRNtPjI38EXU7AnwVusbLfqVOtlQIFY0UNmoE4xTS27NVdVPlK0BjzTY3xTRyRIQ27tQwLTabrBFvI6WhOhkmWzfgoMDuyE5z+GPNCBFTim2r5oQ6L5bycFIZeScfspkzs58M0KESUZxMkOKlsW3nJbYZd4IQJr6aaVOtcdMslPVPPTyVbgPLFTjOWkSyRi51BRAWYTccMk2DRoCB1DO4DzKATnD6LomOzEinO6PjMeCsPzYieBVGraDaByFkkbIFOCIfGkPTJT6xoKdCNxTYx7YVudzZd6tzub5q521kIp0BimulSKDQISUZIB3SOhX6BAB8I/wBrZcgIjd0yVVUHZCLIu2sBwRbyOn5AiXLtCOs0FEtTg5NKmG0HookivvJdn6q+/Bc+KjAbxGClfyR7TWcgCV/H11L5628PFS1ZKmmt2neG6UbL/l9F/jN63fm0SAq5ThoKKggmBNgnEJ4Qa6Fy6N/R/tr3IRuTto1uRjCsUwikS30T25A7P1QP7fYVTSCAfGEY1RLHUdGigRWLVTHrBzTjmCmSyVUPxOiMo9oZRT43wwHBVC32iBx5Lf8AqVQKmnFN2HUc3eC3B2s02LxtknU/xz3jfJbQBgQrtnLkhWnUTQhCa6StU2O0XSUlRByiCeytwb3HVw1xFO7008eorfpk8bpRg6O76LdwWy0VVLurOhgUWpwc3Appbwopm4DzURfBNa643f8AiotdMzmEWujUtNyJBbfRMa9tbRwRsSo/Hit0YTQp1jRxThPea6hGCafrp2Wdr0VBqiLscF820PVSfb/400ivs6OjdZE40+qfa3YN5eS5pw/Yz1QkBAp1KBOGMUOSBW9eNYpocoNvTgQflkmkOvK956mI6tvMI2uKBGm7Wk4brlKBnCkMlIUXL4EK9QQI46DEG4pkP9PQp7YdkGU0XhuA8OaYHf61Wybmv8kYxpgh1jeYRLvRU00oVD8W52P+2a5qhmpOzwQcZ3Isaaxq9MF0ekfMwN4CcSb8I5JkBszvjDz0MBdibm6IAGQU96aNoZreYC70W1e4H69bXRx62ai3gtrh1NMdHeqY/BAFbOS2uC7tDiLwE1jpSNPootdWcwn2rVYHnRMDjfCSi0zrh6qar1UzoCdPNV0QYWtMTig+1cUDDty8VBgbAGzWGMVX5swa81Gt3fJUTzalK4BCOIWw0xtOFYKMwRPMQimWDQnE4oTsluWEkGnJQDne4IdKwNonzfvLpG7PiiMQqDeKadE0Nv5V/Ea19PgBFGGRQ5jXp8vpomF3fCNR70CBirkN73FE2oz+yh0sK9qWMaphb/r910gF4BlOl66OOYUx1G8dYIwU04tvhipwWBHfVAX6GtsSn3oVTg2Jkq0tG8IgmslZbGimb0BtUyR3BI+M+KbZot0bXguSdtEElPdGgRE5GKAt/OPJTGOOtz4fCbpp6a8nYrvu0SOKpj8IFB0KA0TSDcLhwxTok1w4qZvgmiEY2785p1kXfifaSt/uw5ZJoeIXVUQLo63LTUrafefTWAKPJ0wmRN72+icINnP7oSO6jACoPkhdvZoxmYIRxKiflYK8VtdIYUoWn6IRyUOBW1CUfIK7d+y7lukS4q87JUWtBmVNkYoyhGK5a1XfCUK5a8wv+vpompHD4UJxCMV0cW4D7KWQxXShuRv4roK7vSdHJRNwccc13FDTRUC3neGWjedIf6396mFz6gAp5FndaZt7l0Ye4mNtvonWb9qU1und9ELUOxijtVY6haR2SFCK+qE7sio2T9MlAG7BraK+IbmifJTbakLypNuCAtfKq1dx0107rfr8NW4qo011RzW0PHRNGC7/AISRRtDNQgO1jwVrIiqMWgRHG6KxqnRhimlh+YTHcU9pjOIW6FRcUI6OjOThVPH7moUqb4KEfdyrf1LQU8tIoDRAucJ/iCoTzajTFSinEcl/k6TsnsjPNGOfpho4E3wUGnwAxKjNH/IO5VO7663M5Kg+H3hq01RPFbQ8dE1slT4fCSKCvhFA2q5aaXlUGpQmJU3l0IFb0EYwuQsxpBEFTRs9U0FP5FN5tpxV9P8Ab7ooyjPLJGEdrI4QTSDmr4EnLBQhHdy++tVfyPxO8PHU564To5FAhFBOQ+CCm3xGiaqTFxXM6vJSUHWhAo2XuMHW6IUrCmicLlsn9yMeCbAmpW1j1TZ4hOE6gprpqa5x0e89XmVzPxdcQnpxKAX/AF9ENea2ChaGWkJyHd8DXJbx3+OHJbxqdbkrGRN/iqqgmjJwg5D8M7rjd7KgQ29NtRlE/wDqnWojaAuyQEjzRIjip3IQjUpkGjt1iiAP2iHUiBxCIdkUAHHehq3/AJEOd62m9S2KdDIoR4aCmhEhEFA9dvOJhw1eGiPJdG0t7++9Rl9Fh4aYwcJoWLnEIws3jHPJAjB3rxVESIoCRqjX6q6SEup5a3Bv5JsuxUxiOqaE4tUHJpGgoAoQTkQggetviSnAE3IOMKq2MQgQd1U9UA6y2DcFFlbbkYOcf8QFYYobLa8UXWHYoWbnQ80YtYfvEhCHu9SVyoU2eOScNpXVUdWl+tervybZOXohEYjrGhEhEFNQOg6AmoaZNxVNVs8sU6GEaqSebWBpzvXimg5LhBBrIXhbYhEEKVWoSqc3ZqBe/d/a37LdbIvx4KIjdem0rCuSdavheozREvVCMcEKRmJUU8QUJ+C8ESqmQXsa9XU4flIgcQtsZV0nrGhSTinBCKBGjdFVQau8Zv8AIK9ckWg5zKc0WIwdd6raANdImaIPNkzCEDjFbtRo2mtu94LfdKN0f6U7',  1);

