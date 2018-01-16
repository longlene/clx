# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Send RPCs from Ruby using GRPC"
HOMEPAGE="https://github.com/google/grpc/tree/master/src/ruby"

LICENSE="BSD-3-Clause"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/google-protobuf-3.0.2"
ruby_add_rdepend ">=dev-ruby/googleauth-0.5.1"
ruby_add_rdepend ">=dev-ruby/googleapis-common-prots-types-1.0.0"

