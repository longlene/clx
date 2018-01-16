# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A Ruby on Rails CMS that supports Rails 4"
HOMEPAGE="http://refinerycms.com"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend "=dev-ruby/refinerycms-core-3.0.0"
ruby_add_rdepend "=dev-ruby/refinerycms-images-3.0.0"
ruby_add_rdepend "=dev-ruby/refinerycms-pages-3.0.0"
ruby_add_rdepend "=dev-ruby/refinerycms-resources-3.0.0"

