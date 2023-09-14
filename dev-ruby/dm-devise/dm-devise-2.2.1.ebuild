# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="dm-devise adds DataMapper support to devise (http://github"
HOMEPAGE="https://github.com/jm81/dm-devise"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/dm-core-1.0.2"
ruby_add_rdepend ">=dev-ruby/dm-migrations-1.0.2"
ruby_add_rdepend ">=dev-ruby/dm-serializer-1.0.2"
ruby_add_rdepend ">=dev-ruby/dm-timestamps-1.0.2"
ruby_add_rdepend ">=dev-ruby/dm-rails-1.0.2"
ruby_add_rdepend ">=dev-ruby/devise-1.3"

