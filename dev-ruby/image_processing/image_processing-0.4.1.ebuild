# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Set of higher-level helper methods for image processing"
HOMEPAGE="https://github.com/janko-m/image_processing"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/minitest-5.8"
ruby_add_rdepend ">=dev-ruby/minitest-hooks-0"
ruby_add_rdepend ">=dev-ruby/minispec-metadata-0"
ruby_add_rdepend ">=dev-ruby/mini_magick-4.3.5"
ruby_add_rdepend ">=dev-ruby/phashion-0"

