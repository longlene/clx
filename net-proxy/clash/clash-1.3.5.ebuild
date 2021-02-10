# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit go-module

DESCRIPTION="A rule-based tunnel in Go"
HOMEPAGE="https://github.com/Dreamacro/clash"

EGO_SUM=(
	"github.com/Dreamacro/go-shadowsocks2 v0.1.6"
	"github.com/Dreamacro/go-shadowsocks2 v0.1.6/go.mod"
	"github.com/go-chi/chi v4.1.2+incompatible"
	"github.com/go-chi/chi v4.1.2+incompatible/go.mod"
	"github.com/go-chi/cors v1.1.1"
	"github.com/go-chi/cors v1.1.1/go.mod"
	"github.com/go-chi/render v1.0.1"
	"github.com/go-chi/render v1.0.1/go.mod"
	"github.com/gofrs/uuid v3.3.0+incompatible"
	"github.com/gofrs/uuid v3.3.0+incompatible/go.mod"
	"github.com/gorilla/websocket v1.4.2"
	"github.com/gorilla/websocket v1.4.2/go.mod"
	"github.com/miekg/dns v1.1.35"
	"github.com/miekg/dns v1.1.35/go.mod"
	"github.com/oschwald/geoip2-golang v1.4.0"
	"github.com/oschwald/geoip2-golang v1.4.0/go.mod"
	"github.com/sirupsen/logrus v1.7.0"
	"github.com/sirupsen/logrus v1.7.0/go.mod"
	"github.com/stretchr/testify v1.6.1"
	"github.com/stretchr/testify v1.6.1/go.mod"
	"go.uber.org/atomic v1.7.0"
	"go.uber.org/atomic v1.7.0/go.mod"
	"golang.org/x/crypto v0.0.0-20201221181555-eec23a3978ad"
	"golang.org/x/crypto v0.0.0-20201221181555-eec23a3978ad/go.mod"
	"golang.org/x/net v0.0.0-20201224014010-6772e930b67b"
	"golang.org/x/net v0.0.0-20201224014010-6772e930b67b/go.mod"
	"golang.org/x/sync v0.0.0-20201207232520-09787c993a3a"
	"golang.org/x/sync v0.0.0-20201207232520-09787c993a3a/go.mod"
	"golang.org/x/sys v0.0.0-20201223074533-0d417f636930"
	"golang.org/x/sys v0.0.0-20201223074533-0d417f636930/go.mod"
	"gopkg.in/yaml.v2 v2.4.0"
	"gopkg.in/yaml.v2 v2.4.0/go.mod"
	"gopkg.in/yaml.v2 v2.2.2"
	"gopkg.in/yaml.v2 v2.2.2/go.mod"
	"golang.org/x/crypto v0.0.0-20191206172530-e9b2fee46413"
	"golang.org/x/crypto v0.0.0-20191206172530-e9b2fee46413/go.mod"
	"golang.org/x/crypto v0.0.0-20191011191535-87dc89f01550"
	"golang.org/x/crypto v0.0.0-20191011191535-87dc89f01550/go.mod"
	"golang.org/x/net v0.0.0-20190923162816-aa69164e4478"
	"golang.org/x/net v0.0.0-20190923162816-aa69164e4478/go.mod"
	"golang.org/x/net v0.0.0-20190404232315-eb5bcb51f2a3"
	"golang.org/x/net v0.0.0-20190404232315-eb5bcb51f2a3/go.mod"
	"golang.org/x/net v0.0.0-20190620200207-3b0461eec859"
	"golang.org/x/net v0.0.0-20190620200207-3b0461eec859/go.mod"
	"golang.org/x/sync v0.0.0-20190423024810-112230192c58"
	"golang.org/x/sync v0.0.0-20190423024810-112230192c58/go.mod"
	"golang.org/x/sys v0.0.0-20190924154521-2837fb4f24fe"
	"golang.org/x/sys v0.0.0-20190924154521-2837fb4f24fe/go.mod"
	"golang.org/x/sys v0.0.0-20191026070338-33540a1f6037"
	"golang.org/x/sys v0.0.0-20191026070338-33540a1f6037/go.mod"
	"golang.org/x/sys v0.0.0-20201119102817-f84b799fce68"
	"golang.org/x/sys v0.0.0-20201119102817-f84b799fce68/go.mod"
	"golang.org/x/sys v0.0.0-20191224085550-c709ea063b76"
	"golang.org/x/sys v0.0.0-20191224085550-c709ea063b76/go.mod"
	"golang.org/x/tools v0.0.0-20191216052735-49a3e744a425"
	"golang.org/x/tools v0.0.0-20191216052735-49a3e744a425/go.mod"
	"github.com/oschwald/maxminddb-golang v1.8.0"
	"github.com/oschwald/maxminddb-golang v1.8.0/go.mod"
	"github.com/oschwald/maxminddb-golang v1.6.0"
	"github.com/oschwald/maxminddb-golang v1.6.0/go.mod"
	"github.com/stretchr/testify v1.7.0"
	"github.com/stretchr/testify v1.7.0/go.mod"
	"github.com/stretchr/testify v1.4.0"
	"github.com/stretchr/testify v1.4.0/go.mod"
	"github.com/stretchr/testify v1.3.0"
	"github.com/stretchr/testify v1.3.0/go.mod"
	"github.com/stretchr/testify v1.2.2"
	"github.com/stretchr/testify v1.2.2/go.mod"
	"github.com/davecgh/go-spew v1.1.1"
	"github.com/davecgh/go-spew v1.1.1/go.mod"
	"github.com/davecgh/go-spew v1.1.0"
	"github.com/davecgh/go-spew v1.1.0/go.mod"
	"github.com/pmezard/go-difflib v1.0.0"
	"github.com/pmezard/go-difflib v1.0.0/go.mod"
	"github.com/stretchr/objx v0.1.0"
	"github.com/stretchr/objx v0.1.0/go.mod"
	"gopkg.in/yaml.v3 v3.0.0-20200313102051-9f266ea9e77c"
	"gopkg.in/yaml.v3 v3.0.0-20200313102051-9f266ea9e77c/go.mod"
	"golang.org/x/term v0.0.0-20201117132131-f5c789dd3221"
	"golang.org/x/term v0.0.0-20201117132131-f5c789dd3221/go.mod"
	"golang.org/x/term v0.0.0-20201126162022-7de9c90e9dd1"
	"golang.org/x/term v0.0.0-20201126162022-7de9c90e9dd1/go.mod"
	"golang.org/x/text v0.3.3"
	"golang.org/x/text v0.3.3/go.mod"
	"golang.org/x/text v0.3.0"
	"golang.org/x/text v0.3.0/go.mod"
	"gopkg.in/check.v1 v0.0.0-20161208181325-20d25e280405"
	"gopkg.in/check.v1 v0.0.0-20161208181325-20d25e280405/go.mod"
	"golang.org/x/sys v0.0.0-20190412213103-97732733099d"
	"golang.org/x/sys v0.0.0-20190412213103-97732733099d/go.mod"
	"golang.org/x/sys v0.0.0-20190215142949-d0b11bdaac8a"
	"golang.org/x/sys v0.0.0-20190215142949-d0b11bdaac8a/go.mod"
	"golang.org/x/crypto v0.0.0-20190308221718-c2843e01d9a2"
	"golang.org/x/crypto v0.0.0-20190308221718-c2843e01d9a2/go.mod"
	"golang.org/x/mod v0.1.1-0.20191105210325-c90efee705ee"
	"golang.org/x/mod v0.1.1-0.20191105210325-c90efee705ee/go.mod"
	"golang.org/x/xerrors v0.0.0-20191011141410-1b5146add898"
	"golang.org/x/xerrors v0.0.0-20191011141410-1b5146add898/go.mod"
	"golang.org/x/tools v0.0.0-20180917221912-90fa682c2a6e"
	"golang.org/x/tools v0.0.0-20180917221912-90fa682c2a6e/go.mod"
	)

go-module_set_globals
SRC_URI="https://github.com/Dreamacro/clash/archive/v${PV}.tar.gz -> ${P}.tar.gz
	${EGO_SUM_SRC_URI}"

LICENSE="GPL-3.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

DOCS=( README.md )

src_compile() {
	CGO_ENABLED=0 \
		go build -trimpath \
		-ldflags "-X \"github.com/Dreamacro/clash/constant.Version=${PV}\" \
		-X \"github.com/Dreamacro/clash/constant.BuildTime=$(date -u)\" \
		-w -buildid=linux-amd64" -o ${PN} \
		|| die "build failed"
}

src_install() {
	einstalldocs
	dobin ${PN}
}
