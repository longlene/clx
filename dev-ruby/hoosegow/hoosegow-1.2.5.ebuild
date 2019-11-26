# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Hoosegow provides an RPC layer on top of Docker containers so that you can isolate unsafe parts of your application"
HOMEPAGE="https://github.com/github/hoosegow"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/rspec-2.14"
ruby_add_rdepend ">=dev-ruby/msgpack-0.5"
ruby_add_rdepend ">=dev-ruby/yajl-ruby-1.1"
ruby_add_rdepend ">=dev-ruby/docker-api-1.19"

