FutureBuilder(
                  future = auth.tryAutoLogin(),
                  builder = (ctx, authResultSnapshot) =>
                      authResultSnapshot.connectionState ==
                              ConnectionState.waiting
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : Login(),
                ),