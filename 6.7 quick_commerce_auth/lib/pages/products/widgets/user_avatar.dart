import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget {
  final GestureTapCallback? onTap;

  const UserAvatar({super.key, this.onTap});

  @override
  Widget build(BuildContext context) => InkWell(
    onTap: onTap,
    borderRadius: BorderRadius.circular(20.0),
    child: Ink(
      height: 40.0,
      width: 40.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.grey.shade200),
        image: const DecorationImage(
          image: NetworkImage(
            'https://lh3.googleusercontent.com/aida-public/AB6AXuBkgv6_pNCWisskBA0mD--tVnrFlpUQDUHHOOICv5tnQZ89DBVnzgxJnCfQVmoz0vW7Dye7fxhwSz1JlkheHajqx6KH17bP14KZOohHQ1ig1QWaaXTvmpZq65HuDY_qHo9rcyp_1GtDj9NeFdZ5FS84FIXb1D68LJW_XS9fA15gwxPgZGoDWBrdV1NVGJl1LqrUatVl7reJRVGNs702zF93-yP05saAoo9VHARqrDRFPid8raj45FS8thiUzr5AZeQW29jTaoIimemz',
          ),
        ),
      ),
    ),
  );
}
